onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+ComputeCoreWrapper_test -L xilinx_vip -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.ComputeCoreWrapper_test xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {ComputeCoreWrapper_test.udo}

run -all

endsim

quit -force
