#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Mon Oct 21 22:42:44 CEST 2024
# SW Build 2552052 on Fri May 24 14:47:09 MDT 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xsim test_CKKS_behav -key {Behavioral:sim_1:Functional:test_CKKS} -tclbatch test_CKKS.tcl -protoinst "protoinst_files/CKKS.protoinst" -view /home/sam/Documents/thesis-defense/defense_design/CFS_design/neorv32_tb_simple_behav_thesis_cfs.wcfg -view /home/sam/Documents/git_version/defense_design/CFS_design/neorv32_tb_bd_CKKS_test_behav.wcfg -log simulate.log"
xsim test_CKKS_behav -key {Behavioral:sim_1:Functional:test_CKKS} -tclbatch test_CKKS.tcl -protoinst "protoinst_files/CKKS.protoinst" -view /home/sam/Documents/thesis-defense/defense_design/CFS_design/neorv32_tb_simple_behav_thesis_cfs.wcfg -view /home/sam/Documents/git_version/defense_design/CFS_design/neorv32_tb_bd_CKKS_test_behav.wcfg -log simulate.log

