--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
--Date        : Sun Oct 20 15:46:41 2024
--Host        : sam-cosic running 64-bit Ubuntu 20.04.6 LTS
--Command     : generate_target CKKS_wrapper.bd
--Design      : CKKS_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity CKKS_wrapper is
  port (
    reset : in STD_LOGIC;
    sys_diff_clock_clk_n : in STD_LOGIC;
    sys_diff_clock_clk_p : in STD_LOGIC;
    uart0_rxd_i_0 : in STD_LOGIC;
    uart0_txd_o_0 : out STD_LOGIC
  );
end CKKS_wrapper;

architecture STRUCTURE of CKKS_wrapper is
  component CKKS is
  port (
    reset : in STD_LOGIC;
    uart0_rxd_i_0 : in STD_LOGIC;
    uart0_txd_o_0 : out STD_LOGIC;
    sys_diff_clock_clk_n : in STD_LOGIC;
    sys_diff_clock_clk_p : in STD_LOGIC
  );
  end component CKKS;
begin
CKKS_i: component CKKS
     port map (
      reset => reset,
      sys_diff_clock_clk_n => sys_diff_clock_clk_n,
      sys_diff_clock_clk_p => sys_diff_clock_clk_p,
      uart0_rxd_i_0 => uart0_rxd_i_0,
      uart0_txd_o_0 => uart0_txd_o_0
    );
end STRUCTURE;
