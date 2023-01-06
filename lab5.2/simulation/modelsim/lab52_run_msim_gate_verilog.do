transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {lab52.vo}

vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ece385/lab5.2 {C:/intelFPGA_lite/18.1/ece385/lab5.2/testbench.sv}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L gate_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 10000 ns
