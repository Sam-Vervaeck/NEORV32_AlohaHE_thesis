/****************************************
 * Testing and Verification Code
 *
 * The reference output is generated via 
 * Microsoft SEAL and in fullEnc.h. Only
 * a full encryption test is retained for
 * this project since Aloha-HE is assumed
 * to be functioning correctly internally.
 * 
 * The code is adapted to be compatible 
 * with the 32-bit architecture of the
 * NEORV32 processor.
 *
 * Note: Access to BRAMs without DMA
 * (i.e.: with send64() and receive64()) is
 * only supported if PROVIDE_DEBUG_IO set
 * to 1 (ComputeCore.v)
 ***************************************/

#include "ckksTest.h"
#include "../communication.h"
#include "../instruction.h"
#include "../ckksAccelerator.h"
#include "fullEnc.h"

const uint64_t CPU_FREQ_MHZ = 140;    // clock frequency of host CPU
const uint64_t COPROC_FREQ_MHZ = 140; // clock frequency of co-processor

#define ALIGN __attribute__((aligned(8192)))
// set this to 1 for verbose debug and status output
#define DEBUG 1


uint32_t checkPoly(const uint32_t res_address, const uint64_t* ref, uint32_t size, const char* poly_name, uint32_t modulus_nr, int64_t delta_max)
{
	uint32_t error = 0;
	for(uint32_t i = 0; i < size; ++i)
	{
        uint32_t high_addr = res_address + (i*8+4);
        uint32_t high_val = *((uint32_t*) high_addr);

        uint32_t low_addr = res_address + (i*8);
        uint32_t low_val = *((uint32_t*) low_addr);

		uint64_t res = ((uint64_t) high_val << 32) | low_val;
		int64_t delta =  res - ref[i];

		if(delta > delta_max || delta < -delta_max){
			if(error<10)
				neorv32_uart0_printf("Error: modulus %u: %s[%u]: result: %x%x, expected: %x%x\n", modulus_nr, poly_name, i, (uint32_t) (res>>32), (uint32_t) (res), (uint32_t) (ref[i]>>32), (uint32_t) (ref[i]));
			error++;
		}
	}
	return error != 0;
}


void test_hardware()
{
	uint64_t start, end, cc, duration;
	const uint32_t poly_size = 8192; // 2^13
	uint32_t error = 0;

    neorv32_uart0_printf("\nCKKS ENCRYPT START\n");
	start = neorv32_mtime_get_time();

	ckks_encrypt(result_c0, input, poly_size, error_polys_seed, pk1_seeds, num_moduli, constants_select, modulus_select, pk0, scale, qm, current_k);
	
	end = neorv32_mtime_get_time();
    cc = (end-start);

    neorv32_uart0_printf("\nCKKS ENCRYPT END\n");

    duration = cc/CPU_FREQ_MHZ;
	neorv32_uart0_printf("Hardware tests took %x%x cpu cc, about %x%x us\n", (uint32_t) (cc>>32), (uint32_t) (cc), (uint32_t) (duration>>32), (uint32_t) (duration));
	
    neorv32_uart0_printf("\nCHECK CKKS ENCRYPT START\n");
	for(uint32_t modulus_index = 0; modulus_index < num_moduli; ++modulus_index)
	{
		neorv32_uart0_printf("Checking modulus %u\n", modulus_index);
		error |= checkPoly(result_c1[modulus_index], expected_c1[modulus_index], poly_size, "C1", modulus_index, 0);
		error |= checkPoly(result_c0[modulus_index], expected_c0[modulus_index], poly_size, "C0", modulus_index, 0);
	}
    neorv32_uart0_printf("\nCHECK CKKS ENCRYPT END\n");

	if(error){
		neorv32_uart0_printf("#################################\n");
		neorv32_uart0_printf("# ERRORS OCCURED DURING TESTING #\n");
		neorv32_uart0_printf("#################################\n");
	}
	else{
		neorv32_uart0_printf("#################################\n");
		neorv32_uart0_printf("#              OK!              #\n");
		neorv32_uart0_printf("#################################\n");
	}
}

// Simple test to verify correct timer configuration.
void test_timing()
{
	neorv32_uart0_printf("\n\nStart timing test\n\n");

	uint64_t start, end;
	start = neorv32_mtime_get_time();

	neorv32_uart0_printf("Running the timing test, start time was at cycle 0x%x%x\n", (uint32_t) (start>>32), (uint32_t) (start));
	
	end = neorv32_mtime_get_time();
    uint64_t cc = (end-start);
    uint64_t duration = (end-start)/CPU_FREQ_MHZ;

	neorv32_uart0_printf("Time consumed: %x%x cpu cc, about %x%x us\n", (uint32_t) (cc>>32), (uint32_t) (cc), (uint32_t) (duration>>32), (uint32_t) (duration));
}

// Simple test to verify correct timer configuration.
void test_bram_content()
{
	neorv32_uart0_printf("\n\nStart BRAM content test\n\n");

    uint32_t poly_size = 8192;

	neorv32_uart0_printf("Test input start address: %x and %x = 0x%x%x\n", 
		(uint32_t) (input + 4), 
		(uint32_t) input, 
		(uint32_t) *((uint32_t *) (input + 4)), 
		(uint32_t) *((uint32_t *) input));

	neorv32_uart0_printf("Test input end address: %x and %x = 0x%x%x\n", 
		(uint32_t) (input + poly_size * sizeof(uint64_t) + 4), 
		(uint32_t) (input + poly_size * sizeof(uint64_t)), 
		(uint32_t) *((uint32_t *) (input + poly_size * sizeof(uint64_t) + 4)), 
		(uint32_t) *((uint32_t *) (input + poly_size * sizeof(uint64_t))));

	neorv32_uart0_printf("Test pk0_mod0 start address: %x and %x = 0x%x%x\n", 
		(uint32_t) (pk0[0] + 4), 
		(uint32_t) pk0[0], 
		(uint32_t) *((uint32_t *) (pk0[0] + 4)), 
		(uint32_t) *((uint32_t *) pk0[0]));

	neorv32_uart0_printf("Test pk0_mod0 end address: %x and %x = 0x%x%x\n", 
		(uint32_t) (pk0[0] + poly_size * sizeof(uint64_t) + 4), 
		(uint32_t) (pk0[0] + poly_size * sizeof(uint64_t)), 
		(uint32_t) *((uint32_t *) (pk0[0] + poly_size * sizeof(uint64_t) + 4)), 
		(uint32_t) *((uint32_t *) (pk0[0] + poly_size * sizeof(uint64_t))));

	neorv32_uart0_printf("Test pk0_mod1 start address: %x and %x = 0x%x%x\n", 
		(uint32_t) (pk0[1] + 4), 
		(uint32_t) pk0[1], 
		(uint32_t) *((uint32_t *) (pk0[1] + 4)), 
		(uint32_t) *((uint32_t *) pk0[1]));

	neorv32_uart0_printf("Test pk0_mod1 end address: %x and %x = 0x%x%x\n", 
		(uint32_t) (pk0[1] + poly_size * sizeof(uint64_t) + 4), 
		(uint32_t) (pk0[1] + poly_size * sizeof(uint64_t)), 
		(uint32_t) *((uint32_t *) (pk0[1] + poly_size * sizeof(uint64_t) + 4)), 
		(uint32_t) *((uint32_t *) (pk0[1] + poly_size * sizeof(uint64_t))));

	neorv32_uart0_printf("Test pk0_mod2 start address: %x and %x = 0x%x%x\n", 
		(uint32_t) (pk0[2] + 4), 
		(uint32_t) pk0[2], 
		(uint32_t) *((uint32_t *) (pk0[2] + 4)), 
		(uint32_t) *((uint32_t *) pk0[2]));

	neorv32_uart0_printf("Test pk0_mod2 end address: %x and %x = 0x%x%x\n", 
		(uint32_t) (pk0[2] + poly_size * sizeof(uint64_t) + 4), 
		(uint32_t) (pk0[2] + poly_size * sizeof(uint64_t)), 
		(uint32_t) *((uint32_t *) (pk0[2] + poly_size * sizeof(uint64_t) + 4)), 
		(uint32_t) *((uint32_t *) (pk0[2] + poly_size * sizeof(uint64_t))));

	neorv32_uart0_printf("Test result_c0[0] start address: %x and %x = 0x%x%x\n", 
		(uint32_t) (result_c0[0] + 4), 
		(uint32_t) result_c0[0], 
		(uint32_t) *((uint32_t *) (result_c0[0] + 4)), 
		(uint32_t) *((uint32_t *) result_c0[0]));

	neorv32_uart0_printf("Test result_c0[1] start address: %x and %x = 0x%x%x\n", 
		(uint32_t) (result_c0[1] + 4), 
		(uint32_t) result_c0[1], 
		(uint32_t) *((uint32_t *) (result_c0[1] + 4)), 
		(uint32_t) *((uint32_t *) result_c0[1]));

	neorv32_uart0_printf("Test result_c0[2] start address: %x and %x = 0x%x%x\n", 
		(uint32_t) (result_c0[2] + 4), 
		(uint32_t) result_c0[2], 
		(uint32_t) *((uint32_t *) (result_c0[2] + 4)), 
		(uint32_t) *((uint32_t *) result_c0[2]));

	neorv32_uart0_printf("Test result_c1[0] start address: %x and %x = 0x%x%x\n", 
		(uint32_t) (result_c1[0] + 4), 
		(uint32_t) result_c1[0], 
		(uint32_t) *((uint32_t *) (result_c1[0] + 4)), 
		(uint32_t) *((uint32_t *) result_c1[0]));

	neorv32_uart0_printf("Test result_c1[1] start address: %x and %x = 0x%x%x\n", 
		(uint32_t) (result_c1[1] + 4), 
		(uint32_t) result_c1[1], 
		(uint32_t) *((uint32_t *) (result_c1[1] + 4)), 
		(uint32_t) *((uint32_t *) result_c1[1]));

	neorv32_uart0_printf("Test result_c1[2] start address: %x and %x = 0x%x%x\n", 
		(uint32_t) (result_c1[2] + 4), 
		(uint32_t) result_c1[2], 
		(uint32_t) *((uint32_t *) (result_c1[2] + 4)), 
		(uint32_t) *((uint32_t *) result_c1[2]));

    neorv32_uart0_printf("\n\nEnd BRAM content test\n\n");
}