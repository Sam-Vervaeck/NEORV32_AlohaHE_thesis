//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
//Date        : Thu Aug 22 18:00:26 2024
//Host        : sam-cosic running 64-bit Ubuntu 20.04.6 LTS
//Command     : generate_target ComputeCoreWrapper_test_wrapper.bd
//Design      : ComputeCoreWrapper_test_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ComputeCoreWrapper_test_wrapper
   (clk_in1_0,
    resetn_0,
    status_0);
  input clk_in1_0;
  input resetn_0;
  output [31:0]status_0;

  wire clk_in1_0;
  wire resetn_0;
  wire [31:0]status_0;

  ComputeCoreWrapper_test ComputeCoreWrapper_test_i
       (.clk_in1_0(clk_in1_0),
        .resetn_0(resetn_0),
        .status_0(status_0));
endmodule
