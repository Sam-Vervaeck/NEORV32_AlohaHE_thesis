/*********************************************
 * This file contains all the communication
 * functionality required to exchange data
 * between software and hardware. It provides
 * functions for DMA configuration, testing
 * functionality and instruction execution.
*********************************************/

#ifndef SRC_COMMUNICATION_C_
#define SRC_COMMUNICATION_C_

#include "communication.h"

#define POLY_SIZE 8192 // 2^13

typedef volatile struct __attribute__((packed, aligned(4))) {
    uint32_t CDMACR_reg;        // Offset 0x0, CDMA control register
    uint32_t CDMASR_reg;        // Offset 0x4, CDMA status register
    uint32_t reserved0[4];      // Padding to skip
    uint32_t CDMA_SA_reg;       // Offset 0x18, CDMA source address register
    uint32_t reserved1;         // Padding to skip
    uint32_t CDMA_DA_reg;       // Offset 0x20, CDMA destination address register
    uint32_t reserved3;         // Padding to skip
    uint32_t CDMA_BTT_reg;      // Offset 0x28, CDMA bytes to transfer. Writing to this initiates the transaction
} axi_cdma_t;

// Put at the same address as in the address editor in Vivado
#define AXI_CDMA ((axi_cdma_t*) (0xF4000000))

// Put at the same address as in the address editor in Vivado
#define COE_BRAM (0xF0000000)

// Put at the same address as in the address editor in Vivado
#define AlohaHE_BRAM_CTRL           (0xF2000000)
#define AlohaHE_BRAM_CTRL_MSG_ADDR  (AlohaHE_BRAM_CTRL + 0*POLY_SIZE*sizeof(uint64_t))
#define AlohaHE_BRAM_CTRL_KEY_ADDR  (AlohaHE_BRAM_CTRL + 1*POLY_SIZE*sizeof(uint64_t))
#define AlohaHE_BRAM_CTRL_V_ADDR    (AlohaHE_BRAM_CTRL + 2*POLY_SIZE*sizeof(uint64_t))
#define AlohaHE_BRAM_CTRL_FFT_ADDR  (AlohaHE_BRAM_CTRL + 3*POLY_SIZE*sizeof(uint64_t))

// set this to 1 for verbose debug and status output
#define DEBUG 1
// undefine this to obtain cycle counts of each instruction execution
#define PERFORMANCE

// Layout of CFS ports:
// control_low_word   (NEORV32_CFS->REG[0])
// control_high_word  (NEORV32_CFS->REG[1])
// dina_ext_low_word  (NEORV32_CFS->REG[2])
// dina_ext_high_word (NEORV32_CFS->REG[3])
// dout_ext_low_word  (NEORV32_CFS->REG[4])
// dout_ext_high_word (NEORV32_CFS->REG[5])
// status             (NEORV32_CFS->REG[6])

// Copying the whole fullEnc.h file from IMEM to DMEM takes a "run 56000 us" command which takes 30 min of CPU time and 66 min of elapsed time!! Put it as COE in BRAM instead.

// !! CFS registers 4 and 5 can only be read if debug IO is turned on in the Aloha-HE core.
// !! CFS register 6 can only be read once Aloha-HE has been started.

// This function blocks until the DMA is idle
void cdmaWaitForIdle()
{
	while(1)
	{
		uint32_t read_val = AXI_CDMA->CDMASR_reg;
		if(read_val & (1<<1))
		{
			if(DEBUG) neorv32_uart0_printf("CDMA: IDLE bit is set\n");
			break;
		}
		else
		{
			if(DEBUG) neorv32_uart0_printf("CDMA: IDLE bit is NOT set\n");
		}
	}
}

// This function initiates a DMA transaction. DMA copies num_bytes many bytes from src_addr to
// dest_addr. Both addresses are AXI addresses. 
// The function blocks until completion if block != 0. Otherwise it returns immediately.
void neorv32_cdma_transfer(uint32_t dest_addr, uint32_t src_addr, uint32_t num_bytes, uint8_t block)
{
	//set source address:
	if(DEBUG) neorv32_uart0_printf("CDMA: setting source address to 0x%x\n", src_addr);
	AXI_CDMA->CDMA_SA_reg = src_addr;
	if(DEBUG) neorv32_uart0_printf("                             is 0x%x\n", AXI_CDMA->CDMA_SA_reg);

	//set dest address:
	if(DEBUG) neorv32_uart0_printf("CDMA: setting destin address to 0x%x\n", dest_addr);
	AXI_CDMA->CDMA_DA_reg = dest_addr;
	if(DEBUG) neorv32_uart0_printf("                             is 0x%x\n", AXI_CDMA->CDMA_DA_reg);

	//set number of transferred bytes. This also starts the transfer:
	if(DEBUG) neorv32_uart0_printf("CDMA: sending %u bytes\n", num_bytes);
	AXI_CDMA->CDMA_BTT_reg = num_bytes;

	if(!block)
		return;

	//wait for completion:
	if(DEBUG) neorv32_uart0_printf("CDMA: waiting for completion of the transfer...\n");
	while (!(AXI_CDMA->CDMASR_reg & (1<<1)));
	
	if(DEBUG) neorv32_uart0_printf("CDMA: done waiting\n");
}

// This function copies num_bytes many bytes from source_address (which is a physical address in RAM) to
// the BRAM with the id dest_bram_id. 
// This function does not block until transaction is completed.
void cdmaDDRtoBRAM(size_t dest_bram_id, size_t source_addr, uint32_t num_bytes)
{
	size_t dest_addr;
	switch(dest_bram_id)
	{
	case FFT_BRAM_ID:     dest_addr = AlohaHE_BRAM_CTRL_FFT_ADDR; break;
	case NTT_MSG_BRAM_ID: dest_addr = AlohaHE_BRAM_CTRL_MSG_ADDR; break;
	case NTT_V_BRAM_ID:   dest_addr = AlohaHE_BRAM_CTRL_V_ADDR;   break;
	case NTT_KEY_BRAM_ID: dest_addr = AlohaHE_BRAM_CTRL_KEY_ADDR; break;
	default:
		return;
	}
	neorv32_cdma_transfer(dest_addr, source_addr | 0x80000000, num_bytes, 0);
}

// This function copies num_bytes many bytes from the source BRAM with ID source_bram_id to
// dest_addr (which is a physical address in RAM). 
// This function does not block until transaction is completed.
void cdmaBRAMtoDDR(size_t dest_addr, size_t source_bram_id, uint32_t num_bytes)
{
	size_t src_addr;
	switch(source_bram_id)
	{
	case FFT_BRAM_ID:     src_addr = AlohaHE_BRAM_CTRL_FFT_ADDR; break;
	case NTT_MSG_BRAM_ID: src_addr = AlohaHE_BRAM_CTRL_MSG_ADDR; break;
	case NTT_V_BRAM_ID:   src_addr = AlohaHE_BRAM_CTRL_V_ADDR;   break;
	case NTT_KEY_BRAM_ID: src_addr = AlohaHE_BRAM_CTRL_KEY_ADDR; break;
	default:
		return;
	}
	neorv32_cdma_transfer(dest_addr | 0x80000000, src_addr, num_bytes, 0);
}


// This function sends num_words many 64-bit words from the RAM address p to the co-processor.
// It is used for sending instructions (INS_flag = 1) to the instruction memory and
// for sending data to BRAMs (INS_flag = 0) with bram_sel defining the destination BRAM.
// Sending data via this function is for testing purpose only. The hardware must
// have the PROVIDE_DEBUG_IO set to 1 (ComputeCore.v).
void send64(uint64_t *p, uint32_t num_words, uint32_t INS_flag, uint32_t bram_sel)
{
	uint32_t i;

	uint32_t control_low;
	const uint32_t control_low_const_part = (bram_sel << 29) | ((INS_flag ? 0 : 1)<<16) | (INS_flag<<15);

	for(i=0; i<num_words; i++)
	{
		//address_ext = i;
		control_low = control_low_const_part | (1<<14) | i;

		*(uint64_t*)&(NEORV32_CFS->REG[2]) = p[i];
		NEORV32_CFS->REG[0] = control_low;

		control_low &= ~(1<<14);
		NEORV32_CFS->REG[0] = control_low;
	}
	NEORV32_CFS->REG[0] = 0;
}

// This function receives num_words many 64-bit words from the co-processor.
// It is used for receiving data from BRAMs with bram_sel defining the desitination BRAM. 
// Receiving data via this function is for testing purpose only. The hardware must
// have the PROVIDE_DEBUG_IO set to 1 (ComputeCore.v).
void receive64(uint64_t *p, uint32_t num_words, uint32_t bram_sel)
{
	uint32_t i;

	uint32_t address_ext;
	uint32_t wea_ext = 0;
	uint32_t control_low = 0;
	uint32_t dina_low=0, dina_high=0;

	for(i=0; i<num_words; i++)
	{
		address_ext = i;

		control_low = (bram_sel << 29) + (1<<16) + (wea_ext<<14) + address_ext;

		NEORV32_CFS->REG[0] = control_low;
		dina_low = NEORV32_CFS->REG[4];
		dina_high = NEORV32_CFS->REG[5];

		p[i] = dina_high & 0xFFFFFFFF;
		p[i] = p[i] << 32;
		p[i] = p[i] + dina_low;
	}

  NEORV32_CFS->REG[0] = 0;
}


// This function starts the execution of the instruction memory's content.
// It blocks until all instructions are finished and resets the co-processor
// after it has finished. The function returns the number of clock cycles
// the execution took if PERFORMANCE is not defined.
uint32_t exeIns()
{
	if(DEBUG) neorv32_uart0_printf("Aloha: Start execution\n");
	uint32_t cycle_count = 0;

	// Reset Processor
	// control_low = 0; control_high=1;
	NEORV32_CFS->REG[0] = 0;
	NEORV32_CFS->REG[1] = 1;

	// control_high=2;
	NEORV32_CFS->REG[1] = 2;

	while((NEORV32_CFS->REG[6] & 0x1) == 0){
	}
	if(DEBUG) neorv32_uart0_printf("Aloha: End execution\n");

#ifndef PERFORMANCE
	cycle_count = (uint32_t) axi_address_base[6];
	cycle_count = (cycle_count>>2);
#endif

	// Reset Processor
	// control_high=1;
	NEORV32_CFS->REG[1] = 1;

	// release reset again
	// control_high=0;
	NEORV32_CFS->REG[1] = 0;

	return cycle_count;
}

// This function is mainly equivalent to exeIns(). It additionally sets the
// dina_ext_low_word and dina_ext_high_word AXI ports to param.
uint32_t exeInsWithParameter(uint64_t param)
{
	*(uint64_t*)&(NEORV32_CFS->REG[2]) = param;
	return exeIns();
}

#endif /* SRC_COMMUNICATION_C_ */
