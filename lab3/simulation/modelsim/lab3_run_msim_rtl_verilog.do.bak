transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab3 {C:/intelFPGA_lite/18.1/ece385/lab3/router.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab3 {C:/intelFPGA_lite/18.1/ece385/lab3/ripple_adder.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab3 {C:/intelFPGA_lite/18.1/ece385/lab3/reg_17.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab3 {C:/intelFPGA_lite/18.1/ece385/lab3/HexDriver.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab3 {C:/intelFPGA_lite/18.1/ece385/lab3/control.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab3 {C:/intelFPGA_lite/18.1/ece385/lab3/Adder4.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab3 {C:/intelFPGA_lite/18.1/ece385/lab3/adder2.sv}

vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab3 {C:/intelFPGA_lite/18.1/ece385/lab3/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 200 ns
