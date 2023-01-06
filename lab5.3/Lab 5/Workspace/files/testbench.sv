module testbench();

timeunit 10ns;

timeprecision 1ns;

logic [9:0] LED;
logic Clk = 0;
logic [9:0] SW;
logic Run;
logic Continue;
logic [6:0] HEX0, HEX1, HEX2, HEX3;
logic [15:0] PC,MAR, MDR, IR;
logic Reset_Val;
logic Run_ctrl, Continue_ctrl;
assign Run = ~Run_ctrl;
assign Continue = ~Continue_ctrl;
//logic [15:0]Rval[8];

//BELOW ARE DEBUGGING VARIABLES
logic [15:0] MARMUXval, SR1MUX_Outval;



//test start x0003
//assign SW = 10b'0000000011;


slc3_testtop testtop(.*);

always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 

initial begin: TEST_VECTORS
//clear / initialize
#0
Run_ctrl = 1'b1;
Continue_ctrl = 1'b1;
#3
Run_ctrl = 1'b0;
Continue_ctrl = 1'b0;


//select test function

#3
SW[9:0]= 10'b0000000000;


#3
SW[9:0]= 10'b0001011010;


//run function

#50
Run_ctrl = 1'b1;
#3
Run_ctrl = 1'b0;

////-------------TEST I/O 1-------------
//
//#150
//SW[9:0]= 10'b0000000001; //1
//
//#150
//SW[9:0]= 10'b0000000010; //2



////-------------TEST I/O 2-------------
//
//#150
//SW[9:0]= 10'b0000000001; //1
//
//#20
//Continue_ctrl = 1'b1;
//#3
//Continue_ctrl = 1'b0;
//
//#150
//SW[9:0]= 10'b0000000010; //2
//
//#20
//Continue_ctrl = 1'b1;
//#3
//Continue_ctrl = 1'b0;


////-------------S.M.C.T.-------------
//
//
//#300
//Continue_ctrl = 1'b1;
//#3
//Continue_ctrl = 1'b0;
//
//#300
//Continue_ctrl = 1'b1;
//#3
//Continue_ctrl = 1'b0;
//
//#300
//Continue_ctrl = 1'b1;
//#3
//Continue_ctrl = 1'b0;
//
//#300
//Continue_ctrl = 1'b1;
//#3
//Continue_ctrl = 1'b0;


//
////-------------XOR-------------
//
//#150
//SW[9:0]= 10'b0000001111; //15
//
//#20
//Continue_ctrl = 1'b1;
//#3
//Continue_ctrl = 1'b0;
//
//#150
//SW[9:0]= 10'b0000001010; //10
//
//#20
//Continue_ctrl = 1'b1;
//#3
//Continue_ctrl = 1'b0;



////-------------MUL-------------
//
//#200
//SW[9:0]= 10'b0000000011; //3
//
//#20
//Continue_ctrl = 1'b1;
//#3
//Continue_ctrl = 1'b0;
//
//#200
//SW[9:0]= 10'b0000000010; //2
//
//#20
//Continue_ctrl = 1'b1;
//#3
//Continue_ctrl = 1'b0;


//-------------SORT-------------

#600
SW[9:0]= 10'b0000000010; //3

#50
Continue_ctrl = 1'b1;
#3
Continue_ctrl = 1'b0;

#35000
SW[9:0]= 10'b0000000011; //2

#50
Continue_ctrl = 1'b1;
#3
Continue_ctrl = 1'b0;

#7000
Continue_ctrl = 1'b1;
#3
Continue_ctrl = 1'b0;


#7000
Continue_ctrl = 1'b1;
#3
Continue_ctrl = 1'b0;


#7000
Continue_ctrl = 1'b1;
#3
Continue_ctrl = 1'b0;


#7000
Continue_ctrl = 1'b1;
#3
Continue_ctrl = 1'b0;

#7000
Continue_ctrl = 1'b1;
#3
Continue_ctrl = 1'b0;

#7000
Continue_ctrl = 1'b1;
#3
Continue_ctrl = 1'b0;

#7000
Continue_ctrl = 1'b1;
#3
Continue_ctrl = 1'b0;

#7000
Continue_ctrl = 1'b1;
#3
Continue_ctrl = 1'b0;

#7000
Continue_ctrl = 1'b1;
#3
Continue_ctrl = 1'b0;

#7000
Continue_ctrl = 1'b1;
#3
Continue_ctrl = 1'b0;

#7000
Continue_ctrl = 1'b1;
#3
Continue_ctrl = 1'b0;

#7000
Continue_ctrl = 1'b1;
#3
Continue_ctrl = 1'b0;

#5000
Continue_ctrl = 1'b1;
#3
Continue_ctrl = 1'b0;

#7000
Continue_ctrl = 1'b1;
#3
Continue_ctrl = 1'b0;

#5000
Continue_ctrl = 1'b1;
#3
Continue_ctrl = 1'b0;

#5000
Continue_ctrl = 1'b1;
#3
Continue_ctrl = 1'b0;









//
//
//#20
//Continue_ctrl = 1'b1;
//#3
//Continue_ctrl = 1'b0;
//
//#20
//Continue_ctrl = 1'b1;
//#3
//Continue_ctrl = 1'b0;


//#200
//SW[9:0]= 10'b0000000001;
//
//#20
//Continue_ctrl = 1'b1;
//#6
//Continue_ctrl = 1'b0;
//
//
//#200
//SW[9:0]= 10'b0000000010;
//
////#100
////SW[9:0]= 10'b0000001100;
//
//#20
//Continue_ctrl = 1'b1;
//#6
//Continue_ctrl = 1'b0;

//
//
//#80
//Run_ctrl = 1'b1;
//Continue_ctrl = 1'b1;
//
//#3
//Run_ctrl = 1'b0;
//Continue_ctrl = 1'b0;
//
//
//#20
//Run_ctrl = 1'b1;
//#3
//Run_ctrl = 1'b0;


end 

endmodule 