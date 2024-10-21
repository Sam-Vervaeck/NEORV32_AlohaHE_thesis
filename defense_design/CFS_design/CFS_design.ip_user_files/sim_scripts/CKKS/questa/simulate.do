onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib CKKS_opt

do {wave.do}

view wave
view structure
view signals

do {CKKS.udo}

run -all

quit -force
