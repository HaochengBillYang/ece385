transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/16_bit_register.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/BUS.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/allMUX.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/HexDriver.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/test_memory.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/synchronizers.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/SLC3_2.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/Mem2IO.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/ISDU.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/PCMUX.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/MARMUX.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/SR2MUX.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/MIOEN.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/BEN.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/DRMUX.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/ALU.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/SR1MUX.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/MDR.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/MAR.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/memory_contents.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/PC.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/IR.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/REGFILE.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/datapath.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/slc3.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/slc3_testtop.sv}

vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 1000000 ns
