module testbench();

timeunit 10ns;
timeprecision 1ns;

logic [9:0] SW;
logic	Clk, Run, Continue;
logic [9:0] LED;
logic [6:0] HEX0, HEX1, HEX2, HEX3;
logic [15:0] PC, MAR, MDR, IR;
logic Run_ctrl, Continue_ctrl;
assign Run = ~ Run_ctrl;
assign Continue = ~ Continue_ctrl;

slc3_testtop testslc3(.*);


   always begin : CLOCK_GENERATION 
		#1 Clk = ~Clk;
   end


	initial begin: CLOCK_INITIALIZATION 
		Clk = 0;
   end
	

	initial begin: TEST_VECTORS
	#0
Run_ctrl = 1'b1;
Continue_ctrl = 1'b1;
#3
Run_ctrl = 1'b0;
Continue_ctrl = 1'b0;

#20
Run_ctrl = 1'b1;
#3
Run_ctrl = 1'b0;


#20
Continue_ctrl = 1'b1;
#3
Continue_ctrl = 1'b0;


#20
Continue_ctrl = 1'b1;
#3
Continue_ctrl = 1'b0;

#20
Continue_ctrl = 1'b1;
#3
Continue_ctrl = 1'b0;

#20
Run_ctrl = 1'b1;
Continue_ctrl = 1'b1;

#3
Run_ctrl = 1'b0;
Continue_ctrl = 1'b0;


#20
Run_ctrl = 1'b1;
#3
Run_ctrl = 1'b0;
	end
	 
endmodule


