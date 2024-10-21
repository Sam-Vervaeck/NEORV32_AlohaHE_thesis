-makelib xcelium_lib/xil_defaultlib -sv \
  "/tools/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/tools/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "/tools/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/tools/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/axi_bram_ctrl_v4_1_1 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/70bf/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/CKKS/ip/CKKS_axi_bram_ctrl_0_0/sim/CKKS_axi_bram_ctrl_0_0.vhd" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_3 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c001/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/CKKS/ip/CKKS_axi_bram_ctrl_0_bram_0/sim/CKKS_axi_bram_ctrl_0_bram_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/CKKS/ip/CKKS_axi_bram_ctrl_1_0/sim/CKKS_axi_bram_ctrl_1_0.vhd" \
-endlib
-makelib xcelium_lib/lib_pkg_v1_0_2 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_srl_fifo_v1_0_2 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_4 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/1f5a/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_4 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_4 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/lib_fifo_v1_0_13 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/4dac/hdl/lib_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_datamover_v5_1_21 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/e644/hdl/axi_datamover_v5_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_sg_v4_1_12 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/91f3/hdl/axi_sg_v4_1_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_cdma_v4_1_19 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/699c/hdl/axi_cdma_v4_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/CKKS/ip/CKKS_axi_cdma_0_0/sim/CKKS_axi_cdma_0_0.vhd" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_19 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/4d88/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_18 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/5b9c/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_crossbar_v2_1_20 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ace7/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/CKKS/ip/CKKS_xbar_0/sim/CKKS_xbar_0.v" \
  "../../../bd/CKKS/ip/CKKS_xbar_1/sim/CKKS_xbar_1.v" \
  "../../../bd/CKKS/ip/CKKS_clk_wiz_0_0/CKKS_clk_wiz_0_0_clk_wiz.v" \
  "../../../bd/CKKS/ip/CKKS_clk_wiz_0_0/CKKS_clk_wiz_0_0.v" \
-endlib
-makelib xcelium_lib/dist_mem_gen_v8_0_13 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/INS_RAM/simulation/dist_mem_gen_v8_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/INS_RAM/sim/INS_RAM.v" \
  "../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/FFTAllTwiddleROM/sim/FFTAllTwiddleROM.v" \
-endlib
-makelib xcelium_lib/xbip_dsp48_wrapper_v3_0_4 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/MontRed_DSP_Mult/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_utils_v3_0_10 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/MontRed_DSP_Mult/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_pipe_v3_0_6 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/MontRed_DSP_Mult/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_dsp48_macro_v3_0_17 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/MontRed_DSP_Mult/hdl/xbip_dsp48_macro_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/MontRed_DSP_Mult/sim/MontRed_DSP_Mult.vhd" \
  "../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/MontRed_DSP_MultAdd/sim/MontRed_DSP_MultAdd.vhd" \
  "../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/DSP_A_x_B_doublebuffer/sim/DSP_A_x_B_doublebuffer.vhd" \
  "../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/DSP_A_x_B_p_C/sim/DSP_A_x_B_p_C.vhd" \
  "../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/DSP_A_x_B/sim/DSP_A_x_B.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/FFTTw_RNS_ROM/sim/FFTTw_RNS_ROM.v" \
  "../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/TernaryPolyBRAM/sim/TernaryPolyBRAM.v" \
  "../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/CBDPolyBRAM/sim/CBDPolyBRAM.v" \
  "../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/NTTPolyBank/sim/NTTPolyBank.v" \
  "../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/src/SharedFFTBramBank/sim/SharedFFTBramBank.v" \
  "../../../bd/CKKS/ipshared/ca68/src/ComputeCore.v" \
  "../../../bd/CKKS/ipshared/ca68/src/ComputeCoreWrapper.v" \
  "../../../bd/CKKS/ipshared/ca68/src/ISA_control.v" \
  "../../../bd/CKKS/ipshared/ca68/src/Trivium64.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
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
-endlib
-makelib xcelium_lib/neorv32 \
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
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/CKKS/ipshared/ca68/src/neorv32_vivado_ip.vhd" \
  "../../../bd/CKKS/ip/CKKS_neorv32_vivado_ip_0_0/sim/CKKS_neorv32_vivado_ip_0_0.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/CKKS/ip/CKKS_proc_sys_reset_0_0/sim/CKKS_proc_sys_reset_0_0.vhd" \
-endlib
-makelib xcelium_lib/xlconcat_v2_1_3 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/CKKS/ip/CKKS_xlconcat_0_0/sim/CKKS_xlconcat_0_0.v" \
-endlib
-makelib xcelium_lib/axi_protocol_converter_v2_1_19 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/c83a/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/CKKS/ip/CKKS_auto_pc_0/sim/CKKS_auto_pc_0.v" \
-endlib
-makelib xcelium_lib/axi_clock_converter_v2_1_18 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/ac9d/hdl/axi_clock_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_dwidth_converter_v2_1_19 \
  "../../../../CFS_design.srcs/sources_1/bd/CKKS/ipshared/e578/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/CKKS/ip/CKKS_auto_us_0/sim/CKKS_auto_us_0.v" \
  "../../../bd/CKKS/ip/CKKS_auto_ds_0/sim/CKKS_auto_ds_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/CKKS/sim/CKKS.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

