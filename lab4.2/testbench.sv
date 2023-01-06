/*
TESTBENCH:
F3*3 = FFD9 => OK
*/

module testbench();
timeunit 10ns;
timeprecision 1ns;
assign Clk = 0;
logic  Reset, Execute, Xval;
logic [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
logic [7:0]  Din, Aval, Bval;
logic [8:0] S_out, A_out;
control CTRL(.*);	
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
Clk = 0;
end 


initial begin: TEST_VECTORS
#0 Reset = 0;
#1 Din = 8'hF3;	
#2 Reset = 1;
#2 Reset = 0;
#3 Din = 8'h03;	
#4 Execute = 1;	
#4 Execute = 0;
end
endmodule