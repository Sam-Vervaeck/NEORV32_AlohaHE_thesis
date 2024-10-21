-- ================================================================================ --
-- NEORV32 SoC - Custom Functions Subsystem (CFS)                                   --
-- -------------------------------------------------------------------------------- --
-- Intended for tightly-coupled, application-specific custom co-processors. This    --
-- module provides up to 64x 32-bit memory-mapped interface registers, one CPU      --
-- interrupt request signal and custom IO conduits for processor-external or chip-  --
-- external interface.                                                              --
-- -------------------------------------------------------------------------------- --
-- The NEORV32 RISC-V Processor - https://github.com/stnolting/neorv32              --
-- Copyright (c) NEORV32 contributors.                                              --
-- Copyright (c) 2020 - 2024 Stephan Nolting. All rights reserved.                  --
-- Licensed under the BSD-3-Clause license, see LICENSE for details.                --
-- SPDX-License-Identifier: BSD-3-Clause                                            --
-- ================================================================================ --

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library neorv32;
use neorv32.neorv32_package.all;

entity neorv32_cfs is
  generic (
    CFS_CONFIG   : std_ulogic_vector(31 downto 0); -- custom CFS configuration generic
    CFS_IN_SIZE  : natural                          := 91; -- Aloha-HE: 8 wea + 18 addr + 64 dina + 1 en = 91 size of CFS input conduit in bits
    CFS_OUT_SIZE : natural                          := 64 -- Aloha-HE: 64 doutb = 64 size of CFS output conduit in bits
  );
  port (
    clk_i       : in  std_ulogic; -- global clock line
    rstn_i      : in  std_ulogic; -- global reset line, low-active, use as async
    bus_req_i   : in  bus_req_t; -- bus request
    bus_rsp_o   : out bus_rsp_t := rsp_terminate_c; -- bus response
    clkgen_en_o : out std_ulogic := '0'; -- enable clock generator
    clkgen_i    : in  std_ulogic_vector(7 downto 0); -- "clock" inputs
    irq_o       : out std_ulogic := '0'; -- interrupt request
    cfs_in_i    : in  std_ulogic_vector(CFS_IN_SIZE-1 downto 0); -- custom inputs
    cfs_out_o   : out std_ulogic_vector(CFS_OUT_SIZE-1 downto 0) := (others => '0') -- custom outputs
  );
end neorv32_cfs;

architecture neorv32_cfs_rtl of neorv32_cfs is

    -- Alohe-HE interface registers
    type cfs_regs_t is array (0 to 6) of std_ulogic_vector(31 downto 0); -- 7 registers for the 7 control signals
    signal cfs_reg_wr : cfs_regs_t; -- interface registers for WRITE accesses
    signal cfs_reg_rd : cfs_regs_t; -- interface registers for READ accesses

    -- Aloha-HE DMA IO conduit signals
    signal IO_dma_bram_byte_wea : std_ulogic_vector(7 downto 0); -- All 1 when writing, all 0 when reading
    signal IO_dma_bram_abs_addr : std_ulogic_vector(17 downto 0); -- Address to write or read
    signal IO_dma_bram_dina     : std_ulogic_vector(63 downto 0); -- Data to be written
    signal IO_dma_bram_doutb    : std_ulogic_vector(63 downto 0); -- Data read out
    signal IO_dma_bram_en       : std_ulogic; -- High when performing a write or read

    -- Aloha-HE
    component ComputeCoreWrapper
        port (
            clk                 : in std_ulogic;
            
            control_low_word    : in std_ulogic_vector(31 downto 0);
            control_high_word   : in std_ulogic_vector(31 downto 0);
            dina_ext_low_word   : in std_ulogic_vector(31 downto 0);
            dina_ext_high_word  : in std_ulogic_vector(31 downto 0);
            dout_ext_low_word   : out std_ulogic_vector(31 downto 0);
            dout_ext_high_word  : out std_ulogic_vector(31 downto 0);
            status              : out std_ulogic_vector(31 downto 0);
            
            dma_bram_byte_wea   : in std_ulogic_vector(7 downto 0);
            dma_bram_abs_addr   : in std_ulogic_vector(17 downto 0);
            dma_bram_dina       : in std_ulogic_vector(63 downto 0);
            dma_bram_doutb      : out std_ulogic_vector(63 downto 0);
            dma_bram_en         : in std_ulogic
        );
    end component;

begin

    bus_access: process(rstn_i, clk_i)
    begin
    if (rstn_i = '0') then
      cfs_reg_wr(0) <= (others => '0');
      cfs_reg_wr(1) <= (others => '0');
      cfs_reg_wr(2) <= (others => '0');
      cfs_reg_wr(3) <= (others => '0');
      cfs_reg_wr(4) <= (others => '0');
      cfs_reg_wr(5) <= (others => '0');
      cfs_reg_wr(6) <= (others => '0');
      bus_rsp_o     <= rsp_terminate_c;
    elsif rising_edge(clk_i) then -- synchronous interface for read and write accesses
      -- transfer/access acknowledge --
      bus_rsp_o.ack <= bus_req_i.stb;
    
      -- tie to zero if not explicitly used --
      bus_rsp_o.err <= '0';
    
      -- defaults --
      bus_rsp_o.data <= (others => '0'); -- the output HAS TO BE ZERO if there is no actual (read) access
    
      -- bus access --
      if (bus_req_i.stb = '1') then -- valid access cycle, STB is high for one cycle
    
        -- write access --
        if (bus_req_i.rw = '1') then
          if (bus_req_i.addr(7 downto 2) = "000000") then -- address size is fixed!
            cfs_reg_wr(0) <= bus_req_i.data;
          end if;
          if (bus_req_i.addr(7 downto 2) = "000001") then
            cfs_reg_wr(1) <= bus_req_i.data;
          end if;
          if (bus_req_i.addr(7 downto 2) = "000010") then
            cfs_reg_wr(2) <= bus_req_i.data;
          end if;
          if (bus_req_i.addr(7 downto 2) = "000011") then
            cfs_reg_wr(3) <= bus_req_i.data;
          end if;
          if (bus_req_i.addr(7 downto 2) = "000100") then
            cfs_reg_wr(4) <= bus_req_i.data;
          end if;
          if (bus_req_i.addr(7 downto 2) = "000101") then
            cfs_reg_wr(5) <= bus_req_i.data;
          end if;
          if (bus_req_i.addr(7 downto 2) = "000110") then
            cfs_reg_wr(6) <= bus_req_i.data;
          end if;
    
        -- read access --
        else
          case bus_req_i.addr(7 downto 2) is -- address size is fixed!
            when "000000" => bus_rsp_o.data <= cfs_reg_rd(0);
            when "000001" => bus_rsp_o.data <= cfs_reg_rd(1);
            when "000010" => bus_rsp_o.data <= cfs_reg_rd(2);
            when "000011" => bus_rsp_o.data <= cfs_reg_rd(3);
            when "000100" => bus_rsp_o.data <= cfs_reg_rd(4);
            when "000101" => bus_rsp_o.data <= cfs_reg_rd(5);
            when "000110" => bus_rsp_o.data <= cfs_reg_rd(6);
            when others   => bus_rsp_o.data <= (others => '0');
          end case;
        end if;
    
      end if;
    end if;
    end process bus_access;
    
    
    -- CFS Function Core ----------------------------------------------------------------------
    -- -------------------------------------------------------------------------------------------
    
    -- Connect control signals to memory-mapped registers and the dma signals to the IO conduits
    ComputeCoreWrapper_inst : ComputeCoreWrapper
        port map(
            clk => clk_i,
            
            control_low_word => cfs_reg_wr(0),
            control_high_word => cfs_reg_wr(1),
            dina_ext_low_word => cfs_reg_wr(2),
            dina_ext_high_word => cfs_reg_wr(3),
            dout_ext_low_word => cfs_reg_rd(4),
            dout_ext_high_word => cfs_reg_rd(5),
            status => cfs_reg_rd(6),
            
            dma_bram_byte_wea => IO_dma_bram_byte_wea,
            dma_bram_abs_addr => IO_dma_bram_abs_addr,
            dma_bram_dina => IO_dma_bram_dina,
            dma_bram_doutb => IO_dma_bram_doutb, 
            dma_bram_en => IO_dma_bram_en
        );

    IO_dma_bram_byte_wea <= cfs_in_i(7 downto 0);
    IO_dma_bram_abs_addr <= cfs_in_i(25 downto 8);
    IO_dma_bram_dina <= cfs_in_i(89 downto 26);
    IO_dma_bram_en <= cfs_in_i(90);
    
    cfs_out_o <= IO_dma_bram_doutb;
    
    -- Mapping for unused regs
    cfs_reg_rd(0) <= cfs_reg_wr(0);
    cfs_reg_rd(1) <= cfs_reg_wr(1);
    cfs_reg_rd(2) <= cfs_reg_wr(2);
    cfs_reg_rd(3) <= cfs_reg_wr(3);


end neorv32_cfs_rtl;
