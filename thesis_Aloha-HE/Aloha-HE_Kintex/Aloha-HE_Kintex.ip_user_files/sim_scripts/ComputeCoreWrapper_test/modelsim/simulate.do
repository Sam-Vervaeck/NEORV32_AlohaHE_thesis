onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xilinx_vip -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.ComputeCoreWrapper_test xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {ComputeCoreWrapper_test.udo}

run -all

quit -force
