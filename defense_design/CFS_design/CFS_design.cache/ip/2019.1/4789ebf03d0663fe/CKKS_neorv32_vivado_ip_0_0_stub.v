// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Fri Sep  6 02:35:05 2024
// Host        : sam-cosic running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ CKKS_neorv32_vivado_ip_0_0_stub.v
// Design      : CKKS_neorv32_vivado_ip_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "neorv32_vivado_ip,Vivado 2019.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, resetn, m_axi_awaddr, m_axi_awprot, 
  m_axi_awvalid, m_axi_awready, m_axi_wdata, m_axi_wstrb, m_axi_wvalid, m_axi_wready, 
  m_axi_araddr, m_axi_arprot, m_axi_arvalid, m_axi_arready, m_axi_rdata, m_axi_rresp, 
  m_axi_rvalid, m_axi_rready, m_axi_bresp, m_axi_bvalid, m_axi_bready, uart0_txd_o, 
  uart0_rxd_i, uart0_rts_o, uart0_cts_i, cfs_in_i, cfs_out_o, mtime_time_o, msw_irq_i, 
  mext_irq_i)
/* synthesis syn_black_box black_box_pad_pin="clk,resetn,m_axi_awaddr[31:0],m_axi_awprot[2:0],m_axi_awvalid,m_axi_awready,m_axi_wdata[31:0],m_axi_wstrb[3:0],m_axi_wvalid,m_axi_wready,m_axi_araddr[31:0],m_axi_arprot[2:0],m_axi_arvalid,m_axi_arready,m_axi_rdata[31:0],m_axi_rresp[1:0],m_axi_rvalid,m_axi_rready,m_axi_bresp[1:0],m_axi_bvalid,m_axi_bready,uart0_txd_o,uart0_rxd_i,uart0_rts_o,uart0_cts_i,cfs_in_i[90:0],cfs_out_o[63:0],mtime_time_o[63:0],msw_irq_i,mext_irq_i" */;
  input clk;
  input resetn;
  output [31:0]m_axi_awaddr;
  output [2:0]m_axi_awprot;
  output m_axi_awvalid;
  input m_axi_awready;
  output [31:0]m_axi_wdata;
  output [3:0]m_axi_wstrb;
  output m_axi_wvalid;
  input m_axi_wready;
  output [31:0]m_axi_araddr;
  output [2:0]m_axi_arprot;
  output m_axi_arvalid;
  input m_axi_arready;
  input [31:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rvalid;
  output m_axi_rready;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  output m_axi_bready;
  output uart0_txd_o;
  input uart0_rxd_i;
  output uart0_rts_o;
  input uart0_cts_i;
  input [90:0]cfs_in_i;
  output [63:0]cfs_out_o;
  output [63:0]mtime_time_o;
  input msw_irq_i;
  input mext_irq_i;
endmodule
