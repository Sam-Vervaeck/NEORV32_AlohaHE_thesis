#!/bin/bash -f
#*********************************************************************************************************
# Vivado (TM) v2019.1 (64-bit)
#
# Filename    : CKKS.sh
# Simulator   : Synopsys Verilog Compiler Simulator
# Description : Simulation script for compiling, elaborating and verifying the project source files.
#               The script will automatically create the design libraries sub-directories in the run
#               directory, add the library logical mappings in the simulator setup file, create default
#               'do/prj' file, execute compilation, elaboration and simulation steps.
#
# Generated by Vivado on Sun Oct 20 15:46:44 CEST 2024
# SW Build 2552052 on Fri May 24 14:47:09 MDT 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved. 
#
# usage: CKKS.sh [-help]
# usage: CKKS.sh [-lib_map_path]
# usage: CKKS.sh [-noclean_files]
# usage: CKKS.sh [-reset_run]
#
# Prerequisite:- To compile and run simulation, you must compile the Xilinx simulation libraries using the
# 'compile_simlib' TCL command. For more information about this command, run 'compile_simlib -help' in the
# Vivado Tcl Shell. Once the libraries have been compiled successfully, specify the -lib_map_path switch
# that points to these libraries and rerun export_simulation. For more information about this switch please
# type 'export_simulation -help' in the Tcl shell.
#
# You can also point to the simulation libraries by either replacing the <SPECIFY_COMPILED_LIB_PATH> in this
# script with the compiled library directory path or specify this path with the '-lib_map_path' switch when
# executing this script. Please type 'CKKS.sh -help' for more information.
#
# Additional references - 'Xilinx Vivado Design Suite User Guide:Logic simulation (UG900)'
#
#*********************************************************************************************************

# Directory path for design sources and include directories (if any) wrt this path
ref_dir="."

# Override directory with 'export_sim_ref_dir' env path value if set in the shell
if [[ (! -z "$export_sim_ref_dir") && ($export_sim_ref_dir != "") ]]; then
  ref_dir="$export_sim_ref_dir"
fi

# Command line options
vlogan_opts="-full64"
vhdlan_opts="-full64"
vcs_elab_opts="-full64 -debug_pp -t ps -licqueue -l elaborate.log"
vcs_sim_opts="-ucli -licqueue -l simulate.log"

# Design libraries
design_libs=(xil_defaultlib xpm axi_bram_ctrl_v4_1_1 blk_mem_gen_v8_4_3 lib_pkg_v1_0_2 lib_srl_fifo_v1_0_2 fifo_generator_v13_2_4 lib_fifo_v1_0_13 lib_cdc_v1_0_2 axi_datamover_v5_1_21 axi_sg_v4_1_12 axi_cdma_v4_1_19 generic_baseblocks_v2_1_0 axi_infrastructure_v1_1_0 axi_register_slice_v2_1_19 axi_data_fifo_v2_1_18 axi_crossbar_v2_1_20 dist_mem_gen_v8_0_13 xbip_dsp48_wrapper_v3_0_4 xbip_utils_v3_0_10 xbip_pipe_v3_0_6 xbip_dsp48_macro_v3_0_17 neorv32 proc_sys_reset_v5_0_13 xlconcat_v2_1_3 axi_protocol_converter_v2_1_19 axi_clock_converter_v2_1_18 axi_dwidth_converter_v2_1_19)

# Simulation root library directory
sim_lib_dir="vcs_lib"

# Script info
echo -e "CKKS.sh - Script generated by export_simulation (Vivado v2019.1 (64-bit)-id)\n"

# Main steps
run()
{
  check_args $# $1
  setup $1 $2
  compile
  elaborate
  simulate
}

# RUN_STEP: <compile>
compile()
{
  # Compile design files
  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" +incdir+"$ref_dir/../../../bd/CKKS/ipshared/ca68/src" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
    "/tools/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
    "/tools/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
    "/tools/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
  2>&1 | tee -a vlogan.log

  vhdlan -work xpm $vhdlan_opts \
    "/tools/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work axi_bram_ctrl_v4_1_1 $vhdlan_opts \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/70bf/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_axi_bram_ctrl_0_0/sim/CKKS_axi_bram_ctrl_0_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work blk_mem_gen_v8_4_3 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" +incdir+"$ref_dir/../../../bd/CKKS/ipshared/ca68/src" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c001/simulation/blk_mem_gen_v8_4.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" +incdir+"$ref_dir/../../../bd/CKKS/ipshared/ca68/src" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_axi_bram_ctrl_0_bram_0/sim/CKKS_axi_bram_ctrl_0_bram_0.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_axi_bram_ctrl_1_0/sim/CKKS_axi_bram_ctrl_1_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work lib_pkg_v1_0_2 $vhdlan_opts \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work lib_srl_fifo_v1_0_2 $vhdlan_opts \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work fifo_generator_v13_2_4 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" +incdir+"$ref_dir/../../../bd/CKKS/ipshared/ca68/src" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/1f5a/simulation/fifo_generator_vlog_beh.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work fifo_generator_v13_2_4 $vhdlan_opts \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work fifo_generator_v13_2_4 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" +incdir+"$ref_dir/../../../bd/CKKS/ipshared/ca68/src" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work lib_fifo_v1_0_13 $vhdlan_opts \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/4dac/hdl/lib_fifo_v1_0_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work lib_cdc_v1_0_2 $vhdlan_opts \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work axi_datamover_v5_1_21 $vhdlan_opts \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/e644/hdl/axi_datamover_v5_1_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work axi_sg_v4_1_12 $vhdlan_opts \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/91f3/hdl/axi_sg_v4_1_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work axi_cdma_v4_1_19 $vhdlan_opts \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/699c/hdl/axi_cdma_v4_1_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_axi_cdma_0_0/sim/CKKS_axi_cdma_0_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work generic_baseblocks_v2_1_0 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" +incdir+"$ref_dir/../../../bd/CKKS/ipshared/ca68/src" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_infrastructure_v1_1_0 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" +incdir+"$ref_dir/../../../bd/CKKS/ipshared/ca68/src" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_register_slice_v2_1_19 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" +incdir+"$ref_dir/../../../bd/CKKS/ipshared/ca68/src" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/4d88/hdl/axi_register_slice_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_data_fifo_v2_1_18 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" +incdir+"$ref_dir/../../../bd/CKKS/ipshared/ca68/src" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/5b9c/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_crossbar_v2_1_20 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" +incdir+"$ref_dir/../../../bd/CKKS/ipshared/ca68/src" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ace7/hdl/axi_crossbar_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" +incdir+"$ref_dir/../../../bd/CKKS/ipshared/ca68/src" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_xbar_0/sim/CKKS_xbar_0.v" \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_xbar_1/sim/CKKS_xbar_1.v" \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_clk_wiz_0_0/CKKS_clk_wiz_0_0_clk_wiz.v" \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_clk_wiz_0_0/CKKS_clk_wiz_0_0.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work dist_mem_gen_v8_0_13 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" +incdir+"$ref_dir/../../../bd/CKKS/ipshared/ca68/src" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/INS_RAM/simulation/dist_mem_gen_v8_0.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" +incdir+"$ref_dir/../../../bd/CKKS/ipshared/ca68/src" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/INS_RAM/sim/INS_RAM.v" \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/FFTAllTwiddleROM/sim/FFTAllTwiddleROM.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work xbip_dsp48_wrapper_v3_0_4 $vhdlan_opts \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/MontRed_DSP_Mult/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xbip_utils_v3_0_10 $vhdlan_opts \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/MontRed_DSP_Mult/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xbip_pipe_v3_0_6 $vhdlan_opts \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/MontRed_DSP_Mult/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xbip_dsp48_macro_v3_0_17 $vhdlan_opts \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/MontRed_DSP_Mult/hdl/xbip_dsp48_macro_v3_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/MontRed_DSP_Mult/sim/MontRed_DSP_Mult.vhd" \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/MontRed_DSP_MultAdd/sim/MontRed_DSP_MultAdd.vhd" \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/DSP_A_x_B_doublebuffer/sim/DSP_A_x_B_doublebuffer.vhd" \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/DSP_A_x_B_p_C/sim/DSP_A_x_B_p_C.vhd" \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/DSP_A_x_B/sim/DSP_A_x_B.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" +incdir+"$ref_dir/../../../bd/CKKS/ipshared/ca68/src" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/FFTTw_RNS_ROM/sim/FFTTw_RNS_ROM.v" \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/TernaryPolyBRAM/sim/TernaryPolyBRAM.v" \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/CBDPolyBRAM/sim/CBDPolyBRAM.v" \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/NTTPolyBank/sim/NTTPolyBank.v" \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/SharedFFTBramBank/sim/SharedFFTBramBank.v" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/ComputeCore.v" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/ComputeCoreWrapper.v" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/ISA_control.v" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/Trivium64.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" +incdir+"$ref_dir/../../../bd/CKKS/ipshared/ca68/src" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/BitReverse.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/CarrySaveAdder.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/ComplexMultiplier.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/DelayRegister.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/DelayRegisterReset.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/Expand.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/FFTButterfly.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/FFTButterflyAddStage.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/FFTTwFctStorage.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/FLPAdder.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/FLPAdderDenormalization.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/FLPAdderSigAddNormalize.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/FLPMultiplier.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/HammingWeight.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/INTTScale.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/IntMultPool.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/IntMultiplier_24x34.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/IntMultiplier_54x54.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/IntToFlP.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/IntToFlPWrapper.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/LeadingZeroCount.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/ModAdd.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/ModMul.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/ModSub.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/MontRed.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/MontRed_Stage.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/NTTButterfly.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/PWM.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/Project.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/RNS.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/RNSErrorPolys.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/RandomSampling.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/SharedFFTBrams.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/TriviumAdapter.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/UnifiedLoadLogic.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/UnifiedStoreLogic.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/UnifiedTransformation.sv" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/UnifiedTwFctGen.sv" \
  2>&1 | tee -a vlogan.log

  vhdlan -work neorv32 $vhdlan_opts \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_package.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_application_image.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_boot_rom.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_bootloader_image.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_intercon.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cache.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cfs.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_clockgate.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_fifo.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_decompressor.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_control.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_regfile.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_cp_shifter.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_cp_muldiv.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_cp_bitmanip.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_cp_fpu.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_cp_cfu.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_cp_cond.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_alu.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_lsu.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_pmp.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_crc.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_debug_dm.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_debug_dtm.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_dma.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_dmem.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_gpio.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_gptmr.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_imem.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_mtime.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_neoled.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_onewire.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_pwm.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_sdi.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_slink.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_spi.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_sysinfo.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_xip.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_xbus.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_wdt.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_uart.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_twi.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_trng.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_xirq.vhd" \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_top.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/CKKS/ipshared/ca68/src/neorv32_vivado_ip.vhd" \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/sim/CKKS_neorv32_vivado_ip_0_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work proc_sys_reset_v5_0_13 $vhdlan_opts \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_proc_sys_reset_0_0/sim/CKKS_proc_sys_reset_0_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work xlconcat_v2_1_3 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" +incdir+"$ref_dir/../../../bd/CKKS/ipshared/ca68/src" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" +incdir+"$ref_dir/../../../bd/CKKS/ipshared/ca68/src" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_xlconcat_0_0/sim/CKKS_xlconcat_0_0.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_protocol_converter_v2_1_19 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" +incdir+"$ref_dir/../../../bd/CKKS/ipshared/ca68/src" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c83a/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" +incdir+"$ref_dir/../../../bd/CKKS/ipshared/ca68/src" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_auto_pc_0/sim/CKKS_auto_pc_0.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_clock_converter_v2_1_18 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" +incdir+"$ref_dir/../../../bd/CKKS/ipshared/ca68/src" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ac9d/hdl/axi_clock_converter_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_dwidth_converter_v2_1_19 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" +incdir+"$ref_dir/../../../bd/CKKS/ipshared/ca68/src" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
    "$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/e578/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" +incdir+"$ref_dir/../../../bd/CKKS/ipshared/ca68/src" +incdir+"$ref_dir/../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_auto_us_0/sim/CKKS_auto_us_0.v" \
    "$ref_dir/../../../bd/CKKS/ip/CKKS_auto_ds_0/sim/CKKS_auto_ds_0.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/CKKS/sim/CKKS.vhd" \
  2>&1 | tee -a vhdlan.log


  vlogan -work xil_defaultlib $vlogan_opts +v2k \
    glbl.v \
  2>&1 | tee -a vlogan.log

}

# RUN_STEP: <elaborate>
elaborate()
{
  vcs $vcs_elab_opts xil_defaultlib.CKKS xil_defaultlib.glbl -o CKKS_simv
}

# RUN_STEP: <simulate>
simulate()
{
  ./CKKS_simv $vcs_sim_opts -do simulate.do
}

# STEP: setup
setup()
{
  case $1 in
    "-lib_map_path" )
      if [[ ($2 == "") ]]; then
        echo -e "ERROR: Simulation library directory path not specified (type \"./CKKS.sh -help\" for more information)\n"
        exit 1
      fi
      create_lib_mappings $2
    ;;
    "-reset_run" )
      reset_run
      echo -e "INFO: Simulation run files deleted.\n"
      exit 0
    ;;
    "-noclean_files" )
      # do not remove previous data
    ;;
    * )
      create_lib_mappings $2
  esac

  create_lib_dir

  # Add any setup/initialization commands here:-

  # <user specific commands>

}

# Define design library mappings
create_lib_mappings()
{
  file="synopsys_sim.setup"
  if [[ -e $file ]]; then
    if [[ ($1 == "") ]]; then
      return
    else
      rm -rf $file
    fi
  fi

  touch $file

  if [[ ($1 != "") ]]; then
    lib_map_path="$1"
  else
    lib_map_path="/home/sam/Documents/git_version/defense_design/CFS_design/CFS_design.cache/compile_simlib/vcs"
  fi

  for (( i=0; i<${#design_libs[*]}; i++ )); do
    lib="${design_libs[i]}"
    mapping="$lib:$sim_lib_dir/$lib"
    echo $mapping >> $file
  done

  if [[ ($lib_map_path != "") ]]; then
    incl_ref="OTHERS=$lib_map_path/synopsys_sim.setup"
    echo $incl_ref >> $file
  fi
}

# Create design library directory paths
create_lib_dir()
{
  if [[ -e $sim_lib_dir ]]; then
    rm -rf $sim_lib_dir
  fi

  for (( i=0; i<${#design_libs[*]}; i++ )); do
    lib="${design_libs[i]}"
    lib_dir="$sim_lib_dir/$lib"
    if [[ ! -e $lib_dir ]]; then
      mkdir -p $lib_dir
    fi
  done
}

# Delete generated data from the previous run
reset_run()
{
  files_to_remove=(ucli.key CKKS_simv vlogan.log vhdlan.log compile.log elaborate.log simulate.log .vlogansetup.env .vlogansetup.args .vcs_lib_lock scirocco_command.log 64 AN.DB csrc CKKS_simv.daidir)
  for (( i=0; i<${#files_to_remove[*]}; i++ )); do
    file="${files_to_remove[i]}"
    if [[ -e $file ]]; then
      rm -rf $file
    fi
  done

  create_lib_dir
}

# Check command line arguments
check_args()
{
  if [[ ($1 == 1 ) && ($2 != "-lib_map_path" && $2 != "-noclean_files" && $2 != "-reset_run" && $2 != "-help" && $2 != "-h") ]]; then
    echo -e "ERROR: Unknown option specified '$2' (type \"./CKKS.sh -help\" for more information)\n"
    exit 1
  fi

  if [[ ($2 == "-help" || $2 == "-h") ]]; then
    usage
  fi
}

# Script usage
usage()
{
  msg="Usage: CKKS.sh [-help]\n\
Usage: CKKS.sh [-lib_map_path]\n\
Usage: CKKS.sh [-reset_run]\n\
Usage: CKKS.sh [-noclean_files]\n\n\
[-help] -- Print help information for this script\n\n\
[-lib_map_path <path>] -- Compiled simulation library directory path. The simulation library is compiled\n\
using the compile_simlib tcl command. Please see 'compile_simlib -help' for more information.\n\n\
[-reset_run] -- Recreate simulator setup files and library mappings for a clean run. The generated files\n\
from the previous run will be removed. If you don't want to remove the simulator generated files, use the\n\
-noclean_files switch.\n\n\
[-noclean_files] -- Reset previous run, but do not remove simulator generated files from the previous run.\n\n"
  echo -e $msg
  exit 1
}

# Launch script
run $1 $2
