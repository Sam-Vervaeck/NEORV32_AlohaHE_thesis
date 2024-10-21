onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+DSP_A_x_B -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.DSP_A_x_B xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {DSP_A_x_B.udo}

run -all

endsim

quit -force
