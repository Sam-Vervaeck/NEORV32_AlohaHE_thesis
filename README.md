## Description

During my Master's thesis of 2023-2024 at the COSIC group at the KU Leuven, I had a topic on the CKKS algorithm for fully homomorphic encryption (FHE). I made a demo to show the integration of a hardware accelerator for CKKS and a RISC-V core. For the accelerator I chose the state-of-the-art [Aloha-HE](https://github.com/flokrieger/Aloha-HE) accelerator from Florian Krieger et al. at that time. For the RISC-V core I chose the [NEORV32](https://github.com/stnolting/neorv32/tree/main) by Stephan Nolting. 

This repository contains a Vivado project showcasing a CKKS encryption demo. The Aloha-HE accelerator is integrated into the Custom Fuction Subsystem (CFS) of the NEORV32 and has an input and output channel that propagates all the way to the toplevel op the core. A block diagram contains the NEORV32 and a BRAM which stores the test data for the CKKS computations through a .coe file initialisation. The program execution is controlled by NEORV32 and the CKKS computations are performed by Aloha-HE by offloading the data to the CFS block containing the accelerator.

Relevant disclaimer: This repo contains academic research. It does not come with any guarantee of support, warranty, or responsibility.

## Possible reasons why you might want to have a look or ask questions

* For Aloha-HE: At the time (October 2024), the Aloha-HE repo only has a block design that contains a DDR block for the test data. This cannot be simulated and has to be tested on an actual FPGA board. This repository contains a block design with a BRAM for data to enable simulations to be performed.
* For NEORV32: Inspiration can be taken from the CFS implementation on how to add custom hardware into the NEORV32 and how to add software files that control the new hardware.

### Dependencies

* Vivado version: 2019.1
* Linux Ubuntu version: 20.04.6 LTS
* FPGA: Kintex-7 Genesys 2 board (not included in the free Vivado license!)
* Aloha-HE commit: a9c9bded5a3c57642df6799177bacb07d022a1bd
* NEORV32 commit: 598f34905f650c157b1108f8b19a0c1cea2a0045

### Required knowledge

You will need to have an understanding of:
* The [user guide](https://stnolting.github.io/neorv32/ug/) of NEORV32 to understand the compilation steps of the CKKS demo program.
* The [datasheet](https://stnolting.github.io/neorv32/) of NEORV32 to understand the functioning of the CFS.
* The [toplevel](https://github.com/flokrieger/Aloha-HE/blob/main/Aloha-HE_Common/ComputeCoreWrapper.v) of Aloha-HE to understand the signals being driven in the RTL code.
* The CKKS algorithm to understand the various software steps of the encryption demo.

### Installing

* Clone this repository
* You can find the .xpr project file for Vivado in /defense_design/CFS_design
* It should open without problems in the correct Vivado version, see previous section. I am already looking forward to this not working on other machines XD.
* The integrated design is contained in /defense_design (named after the design I presented during my thesis defense). I chose to not import the Aloha-HE and NEORV32 design files into this new Vivado project.
* The Aloha-HE design files are located in /thesis_Aloha-HE.
* The NEORV32 design files are located in /thesis_neorv32.

### Executing program

* You can find the waveform configuration file for the simulation of the CKKS testbench in /defense_design/CFS_design
* You can find the .coe file with the initialisation data in /defense_design
* You can find the block diagram in the project
* You can find a successful synthesis and implementation included in the project
* You can find the CFS RTL code in /thesis_neorv32/rtl/core/neorv32_cfs.vhd
* You can find the program software code /thesis_neorv32/sw/example/thesis_ckks. The main test code and data is located in thesis_neorv32/sw/example/thesis_ckks/test_files

* Currently, the demo program is built into the instruction memory (IMEM) of NEORV32 as ROM so it automatically gets executed when simulation starts.
* To run a different program, change the CKKS software example code and run the compile steps for simulation from the NEORV32 user guide. Afterwards run the Vivado IP tcl update script with the steps from the NEORV32 user guide to bake the new IMEM ROM contents into the Vivado IP block.
* To run with different input data, change the contents of the .coe file.

## Help

Feel free to create an issue or a discussion. If I have the time I might look at them :).

## Authors

[Sam Vervaeck](https://www.linkedin.com/in/sam-vervaeck)

## License

This is open-source, so you can use it freely, please just cite it if used.

## Acknowledgments

Code is (mainly) used from [Florian Krieger](https://github.com/flokrieger) and [Stephan Nolting](https://github.com/stnolting). A huge huge thank you to them for answering all my questions during the development of this project!!
