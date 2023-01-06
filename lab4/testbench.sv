module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the processor will be 
// instantiated as a submodule in testbench.
logic Clk = 0;
logic   Reset, Execute;
logic   Reset_in, Execute_in;
logic [7:0]  Din;
logic [6:0]  AhexL,
				 AhexU,
				 BhexL,
				 BhexU;
logic [3:0]  LED;
logic [7:0] Aval,
				Bval;
logic B0val;
logic [8:0] S_out_0, A_out, S_exval;

assign Reset = ~ Reset_in;
assign Execute = ~Execute_in;
// To store expected results
//logic [7:0] ans_1a, ans_2b;
				
// A counter to count the instances where simulation results
// do no match with expected results
//integer ErrorCnt = 0;
		
// Instantiating the DUT
// Make sure the module and signal names match with those in your design
Processor multiplier0(.*);	

// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST_VECTORS
Reset_in = 0;		// Toggle Rest
Execute_in = 0;
Din = 8'h03;	// Specify Din, F, and R


#2 Reset_in = 1;
#2 Reset_in = 0;

#2 Din = 8'h03;	// Change Din
#2 Execute_in = 1;	// Toggle Execute
   

#2 Execute_in = 0;
 
end
endmodule