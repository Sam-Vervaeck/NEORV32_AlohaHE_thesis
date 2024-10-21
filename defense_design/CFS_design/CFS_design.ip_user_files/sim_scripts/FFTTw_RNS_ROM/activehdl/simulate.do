onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+FFTTw_RNS_ROM -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.FFTTw_RNS_ROM xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {FFTTw_RNS_ROM.udo}

run -all

endsim

quit -force
