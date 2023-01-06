module PCMUX_(input logic [15:0] PC_1, BUS, MARMUX,
				  input logic [1:0] PCMUX,
				  output logic [15:0] PC_In);
				  
	
	logic [15:0] empty_16;
	assign  empty_16 = 16'b0000000000000000;
	MUX_41 pcmux(.F_41(PCMUX), .A_In(PC_1), .B_In(BUS), .C_In(MARMUX), .D_In(empty_16), .MUX_41_OUT(PC_In));		
	//assign PC_In = PC_1;
	 
endmodule
