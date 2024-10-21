library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_CKKS is 
end test_CKKS;


architecture TB of test_CKKS is

component CKKS is
port (
  reset : in STD_LOGIC;
  sys_diff_clock_clk_n : in STD_LOGIC;
  sys_diff_clock_clk_p : in STD_LOGIC;
  uart0_rxd_i_0 : in STD_LOGIC;
  uart0_txd_o_0 : out STD_LOGIC
);
end component CKKS;

signal reset : STD_LOGIC;
signal sys_diff_clock_clk_n : STD_LOGIC;
signal sys_diff_clock_clk_p : STD_LOGIC;
signal uart0_rxd_i_0 : STD_LOGIC;
signal uart0_txd_o_0 : STD_LOGIC;
begin

DUT: component CKKS port map (
  reset => reset,
  sys_diff_clock_clk_n => sys_diff_clock_clk_n,
  sys_diff_clock_clk_p => sys_diff_clock_clk_p,
  uart0_rxd_i_0 => uart0_rxd_i_0,
  uart0_txd_o_0 => uart0_txd_o_0
);

process
begin
  sys_diff_clock_clk_p <= '0';
  wait for 2.5 ns;
  sys_diff_clock_clk_p <= '1';
  wait for 2.5 ns;
end process;

sys_diff_clock_clk_n <= NOT sys_diff_clock_clk_p;

process
begin
  reset <= '0';
  wait for 100 ns;
  reset <= '1';
  wait;
end process;

end TB;

