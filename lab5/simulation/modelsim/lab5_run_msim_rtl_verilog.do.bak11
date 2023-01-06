transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5 {C:/intelFPGA_lite/18.1/ece385/lab5/test_memory.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5 {C:/intelFPGA_lite/18.1/ece385/lab5/synchronizers.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5 {C:/intelFPGA_lite/18.1/ece385/lab5/SLC3_2.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5 {C:/intelFPGA_lite/18.1/ece385/lab5/Mem2IO.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5 {C:/intelFPGA_lite/18.1/ece385/lab5/ISDU.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5 {C:/intelFPGA_lite/18.1/ece385/lab5/16_bit_register.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5 {C:/intelFPGA_lite/18.1/ece385/lab5/allMUX.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5 {C:/intelFPGA_lite/18.1/ece385/lab5/HexDriver.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5 {C:/intelFPGA_lite/18.1/ece385/lab5/alltopMUX.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5 {C:/intelFPGA_lite/18.1/ece385/lab5/BUS.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5 {C:/intelFPGA_lite/18.1/ece385/lab5/memory_contents.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5 {C:/intelFPGA_lite/18.1/ece385/lab5/PC.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5 {C:/intelFPGA_lite/18.1/ece385/lab5/MAR.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5 {C:/intelFPGA_lite/18.1/ece385/lab5/MDR.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5 {C:/intelFPGA_lite/18.1/ece385/lab5/IR.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5 {C:/intelFPGA_lite/18.1/ece385/lab5/slc3.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5 {C:/intelFPGA_lite/18.1/ece385/lab5/slc3_testtop.sv}

vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5 {C:/intelFPGA_lite/18.1/ece385/lab5/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 2000 ns
