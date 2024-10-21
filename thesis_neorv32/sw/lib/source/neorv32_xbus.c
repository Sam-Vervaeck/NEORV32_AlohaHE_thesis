// // ================================================================================ //
// // The NEORV32 RISC-V Processor - https://github.com/stnolting/neorv32              //
// // Copyright (c) NEORV32 contributors.                                              //
// // Copyright (c) 2020 - 2024 Stephan Nolting. All rights reserved.                  //
// // Licensed under the BSD-3-Clause license, see LICENSE for details.                //
// // SPDX-License-Identifier: BSD-3-Clause                                            //
// // ================================================================================ //

// /**
//  * @file neorv32_xbus.c
//  * @brief Custom Functions Subsystem (xbus) HW driver source file.
//  *
//  * @warning There are no "real" xbus driver functions available here, because these functions are defined by the actual hardware.
//  * @warning Hence, the xbus designer has to provide the actual driver functions.
//  *
//  * @note These functions should only be used if the xbus was synthesized (IO_xbus_EN = true).
//  *
//  * @see https://stnolting.github.io/neorv32/sw/files.html
//  */

// #include "neorv32.h"


// /**********************************************************************//**
//  * Check if custom functions subsystem was synthesized.
//  *
//  * @return 0 if xbus was not synthesized, 1 if xbus is available.
//  **************************************************************************/
// int neorv32_xbus_available(void) {

//   if (NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_XBUS)) {
//     return 1;
//   }
//   else {
//     return 0;
//   }
// }

