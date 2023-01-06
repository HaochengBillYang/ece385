transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/ISDU.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/BEN_.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/ALU_.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/HexDriver.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/MDR_.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/MAR_.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/IR_.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/Reg_16.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/test_memory.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/synchronizers.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/SLC3_2.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/Mem2IO.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/MUX_41.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/MUX_21.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/PCMUX_.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/BUS_.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/DRMUX_.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/ADDR_ADDER_.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/SR1MUX_.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/DECODER_.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/MUX_81.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/PC_.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/memory_contents.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/REGFILE_.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/datapath.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/slc3.sv}
vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/slc3_testtop.sv}

vlog -sv -work work +incdir+D:/UIUC/2022\ Spring/ECE\ 385/Labs/Lab\ 5/Workspace/files {D:/UIUC/2022 Spring/ECE 385/Labs/Lab 5/Workspace/files/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 1300 us
