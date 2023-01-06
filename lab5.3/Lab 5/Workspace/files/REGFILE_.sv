module REGFILE_(
	input logic Clk, Reset,
	input logic [2:0] DRMUX_Out, SR1MUX_Out,
	input logic LD_REG,
	input logic [15:0] IR, BUS,
	output logic [15:0] ALU_A, SR2MUX_0
	//output logic [15:0] Rval[8] 
);



	logic [15:0] RVAL[8];
	logic singleLoad[8];
	
	
	
	DECODER_	decoder(.DECODER_In(DRMUX_Out), .LD_REG, .DECODER_Out('{singleLoad[0], singleLoad[1], singleLoad[2], singleLoad[3], singleLoad[4], singleLoad[5], singleLoad[6], singleLoad[7]}));
	
	
	
	reg_16 reg_0(.Clk, .Reset, .Load(singleLoad[0]), .Data_In(BUS), .Data_Out(RVAL[0][15:0]));
	reg_16 reg_1(.Clk, .Reset, .Load(singleLoad[1]), .Data_In(BUS), .Data_Out(RVAL[1][15:0]));
	reg_16 reg_2(.Clk, .Reset, .Load(singleLoad[2]), .Data_In(BUS), .Data_Out(RVAL[2][15:0]));
	reg_16 reg_3(.Clk, .Reset, .Load(singleLoad[3]), .Data_In(BUS), .Data_Out(RVAL[3][15:0]));
	reg_16 reg_4(.Clk, .Reset, .Load(singleLoad[4]), .Data_In(BUS), .Data_Out(RVAL[4][15:0]));
	reg_16 reg_5(.Clk, .Reset, .Load(singleLoad[5]), .Data_In(BUS), .Data_Out(RVAL[5][15:0]));
	reg_16 reg_6(.Clk, .Reset, .Load(singleLoad[6]), .Data_In(BUS), .Data_Out(RVAL[6][15:0]));
	reg_16 reg_7(.Clk, .Reset, .Load(singleLoad[7]), .Data_In(BUS), .Data_Out(RVAL[7][15:0]));
                                                                                  
	MUX_81 to_ALU_A(
						 .F_81(SR1MUX_Out), 
						 .A_In(RVAL[0][15:0]),
						 .B_In(RVAL[1][15:0]),
						 .C_In(RVAL[2][15:0]),
						 .D_In(RVAL[3][15:0]),
						 .E_In(RVAL[4][15:0]),
						 .F_In(RVAL[5][15:0]),
						 .G_In(RVAL[6][15:0]),
						 .H_In(RVAL[7][15:0]), 
						 .MUX_81_OUT(ALU_A));
	MUX_81 to_SR2MUX_0(
						 .F_81(IR[2:0]), 
						 .A_In(RVAL[0][15:0]),
						 .B_In(RVAL[1][15:0]),
						 .C_In(RVAL[2][15:0]),
						 .D_In(RVAL[3][15:0]),
						 .E_In(RVAL[4][15:0]),
						 .F_In(RVAL[5][15:0]),
						 .G_In(RVAL[6][15:0]),
						 .H_In(RVAL[7][15:0]), 
						 .MUX_81_OUT(SR2MUX_0));
	
	
	//assign Rval[8] = RVAL[8];


endmodule
