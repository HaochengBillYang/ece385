module testbench();

timeunit 10ns;
timeprecision 1ns;
logic [9:0] LED;
logic [9:0] SW;
logic Clk = 0;
logic Run, Continue;
logic [6:0] HEX0, HEX1, HEX2, HEX3;
logic [15:0] PC, MAR, MDR, IR;
logic Run_ctrl, Continue_ctrl;
logic OE, WE;
assign Run= ~Run_ctrl;
assign Continue= ~Continue_ctrl;

slc3_testtop testtop(.*);

always begin: CLOCK_GENERATION
#1
Clk =~Clk;
end

initial begin: CLOCK_INITIALIZATION
Clk=0;
end
initial begin: TEST_VECTORS
#0 
Run_ctrl= 1'b1;
Continue_ctrl = 1'b1;

#10
Run_ctrl =1'b0;
Continue_ctrl=1'b0;

//#50
//SW [9:0]= 10'b0000000000;

#10
SW [9:0]= 10'b0000000011;
//SW[9:0] = 10'b0000000110;
//SW[9:0] = 10'b0000001011;
//SW[9:0] = 10'b0000010100;
//SW[9:0] = 10'b0000110001;
//SW[9:0] = 10'b0001011010;
//function select ^

#50
Run_ctrl= 1'b1;


#10
Run_ctrl =1'b0;



//Basic I/O Test 1 
#300
SW[9:0] = 10'b0000000001;
#300
SW[9:0] = 10'b0000000010;




//Basic I/O Test 2 
/*
#50
SW[9:0]=10'b0000000010;

#15
Continue_ctrl = 1'b1;
#5
Continue_ctrl = 1'b0;

#50
SW[9:0]=10'b0000000011;
#15
Continue_ctrl =1'b1;
#5
Continue_ctrl =1'b0;

*/


//Self-Modifying Code Test 
/*
#200
Continue_ctrl = 1'b1;
#5
Continue_ctrl = 1'b0;

#200
Continue_ctrl = 1'b1;
#5
Continue_ctrl = 1'b0;

#200
Continue_ctrl = 1'b1;
#5
Continue_ctrl = 1'b0;

#200
Continue_ctrl = 1'b1;
#5
Continue_ctrl = 1'b0;
*/



//XOR Test
/*
#200
SW[9:0] = 10'b0000001111;

#15
Continue_ctrl = 1'b1;
#5
Continue_ctrl = 1'b0;

#200
SW[9:0] = 10'B0000001010;

#15
Continue_ctrl = 1'b1;
#5
Continue_ctrl = 1'b0;
*/



//Multiplication Test
/*
#200
SW[9:0] = 10'b0000000011;
#15
Continue_ctrl = 1'b1;
#5
Continue_ctrl = 1'b0;

#200
SW[9:0] = 10'b0000000010;
#15
Continue_ctrl = 1'b1;
#5
Continue_ctrl = 1'b0;
*/


//Sort TesT
/*
#200
SW[9:0] = 10'b0000000010;
#15
Continue_ctrl = 1'b1;
#5
Continue_ctrl = 1'b0;

#30000
SW[9:0] = 10'b0000000011;

#15
Continue_ctrl = 1'b1;
#5
Continue_ctrl = 1'b0;

#5000
Continue_ctrl = 1'b1;
#5
Continue_ctrl = 1'b0;

#5000
Continue_ctrl = 1'b1;
#5
Continue_ctrl = 1'b0;

#5000
Continue_ctrl = 1'b1;
#5
Continue_ctrl = 1'b0;

#5000
Continue_ctrl = 1'b1;
#5
Continue_ctrl = 1'b0;

#5000
Continue_ctrl = 1'b1;
#5
Continue_ctrl = 1'b0;

#5000
Continue_ctrl = 1'b1;
#5
Continue_ctrl = 1'b0;

#5000
Continue_ctrl = 1'b1;
#5
Continue_ctrl = 1'b0;
#5000
Continue_ctrl = 1'b1;
#5
Continue_ctrl = 1'b0;
#5000
Continue_ctrl = 1'b1;
#5
Continue_ctrl = 1'b0;
*/
end
endmodule
