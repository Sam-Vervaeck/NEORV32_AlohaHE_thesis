onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+MontRed_DSP_MultAdd -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.MontRed_DSP_MultAdd xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {MontRed_DSP_MultAdd.udo}

run -all

endsim

quit -force
