// ================================================================================ //
// The NEORV32 RISC-V Processor - https://github.com/stnolting/neorv32              //
// Copyright (c) NEORV32 contributors.                                              //
// Copyright (c) 2020 - 2024 Stephan Nolting. All rights reserved.                  //
// Licensed under the BSD-3-Clause license, see LICENSE for details.                //
// SPDX-License-Identifier: BSD-3-Clause                                            //
// ================================================================================ //

/**********************************************************************//**
 * @file thesis_ckks/main.c
 * @author Sam Vervaeck
 * @brief The ckks demo main file
 **************************************************************************/

#include "neorv32.h"
#include "ckksAccelerator.h"
#include "communication.h"
#include "test_files/ckksTest.h"

/**********************************************************************//**
 * @name User configuration
 **************************************************************************/
/**@{*/
/** UART BAUD rate */
#define BAUD_RATE 19200
/**@}*/


/**********************************************************************//**
 * @note This program requires the UART, CFS, and MTIME to be synthesized.
 **************************************************************************/
int main()
{
  // capture all exceptions and give debug info via UART
  // this is not required, but keeps us safe
  neorv32_rte_setup();

  // setup UART at default baud rate, no interrupts
  neorv32_uart0_setup(BAUD_RATE, 0);

  // check if UART0 unit is implemented at all
  if (neorv32_uart0_available() == 0 || neorv32_mtime_available() == 0 || neorv32_cfs_available() == 0) {
    return 1;
  }

  // intro
  neorv32_uart0_printf("\n<<< CKKS MAIN FILE BEGIN >>>\n\n");

  neorv32_uart0_printf("Reset and init\n");
  NEORV32_CFS->REG[1] = 1; // reset the co-processor

  cdmaWaitForIdle(); // waits for the DMA to be configured and ready.
	ckks_init(); // initializes software-internal data structures for CKKS.

  NEORV32_CFS->REG[1] = 0; // release reset again

  // test_timing(); // test if the machine timer returns realistic values
  // test_bram_content(); // test if the BRAM contains the wanted test values
  test_hardware(); // test if the CKKS accelerator is properly connected and performs correct CKKS operations

  neorv32_uart0_printf("\n<<< CKKS MAIN FILE END >>>\n\n");

  // stop program counter
  while ( 1 ) { }
  return 0;
}
