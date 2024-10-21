# Modify this variable to fit your NEORV32 setup (neorv32 home folder)
NEORV32_HOME ?= ../../..

APP_SRC ?= $(wildcard ./*.c) $(wildcard ./*.s) $(wildcard ./*.cpp) $(wildcard ./*.S) $(wildcard ./test_files/*.c) $(wildcard ./test_files/*.s) $(wildcard ./test_files/*.cpp) $(wildcard ./test_files/*.S)
APP_INC ?= -I . -I ./test_files

include $(NEORV32_HOME)/sw/common/common.mk
