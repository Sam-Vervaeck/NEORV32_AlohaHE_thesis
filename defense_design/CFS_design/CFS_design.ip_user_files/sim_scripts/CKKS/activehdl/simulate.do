onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+CKKS -L xil_defaultlib -L xpm -L axi_bram_ctrl_v4_1_1 -L blk_mem_gen_v8_4_3 -L lib_pkg_v1_0_2 -L lib_srl_fifo_v1_0_2 -L fifo_generator_v13_2_4 -L lib_fifo_v1_0_13 -L lib_cdc_v1_0_2 -L axi_datamover_v5_1_21 -L axi_sg_v4_1_12 -L axi_cdma_v4_1_19 -L generic_baseblocks_v2_1_0 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_19 -L axi_data_fifo_v2_1_18 -L axi_crossbar_v2_1_20 -L dist_mem_gen_v8_0_13 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_utils_v3_0_10 -L xbip_pipe_v3_0_6 -L xbip_dsp48_macro_v3_0_17 -L neorv32 -L proc_sys_reset_v5_0_13 -L xlconcat_v2_1_3 -L axi_protocol_converter_v2_1_19 -L axi_clock_converter_v2_1_18 -L axi_dwidth_converter_v2_1_19 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.CKKS xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {CKKS.udo}

run -all

endsim

quit -force
