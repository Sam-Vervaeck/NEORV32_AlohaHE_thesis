onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.DSP_A_x_B_doublebuffer xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {DSP_A_x_B_doublebuffer.udo}

run -all

quit -force
