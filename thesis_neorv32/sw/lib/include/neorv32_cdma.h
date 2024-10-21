// // ================================================================================ //
// // The NEORV32 RISC-V Processor - https://github.com/stnolting/neorv32              //
// // Copyright (c) NEORV32 contributors.                                              //
// // Copyright (c) 2020 - 2024 Stephan Nolting. All rights reserved.                  //
// // Licensed under the BSD-3-Clause license, see LICENSE for details.                //
// // SPDX-License-Identifier: BSD-3-Clause                                            //
// // ================================================================================ //

// /**
//  * @file neorv32_cdma.h
//  * @brief External bus (cdma) HW driver header file.
//  *
//  * @warning There are no "real" cdma driver functions available here, because these functions are defined by the actual hardware.
//  * @warning The cdma designer has to provide the actual driver functions.
//  *
//  * @note These functions should only be used if the cdma was synthesized (IO_cdma_EN = true).
//  * @see https://stnolting.github.io/neorv32/sw/files.html
//  */

// #ifndef neorv32_cdma_h
// #define neorv32_cdma_h

// #include <stdint.h>

// #define CDMACR   0x0	//CDMA control register
// #define CDMASR   0x4	//CDMA status register
// #define CDMA_SA  0x18  	//CDMA source address register
// #define CDMA_DA  0x20  	//CDMA destination address register
// #define CDMA_BTT 0x28  	//CDMA bytes to transfer. Writing to this initiates the transaction


// /**********************************************************************//**
//  * @name IO Device: Custom Functions Subsystem (cdma)
//  **************************************************************************/
// /**@{*/
// /** cdma module prototype */
// typedef volatile struct __attribute__((packed, aligned(4))) {
//     uint32_t CDMACR_reg;        // Offset 0x0, size 4 bytes
//     uint32_t CDMASR_reg;        // Offset 0x4, size 4 bytes
//     uint32_t reserved0[4];      // Padding to skip
//     uint32_t CDMA_SA_reg;       // Offset 0x18, size 4 bytes
//     uint32_t reserved1;         // Padding to skip
//     uint32_t CDMA_DA_reg;       // Offset 0x20, size 4 bytes
//     uint32_t reserved3;         // Padding to skip
//     uint32_t CDMA_BTT_reg;      // Offset 0x28, size 4 bytes
// } custom_cdma_t;

// // Put at the same address as in the address editor in Vivado
// #define CUSTOM_CDMA ((custom_cdma_t*) (0xC4000000))

// /** BRAM 0 module prototype */
// typedef volatile struct __attribute__((packed,aligned(4))) {
//   uint32_t CONTROL; // offset 0, size 4 bytes
//   uint32_t CONFIG;  // offset 4, size 4 bytes
// } custom_BRAM_t;

// // Put at the same address as in the address editor in Vivado
// #define CUSTOM_BRAM_0 ((custom_BRAM_t*) (0xC0000000))
// #define CUSTOM_BRAM_1 ((custom_BRAM_t*) (0xC2000000))

// // Put at the same address as in the address editor in Vivado
// // Aloha-HE memory layout:
// #define POLY_SIZE                   8192
// #define AlohaHE_BRAM_CTRL           0xC2000000
// #define AlohaHE_BRAM_CTRL_MSG_ADDR  AlohaHE_BRAM_CTRL + 0*POLY_SIZE*sizeof(uint64_t)
// #define AlohaHE_BRAM_CTRL_KEY_ADDR  AlohaHE_BRAM_CTRL + 1*POLY_SIZE*sizeof(uint64_t)
// #define AlohaHE_BRAM_CTRL_V_ADDR    AlohaHE_BRAM_CTRL + 2*POLY_SIZE*sizeof(uint64_t)
// #define AlohaHE_BRAM_CTRL_FFT_ADDR  AlohaHE_BRAM_CTRL + 3*POLY_SIZE*sizeof(uint64_t)

// /**********************************************************************//**
//  * @name Prototypes
//  **************************************************************************/
// /**@{*/
// int neorv32_cdma_available(void);

// void cdmaWaitForIdle(void);

// void neorv32_cdma_transfer(uint32_t dest_addr, uint32_t src_addr, uint32_t num_bytes, uint8_t block);
// /**@}*/


// #endif // neorv32_cdma_h