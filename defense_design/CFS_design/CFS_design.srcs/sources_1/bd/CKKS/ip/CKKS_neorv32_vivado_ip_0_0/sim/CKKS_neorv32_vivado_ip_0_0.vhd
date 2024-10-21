-- (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: NEORV32:user:neorv32_vivado_ip:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY CKKS_neorv32_vivado_ip_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    resetn : IN STD_LOGIC;
    m_axi_awaddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_awvalid : OUT STD_LOGIC;
    m_axi_awready : IN STD_LOGIC;
    m_axi_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_wstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_wvalid : OUT STD_LOGIC;
    m_axi_wready : IN STD_LOGIC;
    m_axi_araddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_arprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_arvalid : OUT STD_LOGIC;
    m_axi_arready : IN STD_LOGIC;
    m_axi_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_rvalid : IN STD_LOGIC;
    m_axi_rready : OUT STD_LOGIC;
    m_axi_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_bvalid : IN STD_LOGIC;
    m_axi_bready : OUT STD_LOGIC;
    uart0_txd_o : OUT STD_LOGIC;
    uart0_rxd_i : IN STD_LOGIC;
    uart0_rts_o : OUT STD_LOGIC;
    uart0_cts_i : IN STD_LOGIC;
    cfs_in_i : IN STD_LOGIC_VECTOR(90 DOWNTO 0);
    cfs_out_o : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    mtime_time_o : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    msw_irq_i : IN STD_LOGIC;
    mext_irq_i : IN STD_LOGIC
  );
END CKKS_neorv32_vivado_ip_0_0;

ARCHITECTURE CKKS_neorv32_vivado_ip_0_0_arch OF CKKS_neorv32_vivado_ip_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF CKKS_neorv32_vivado_ip_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT neorv32_vivado_ip IS
    GENERIC (
      AXI4_STREAM_EN : BOOLEAN;
      CLOCK_FREQUENCY : INTEGER;
      HART_ID : STD_LOGIC_VECTOR(31 DOWNTO 0);
      JEDEC_ID : STD_LOGIC_VECTOR(10 DOWNTO 0);
      INT_BOOTLOADER_EN : BOOLEAN;
      ON_CHIP_DEBUGGER_EN : BOOLEAN;
      CPU_EXTENSION_RISCV_A : BOOLEAN;
      CPU_EXTENSION_RISCV_B : BOOLEAN;
      CPU_EXTENSION_RISCV_C : BOOLEAN;
      CPU_EXTENSION_RISCV_E : BOOLEAN;
      CPU_EXTENSION_RISCV_M : BOOLEAN;
      CPU_EXTENSION_RISCV_U : BOOLEAN;
      CPU_EXTENSION_RISCV_Zfinx : BOOLEAN;
      CPU_EXTENSION_RISCV_Zicntr : BOOLEAN;
      CPU_EXTENSION_RISCV_Zicond : BOOLEAN;
      CPU_EXTENSION_RISCV_Zihpm : BOOLEAN;
      CPU_EXTENSION_RISCV_Zmmul : BOOLEAN;
      CPU_EXTENSION_RISCV_Zxcfu : BOOLEAN;
      FAST_MUL_EN : BOOLEAN;
      FAST_SHIFT_EN : BOOLEAN;
      REGFILE_HW_RST : BOOLEAN;
      PMP_NUM_REGIONS : INTEGER;
      PMP_MIN_GRANULARITY : INTEGER;
      PMP_TOR_MODE_EN : BOOLEAN;
      PMP_NAP_MODE_EN : BOOLEAN;
      HPM_NUM_CNTS : INTEGER;
      HPM_CNT_WIDTH : INTEGER;
      MEM_INT_IMEM_EN : BOOLEAN;
      MEM_INT_IMEM_SIZE : INTEGER;
      MEM_INT_DMEM_EN : BOOLEAN;
      MEM_INT_DMEM_SIZE : INTEGER;
      ICACHE_EN : BOOLEAN;
      ICACHE_NUM_BLOCKS : INTEGER;
      ICACHE_BLOCK_SIZE : INTEGER;
      DCACHE_EN : BOOLEAN;
      DCACHE_NUM_BLOCKS : INTEGER;
      DCACHE_BLOCK_SIZE : INTEGER;
      XBUS_TIMEOUT : INTEGER;
      XBUS_CACHE_EN : BOOLEAN;
      XBUS_CACHE_NUM_BLOCKS : INTEGER;
      XBUS_CACHE_BLOCK_SIZE : INTEGER;
      XIP_EN : BOOLEAN;
      XIP_CACHE_EN : BOOLEAN;
      XIP_CACHE_NUM_BLOCKS : INTEGER;
      XIP_CACHE_BLOCK_SIZE : INTEGER;
      XIRQ_EN : BOOLEAN;
      XIRQ_NUM_CH : INTEGER;
      IO_GPIO_EN : BOOLEAN;
      IO_GPIO_IN_NUM : INTEGER;
      IO_GPIO_OUT_NUM : INTEGER;
      IO_MTIME_EN : BOOLEAN;
      IO_UART0_EN : BOOLEAN;
      IO_UART0_RX_FIFO : INTEGER;
      IO_UART0_TX_FIFO : INTEGER;
      IO_UART1_EN : BOOLEAN;
      IO_UART1_RX_FIFO : INTEGER;
      IO_UART1_TX_FIFO : INTEGER;
      IO_SPI_EN : BOOLEAN;
      IO_SPI_FIFO : INTEGER;
      IO_SDI_EN : BOOLEAN;
      IO_SDI_FIFO : INTEGER;
      IO_TWI_EN : BOOLEAN;
      IO_TWI_FIFO : INTEGER;
      IO_PWM_EN : BOOLEAN;
      IO_PWM_NUM_CH : INTEGER;
      IO_WDT_EN : BOOLEAN;
      IO_TRNG_EN : BOOLEAN;
      IO_TRNG_FIFO : INTEGER;
      IO_CFS_EN : BOOLEAN;
      IO_CFS_CONFIG : STD_LOGIC_VECTOR(31 DOWNTO 0);
      IO_CFS_IN_SIZE : INTEGER;
      IO_CFS_OUT_SIZE : INTEGER;
      IO_NEOLED_EN : BOOLEAN;
      IO_NEOLED_TX_FIFO : INTEGER;
      IO_GPTMR_EN : BOOLEAN;
      IO_ONEWIRE_EN : BOOLEAN;
      IO_DMA_EN : BOOLEAN;
      IO_SLINK_RX_FIFO : INTEGER;
      IO_SLINK_TX_FIFO : INTEGER;
      IO_CRC_EN : BOOLEAN
    );
    PORT (
      clk : IN STD_LOGIC;
      resetn : IN STD_LOGIC;
      m_axi_awaddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_awvalid : OUT STD_LOGIC;
      m_axi_awready : IN STD_LOGIC;
      m_axi_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_wstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_wvalid : OUT STD_LOGIC;
      m_axi_wready : IN STD_LOGIC;
      m_axi_araddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_arprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_arvalid : OUT STD_LOGIC;
      m_axi_arready : IN STD_LOGIC;
      m_axi_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_rvalid : IN STD_LOGIC;
      m_axi_rready : OUT STD_LOGIC;
      m_axi_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_bvalid : IN STD_LOGIC;
      m_axi_bready : OUT STD_LOGIC;
      s0_axis_tdest : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      s0_axis_tvalid : OUT STD_LOGIC;
      s0_axis_tready : IN STD_LOGIC;
      s0_axis_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s0_axis_tlast : OUT STD_LOGIC;
      s1_axis_tid : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s1_axis_tvalid : IN STD_LOGIC;
      s1_axis_tready : OUT STD_LOGIC;
      s1_axis_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s1_axis_tlast : IN STD_LOGIC;
      jtag_tck_i : IN STD_LOGIC;
      jtag_tdi_i : IN STD_LOGIC;
      jtag_tdo_o : OUT STD_LOGIC;
      jtag_tms_i : IN STD_LOGIC;
      xip_csn_o : OUT STD_LOGIC;
      xip_clk_o : OUT STD_LOGIC;
      xip_dat_i : IN STD_LOGIC;
      xip_dat_o : OUT STD_LOGIC;
      gpio_o : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      gpio_i : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      uart0_txd_o : OUT STD_LOGIC;
      uart0_rxd_i : IN STD_LOGIC;
      uart0_rts_o : OUT STD_LOGIC;
      uart0_cts_i : IN STD_LOGIC;
      uart1_txd_o : OUT STD_LOGIC;
      uart1_rxd_i : IN STD_LOGIC;
      uart1_rts_o : OUT STD_LOGIC;
      uart1_cts_i : IN STD_LOGIC;
      spi_clk_o : OUT STD_LOGIC;
      spi_dat_o : OUT STD_LOGIC;
      spi_dat_i : IN STD_LOGIC;
      spi_csn_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      sdi_clk_i : IN STD_LOGIC;
      sdi_dat_o : OUT STD_LOGIC;
      sdi_dat_i : IN STD_LOGIC;
      sdi_csn_i : IN STD_LOGIC;
      twi_sda_i : IN STD_LOGIC;
      twi_sda_o : OUT STD_LOGIC;
      twi_scl_i : IN STD_LOGIC;
      twi_scl_o : OUT STD_LOGIC;
      onewire_i : IN STD_LOGIC;
      onewire_o : OUT STD_LOGIC;
      pwm_o : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      cfs_in_i : IN STD_LOGIC_VECTOR(90 DOWNTO 0);
      cfs_out_o : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      neoled_o : OUT STD_LOGIC;
      mtime_time_o : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      xirq_i : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      mtime_irq_i : IN STD_LOGIC;
      msw_irq_i : IN STD_LOGIC;
      mext_irq_i : IN STD_LOGIC
    );
  END COMPONENT neorv32_vivado_ip;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF CKKS_neorv32_vivado_ip_0_0_arch: ARCHITECTURE IS "package_project";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi AWPROT";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m_axi_awaddr: SIGNAL IS "XIL_INTERFACENAME m_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 140000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN CKKS_clk_wiz_0_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THR" & 
"EADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi AWADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF resetn: SIGNAL IS "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF resetn: SIGNAL IS "xilinx.com:signal:reset:1.0 resetn RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF s0_axis:s1_axis:m_axi, ASSOCIATED_RESET resetn, FREQ_HZ 140000000, PHASE 0.0, CLK_DOMAIN CKKS_clk_wiz_0_0_clk_out1, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
BEGIN
  U0 : neorv32_vivado_ip
    GENERIC MAP (
      AXI4_STREAM_EN => false,
      CLOCK_FREQUENCY => 100000000,
      HART_ID => X"00000000",
      JEDEC_ID => B"00000000000",
      INT_BOOTLOADER_EN => false,
      ON_CHIP_DEBUGGER_EN => false,
      CPU_EXTENSION_RISCV_A => false,
      CPU_EXTENSION_RISCV_B => false,
      CPU_EXTENSION_RISCV_C => false,
      CPU_EXTENSION_RISCV_E => false,
      CPU_EXTENSION_RISCV_M => false,
      CPU_EXTENSION_RISCV_U => false,
      CPU_EXTENSION_RISCV_Zfinx => false,
      CPU_EXTENSION_RISCV_Zicntr => false,
      CPU_EXTENSION_RISCV_Zicond => false,
      CPU_EXTENSION_RISCV_Zihpm => false,
      CPU_EXTENSION_RISCV_Zmmul => false,
      CPU_EXTENSION_RISCV_Zxcfu => false,
      FAST_MUL_EN => false,
      FAST_SHIFT_EN => false,
      REGFILE_HW_RST => false,
      PMP_NUM_REGIONS => 0,
      PMP_MIN_GRANULARITY => 4,
      PMP_TOR_MODE_EN => false,
      PMP_NAP_MODE_EN => false,
      HPM_NUM_CNTS => 0,
      HPM_CNT_WIDTH => 40,
      MEM_INT_IMEM_EN => true,
      MEM_INT_IMEM_SIZE => 524288,
      MEM_INT_DMEM_EN => true,
      MEM_INT_DMEM_SIZE => 8192,
      ICACHE_EN => false,
      ICACHE_NUM_BLOCKS => 4,
      ICACHE_BLOCK_SIZE => 64,
      DCACHE_EN => false,
      DCACHE_NUM_BLOCKS => 4,
      DCACHE_BLOCK_SIZE => 64,
      XBUS_TIMEOUT => 64,
      XBUS_CACHE_EN => false,
      XBUS_CACHE_NUM_BLOCKS => 8,
      XBUS_CACHE_BLOCK_SIZE => 256,
      XIP_EN => false,
      XIP_CACHE_EN => false,
      XIP_CACHE_NUM_BLOCKS => 8,
      XIP_CACHE_BLOCK_SIZE => 256,
      XIRQ_EN => false,
      XIRQ_NUM_CH => 1,
      IO_GPIO_EN => false,
      IO_GPIO_IN_NUM => 1,
      IO_GPIO_OUT_NUM => 1,
      IO_MTIME_EN => true,
      IO_UART0_EN => true,
      IO_UART0_RX_FIFO => 32,
      IO_UART0_TX_FIFO => 32,
      IO_UART1_EN => false,
      IO_UART1_RX_FIFO => 1,
      IO_UART1_TX_FIFO => 1,
      IO_SPI_EN => false,
      IO_SPI_FIFO => 1,
      IO_SDI_EN => false,
      IO_SDI_FIFO => 1,
      IO_TWI_EN => false,
      IO_TWI_FIFO => 1,
      IO_PWM_EN => false,
      IO_PWM_NUM_CH => 1,
      IO_WDT_EN => false,
      IO_TRNG_EN => false,
      IO_TRNG_FIFO => 1,
      IO_CFS_EN => true,
      IO_CFS_CONFIG => X"00000000",
      IO_CFS_IN_SIZE => 91,
      IO_CFS_OUT_SIZE => 64,
      IO_NEOLED_EN => false,
      IO_NEOLED_TX_FIFO => 1,
      IO_GPTMR_EN => false,
      IO_ONEWIRE_EN => false,
      IO_DMA_EN => false,
      IO_SLINK_RX_FIFO => 1,
      IO_SLINK_TX_FIFO => 1,
      IO_CRC_EN => false
    )
    PORT MAP (
      clk => clk,
      resetn => resetn,
      m_axi_awaddr => m_axi_awaddr,
      m_axi_awprot => m_axi_awprot,
      m_axi_awvalid => m_axi_awvalid,
      m_axi_awready => m_axi_awready,
      m_axi_wdata => m_axi_wdata,
      m_axi_wstrb => m_axi_wstrb,
      m_axi_wvalid => m_axi_wvalid,
      m_axi_wready => m_axi_wready,
      m_axi_araddr => m_axi_araddr,
      m_axi_arprot => m_axi_arprot,
      m_axi_arvalid => m_axi_arvalid,
      m_axi_arready => m_axi_arready,
      m_axi_rdata => m_axi_rdata,
      m_axi_rresp => m_axi_rresp,
      m_axi_rvalid => m_axi_rvalid,
      m_axi_rready => m_axi_rready,
      m_axi_bresp => m_axi_bresp,
      m_axi_bvalid => m_axi_bvalid,
      m_axi_bready => m_axi_bready,
      s0_axis_tready => '0',
      s1_axis_tid => X"0",
      s1_axis_tvalid => '0',
      s1_axis_tdata => X"00000000",
      s1_axis_tlast => '0',
      jtag_tck_i => '0',
      jtag_tdi_i => '0',
      jtag_tms_i => '0',
      xip_dat_i => '0',
      gpio_i => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      uart0_txd_o => uart0_txd_o,
      uart0_rxd_i => uart0_rxd_i,
      uart0_rts_o => uart0_rts_o,
      uart0_cts_i => uart0_cts_i,
      uart1_rxd_i => '0',
      uart1_cts_i => '0',
      spi_dat_i => '0',
      sdi_clk_i => '0',
      sdi_dat_i => '0',
      sdi_csn_i => '0',
      twi_sda_i => '0',
      twi_scl_i => '0',
      onewire_i => '0',
      cfs_in_i => cfs_in_i,
      cfs_out_o => cfs_out_o,
      mtime_time_o => mtime_time_o,
      xirq_i => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      mtime_irq_i => '0',
      msw_irq_i => msw_irq_i,
      mext_irq_i => mext_irq_i
    );
END CKKS_neorv32_vivado_ip_0_0_arch;
