set_property SRC_FILE_INFO {cfile:/home/sam/Documents/thesis-defense/defense_design/CFS_design/CFS_design.srcs/constrs_1/imports/digilent-xdc/Genesys-2-Master.xdc rfile:../../../CFS_design.srcs/constrs_1/imports/digilent-xdc/Genesys-2-Master.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN AD11  IOSTANDARD LVDS     } [get_ports { sys_diff_clock_clk_n }]; #IO_L12N_T1_MRCC_33 Sch=sysclk_n
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN AD12  IOSTANDARD LVDS     } [get_ports { sys_diff_clock_clk_p }]; #IO_L12P_T1_MRCC_33 Sch=sysclk_p
set_property src_info {type:XDC file:1 line:16 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN R19   IOSTANDARD LVCMOS33 } [get_ports { reset }]; #IO_0_14 Sch=cpu_resetn
