// // ================================================================================ //
// // The NEORV32 RISC-V Processor - https://github.com/stnolting/neorv32              //
// // Copyright (c) NEORV32 contributors.                                              //
// // Copyright (c) 2020 - 2024 Stephan Nolting. All rights reserved.                  //
// // Licensed under the BSD-3-Clause license, see LICENSE for details.                //
// // SPDX-License-Identifier: BSD-3-Clause                                            //
// // ================================================================================ //

// /**
//  * @file neorv32_cdma.c
//  * @brief Custom Functions Subsystem (cdma) HW driver source file.
//  *
//  * @warning There are no "real" cdma driver functions available here, because these functions are defined by the actual hardware.
//  * @warning Hence, the cdma designer has to provide the actual driver functions.
//  *
//  * @note These functions should only be used if the cdma was synthesized (IO_cdma_EN = true).
//  *
//  * @see https://stnolting.github.io/neorv32/sw/files.html
//  */

// #include "neorv32.h"


// /**********************************************************************//**
//  * Check if XBUS was synthesized.
//  *
//  * @return 0 if XBUS was not synthesized, 1 if XBUS is available.
//  **************************************************************************/
// int neorv32_cdma_available(void) {

//   if (NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_XBUS)) {
//     return 1;
//   }
//   else {
//     return 0;
//   }
// }


// // This function blocks until the DMA is idle
// void cdmaWaitForIdle()
// {
// 	while(1)
// 	{
// 		uint32_t idle_val = CUSTOM_CDMA->CDMASR_reg;
// 		if(idle_val & (1<<1))
// 		{
// 			if(DEBUG) neorv32_uart0_printf("CDMA: IDLE bit is set\n");
// 			break;
// 		}
// 		else
// 		{
// 			if(DEBUG) neorv32_uart0_printf("CDMA: IDLE bit is NOT set!!!!\n");
// 		}
// 	}
// }


// // This function initiates a DMA transaction. DMA copies num_bytes many bytes from src_addr to
// // dest_addr. Both addresses are AXI addresses. 
// // The function blocks until completion if block != 0. Otherwise it returns immediately.
// void neorv32_cdma_transfer(uint32_t dest_addr, uint32_t src_addr, uint32_t num_bytes, uint8_t block)
// {
// 	// check idle bit (not needed actually. Last transfer did that already)
// 	// void cdmaWaitForIdle();

// 	//set interrupt bits if needed. Requires adaption of block design
// 	//read_val = Xil_In32(XPAR_AXI_CDMA_0_BASEADDR + CDMACR);
// 	// read_val |= (1<<12); // interrupt on transfer completion
// 	// read_val |= (1<<14); // interrupt on error
// 	//Xil_Out32(XPAR_AXI_CDMA_0_BASEADDR + CDMACR, read_val);
// 	// if(DEBUG) printf("CDMA: setting cr to %lx\n",read_val);

// 	//set source address:
// 	if(DEBUG) neorv32_uart0_printf("CDMA: setting source address to 0x%x\n", src_addr);
// 	CUSTOM_CDMA->CDMA_SA_reg = src_addr;
// 	if(DEBUG) neorv32_uart0_printf("                             is 0x%x\n", CUSTOM_CDMA->CDMA_SA_reg);

// 	//set dest address:
// 	if(DEBUG) neorv32_uart0_printf("CDMA: setting destin address to 0x%x\n", dest_addr);
// 	CUSTOM_CDMA->CDMA_DA_reg = dest_addr;
// 	if(DEBUG) neorv32_uart0_printf("                             is 0x%x\n", CUSTOM_CDMA->CDMA_DA_reg);

// 	//set number of transferred bytes. This also starts the transfer:
// 	CUSTOM_CDMA->CDMA_BTT_reg = num_bytes;
// 	if(DEBUG) neorv32_uart0_printf("CDMA: sending %u bytes\n", num_bytes);

// 	if(!block)
// 		return;

// 	//wait for completion:
// 	if(DEBUG) neorv32_uart0_printf("CDMA: waiting for completion of the transfer...\n");
// 	while (!(CUSTOM_CDMA->CDMASR_reg & (1<<1)));
	
// 	if(DEBUG) neorv32_uart0_printf("CDMA: done waiting\n");
// }