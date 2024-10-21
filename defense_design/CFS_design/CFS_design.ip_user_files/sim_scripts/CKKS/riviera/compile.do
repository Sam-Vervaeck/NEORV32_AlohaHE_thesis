vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/axi_bram_ctrl_v4_1_1
vlib riviera/blk_mem_gen_v8_4_3
vlib riviera/lib_pkg_v1_0_2
vlib riviera/lib_srl_fifo_v1_0_2
vlib riviera/fifo_generator_v13_2_4
vlib riviera/lib_fifo_v1_0_13
vlib riviera/lib_cdc_v1_0_2
vlib riviera/axi_datamover_v5_1_21
vlib riviera/axi_sg_v4_1_12
vlib riviera/axi_cdma_v4_1_19
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_register_slice_v2_1_19
vlib riviera/axi_data_fifo_v2_1_18
vlib riviera/axi_crossbar_v2_1_20
vlib riviera/dist_mem_gen_v8_0_13
vlib riviera/xbip_dsp48_wrapper_v3_0_4
vlib riviera/xbip_utils_v3_0_10
vlib riviera/xbip_pipe_v3_0_6
vlib riviera/xbip_dsp48_macro_v3_0_17
vlib riviera/neorv32
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/xlconcat_v2_1_3
vlib riviera/axi_protocol_converter_v2_1_19
vlib riviera/axi_clock_converter_v2_1_18
vlib riviera/axi_dwidth_converter_v2_1_19

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap axi_bram_ctrl_v4_1_1 riviera/axi_bram_ctrl_v4_1_1
vmap blk_mem_gen_v8_4_3 riviera/blk_mem_gen_v8_4_3
vmap lib_pkg_v1_0_2 riviera/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 riviera/lib_srl_fifo_v1_0_2
vmap fifo_generator_v13_2_4 riviera/fifo_generator_v13_2_4
vmap lib_fifo_v1_0_13 riviera/lib_fifo_v1_0_13
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap axi_datamover_v5_1_21 riviera/axi_datamover_v5_1_21
vmap axi_sg_v4_1_12 riviera/axi_sg_v4_1_12
vmap axi_cdma_v4_1_19 riviera/axi_cdma_v4_1_19
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_19 riviera/axi_register_slice_v2_1_19
vmap axi_data_fifo_v2_1_18 riviera/axi_data_fifo_v2_1_18
vmap axi_crossbar_v2_1_20 riviera/axi_crossbar_v2_1_20
vmap dist_mem_gen_v8_0_13 riviera/dist_mem_gen_v8_0_13
vmap xbip_dsp48_wrapper_v3_0_4 riviera/xbip_dsp48_wrapper_v3_0_4
vmap xbip_utils_v3_0_10 riviera/xbip_utils_v3_0_10
vmap xbip_pipe_v3_0_6 riviera/xbip_pipe_v3_0_6
vmap xbip_dsp48_macro_v3_0_17 riviera/xbip_dsp48_macro_v3_0_17
vmap neorv32 riviera/neorv32
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap xlconcat_v2_1_3 riviera/xlconcat_v2_1_3
vmap axi_protocol_converter_v2_1_19 riviera/axi_protocol_converter_v2_1_19
vmap axi_clock_converter_v2_1_18 riviera/axi_clock_converter_v2_1_18
vmap axi_dwidth_converter_v2_1_19 riviera/axi_dwidth_converter_v2_1_19

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" "+incdir+../../../bd/CKKS/ipshared/ca68/src" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
"/tools/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/tools/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/tools/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/tools/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work axi_bram_ctrl_v4_1_1 -93 \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/70bf/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/CKKS/ip/CKKS_axi_bram_ctrl_0_0/sim/CKKS_axi_bram_ctrl_0_0.vhd" \

vlog -work blk_mem_gen_v8_4_3  -v2k5 "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" "+incdir+../../../bd/CKKS/ipshared/ca68/src" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c001/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" "+incdir+../../../bd/CKKS/ipshared/ca68/src" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
"../../../bd/CKKS/ip/CKKS_axi_bram_ctrl_0_bram_0/sim/CKKS_axi_bram_ctrl_0_bram_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/CKKS/ip/CKKS_axi_bram_ctrl_1_0/sim/CKKS_axi_bram_ctrl_1_0.vhd" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_4  -v2k5 "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" "+incdir+../../../bd/CKKS/ipshared/ca68/src" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/1f5a/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_4 -93 \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_4  -v2k5 "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" "+incdir+../../../bd/CKKS/ipshared/ca68/src" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_13 -93 \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/4dac/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_21 -93 \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/e644/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_12 -93 \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/91f3/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_cdma_v4_1_19 -93 \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/699c/hdl/axi_cdma_v4_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/CKKS/ip/CKKS_axi_cdma_0_0/sim/CKKS_axi_cdma_0_0.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" "+incdir+../../../bd/CKKS/ipshared/ca68/src" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" "+incdir+../../../bd/CKKS/ipshared/ca68/src" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_19  -v2k5 "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" "+incdir+../../../bd/CKKS/ipshared/ca68/src" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/4d88/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_18  -v2k5 "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" "+incdir+../../../bd/CKKS/ipshared/ca68/src" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/5b9c/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_20  -v2k5 "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" "+incdir+../../../bd/CKKS/ipshared/ca68/src" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ace7/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" "+incdir+../../../bd/CKKS/ipshared/ca68/src" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
"../../../bd/CKKS/ip/CKKS_xbar_0/sim/CKKS_xbar_0.v" \
"../../../bd/CKKS/ip/CKKS_xbar_1/sim/CKKS_xbar_1.v" \
"../../../bd/CKKS/ip/CKKS_clk_wiz_0_0/CKKS_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/CKKS/ip/CKKS_clk_wiz_0_0/CKKS_clk_wiz_0_0.v" \

vlog -work dist_mem_gen_v8_0_13  -v2k5 "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" "+incdir+../../../bd/CKKS/ipshared/ca68/src" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/INS_RAM/simulation/dist_mem_gen_v8_0.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" "+incdir+../../../bd/CKKS/ipshared/ca68/src" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
"../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/INS_RAM/sim/INS_RAM.v" \
"../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/FFTAllTwiddleROM/sim/FFTAllTwiddleROM.v" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -93 \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/MontRed_DSP_Mult/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_utils_v3_0_10 -93 \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/MontRed_DSP_Mult/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -93 \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/MontRed_DSP_Mult/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_macro_v3_0_17 -93 \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/MontRed_DSP_Mult/hdl/xbip_dsp48_macro_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/MontRed_DSP_Mult/sim/MontRed_DSP_Mult.vhd" \
"../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/MontRed_DSP_MultAdd/sim/MontRed_DSP_MultAdd.vhd" \
"../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/DSP_A_x_B_doublebuffer/sim/DSP_A_x_B_doublebuffer.vhd" \
"../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/DSP_A_x_B_p_C/sim/DSP_A_x_B_p_C.vhd" \
"../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/DSP_A_x_B/sim/DSP_A_x_B.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" "+incdir+../../../bd/CKKS/ipshared/ca68/src" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
"../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/FFTTw_RNS_ROM/sim/FFTTw_RNS_ROM.v" \
"../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/TernaryPolyBRAM/sim/TernaryPolyBRAM.v" \
"../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/CBDPolyBRAM/sim/CBDPolyBRAM.v" \
"../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/NTTPolyBank/sim/NTTPolyBank.v" \
"../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/SharedFFTBramBank/sim/SharedFFTBramBank.v" \
"../../../bd/CKKS/ipshared/ca68/src/ComputeCore.v" \
"../../../bd/CKKS/ipshared/ca68/src/ComputeCoreWrapper.v" \
"../../../bd/CKKS/ipshared/ca68/src/ISA_control.v" \
"../../../bd/CKKS/ipshared/ca68/src/Trivium64.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" "+incdir+../../../bd/CKKS/ipshared/ca68/src" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
"../../../bd/CKKS/ipshared/ca68/src/BitReverse.sv" \
"../../../bd/CKKS/ipshared/ca68/src/CarrySaveAdder.sv" \
"../../../bd/CKKS/ipshared/ca68/src/ComplexMultiplier.sv" \
"../../../bd/CKKS/ipshared/ca68/src/DelayRegister.sv" \
"../../../bd/CKKS/ipshared/ca68/src/DelayRegisterReset.sv" \
"../../../bd/CKKS/ipshared/ca68/src/Expand.sv" \
"../../../bd/CKKS/ipshared/ca68/src/FFTButterfly.sv" \
"../../../bd/CKKS/ipshared/ca68/src/FFTButterflyAddStage.sv" \
"../../../bd/CKKS/ipshared/ca68/src/FFTTwFctStorage.sv" \
"../../../bd/CKKS/ipshared/ca68/src/FLPAdder.sv" \
"../../../bd/CKKS/ipshared/ca68/src/FLPAdderDenormalization.sv" \
"../../../bd/CKKS/ipshared/ca68/src/FLPAdderSigAddNormalize.sv" \
"../../../bd/CKKS/ipshared/ca68/src/FLPMultiplier.sv" \
"../../../bd/CKKS/ipshared/ca68/src/HammingWeight.sv" \
"../../../bd/CKKS/ipshared/ca68/src/INTTScale.sv" \
"../../../bd/CKKS/ipshared/ca68/src/IntMultPool.sv" \
"../../../bd/CKKS/ipshared/ca68/src/IntMultiplier_24x34.sv" \
"../../../bd/CKKS/ipshared/ca68/src/IntMultiplier_54x54.sv" \
"../../../bd/CKKS/ipshared/ca68/src/IntToFlP.sv" \
"../../../bd/CKKS/ipshared/ca68/src/IntToFlPWrapper.sv" \
"../../../bd/CKKS/ipshared/ca68/src/LeadingZeroCount.sv" \
"../../../bd/CKKS/ipshared/ca68/src/ModAdd.sv" \
"../../../bd/CKKS/ipshared/ca68/src/ModMul.sv" \
"../../../bd/CKKS/ipshared/ca68/src/ModSub.sv" \
"../../../bd/CKKS/ipshared/ca68/src/MontRed.sv" \
"../../../bd/CKKS/ipshared/ca68/src/MontRed_Stage.sv" \
"../../../bd/CKKS/ipshared/ca68/src/NTTButterfly.sv" \
"../../../bd/CKKS/ipshared/ca68/src/PWM.sv" \
"../../../bd/CKKS/ipshared/ca68/src/Project.sv" \
"../../../bd/CKKS/ipshared/ca68/src/RNS.sv" \
"../../../bd/CKKS/ipshared/ca68/src/RNSErrorPolys.sv" \
"../../../bd/CKKS/ipshared/ca68/src/RandomSampling.sv" \
"../../../bd/CKKS/ipshared/ca68/src/SharedFFTBrams.sv" \
"../../../bd/CKKS/ipshared/ca68/src/TriviumAdapter.sv" \
"../../../bd/CKKS/ipshared/ca68/src/UnifiedLoadLogic.sv" \
"../../../bd/CKKS/ipshared/ca68/src/UnifiedStoreLogic.sv" \
"../../../bd/CKKS/ipshared/ca68/src/UnifiedTransformation.sv" \
"../../../bd/CKKS/ipshared/ca68/src/UnifiedTwFctGen.sv" \

vcom -work neorv32 -93 \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_package.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_application_image.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_boot_rom.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_bootloader_image.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_intercon.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cache.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cfs.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_clockgate.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_fifo.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_decompressor.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_control.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_regfile.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_cp_shifter.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_cp_muldiv.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_cp_bitmanip.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_cp_fpu.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_cp_cfu.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_cp_cond.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_alu.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_lsu.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu_pmp.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_cpu.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_crc.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_debug_dm.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_debug_dtm.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_dma.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_dmem.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_gpio.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_gptmr.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_imem.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_mtime.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_neoled.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_onewire.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_pwm.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_sdi.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_slink.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_spi.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_sysinfo.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_xip.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_xbus.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_wdt.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_uart.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_twi.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_trng.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_xirq.vhd" \
"../../../bd/CKKS/ipshared/ca68/src/neorv32/neorv32_top.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/CKKS/ipshared/ca68/src/neorv32_vivado_ip.vhd" \
"../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/sim/CKKS_neorv32_vivado_ip_0_0.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/CKKS/ip/CKKS_proc_sys_reset_0_0/sim/CKKS_proc_sys_reset_0_0.vhd" \

vlog -work xlconcat_v2_1_3  -v2k5 "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" "+incdir+../../../bd/CKKS/ipshared/ca68/src" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" "+incdir+../../../bd/CKKS/ipshared/ca68/src" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
"../../../bd/CKKS/ip/CKKS_xlconcat_0_0/sim/CKKS_xlconcat_0_0.v" \

vlog -work axi_protocol_converter_v2_1_19  -v2k5 "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" "+incdir+../../../bd/CKKS/ipshared/ca68/src" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c83a/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" "+incdir+../../../bd/CKKS/ipshared/ca68/src" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
"../../../bd/CKKS/ip/CKKS_auto_pc_0/sim/CKKS_auto_pc_0.v" \

vlog -work axi_clock_converter_v2_1_18  -v2k5 "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" "+incdir+../../../bd/CKKS/ipshared/ca68/src" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ac9d/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work axi_dwidth_converter_v2_1_19  -v2k5 "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" "+incdir+../../../bd/CKKS/ipshared/ca68/src" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
"../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/e578/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c923" "+incdir+../../../bd/CKKS/ipshared/ca68/src" "+incdir+../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ca68/src" \
"../../../bd/CKKS/ip/CKKS_auto_us_0/sim/CKKS_auto_us_0.v" \
"../../../bd/CKKS/ip/CKKS_auto_ds_0/sim/CKKS_auto_ds_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/CKKS/sim/CKKS.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

