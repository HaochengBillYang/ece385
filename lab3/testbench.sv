module testbench();

timeunit 10ns;
timeprecision 1ns;

logic load;
logic Clk = 0;
logic[9:0] SW;
logic Run_Accumulate_in;
logic Run_Accumultae;
logic Reset_Clear_in;
logic Reset_Clear;
logic [9:0] LED;
logic [16:0] Out;
logic [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5;
logic [16:0] S;

assign Run_Accumulate = ~Run_Accumulate_in;
assign Reset_Clear = ~Reset_Clear_in;

adder2 adder2_test(.*);

always begin : CLOCK_GENERATION;
#1 Clk =~Clk;
end


initial begin: CLOCK_INITIALIZATION;
Clk=0;
end

initial begin: TEST_VECTORS;
Reset_Clear_in =0;
Run_Accumulate_in=0;
SW = 10'b1111111111;
#2 Reset_Clear_in = 1;
#2 Reset_Clear_in = 0;
#2 Run_Accumulate_in=1;
#4 Run_Accumulate_in=0;
#2 SW = 10'b1111111111;
#2 Run_Accumulate_in=1;
#4 Run_Accumulate_in=0;
#10 Reset_Clear_in=1;
end


endmodule
