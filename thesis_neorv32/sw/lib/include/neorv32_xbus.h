// // ================================================================================ //
// // The NEORV32 RISC-V Processor - https://github.com/stnolting/neorv32              //
// // Copyright (c) NEORV32 contributors.                                              //
// // Copyright (c) 2020 - 2024 Stephan Nolting. All rights reserved.                  //
// // Licensed under the BSD-3-Clause license, see LICENSE for details.                //
// // SPDX-License-Identifier: BSD-3-Clause                                            //
// // ================================================================================ //

// /**
//  * @file neorv32_xbus.h
//  * @brief External bus (xbus) HW driver header file.
//  *
//  * @warning There are no "real" xbus driver functions available here, because these functions are defined by the actual hardware.
//  * @warning The xbus designer has to provide the actual driver functions.
//  *
//  * @note These functions should only be used if the xbus was synthesized (IO_xbus_EN = true).
//  * @see https://stnolting.github.io/neorv32/sw/files.html
//  */

// #ifndef neorv32_xbus_h
// #define neorv32_xbus_h

// #include <stdint.h>


// /**********************************************************************//**
//  * @name IO Device: Custom Functions Subsystem (xbus)
//  **************************************************************************/
// /**@{*/
// /** xbus module prototype */
// typedef volatile struct __attribute__((packed,aligned(4))) {
//   uint32_t CONTROL; // offset 0, size 4 bytes
//   uint32_t CONFIG;  // offset 4, size 4 bytes
// } custom_xbus_t;

// // Put at the same address as in the address editor in Vivado
// #define CUSTOM_XBUS ((custom_xbus_t*) (0xC0000000))


// /**********************************************************************//**
//  * @name Prototypes
//  **************************************************************************/
// /**@{*/
// int neorv32_xbus_available(void);
// /**@}*/


// #endif // neorv32_xbus_h
