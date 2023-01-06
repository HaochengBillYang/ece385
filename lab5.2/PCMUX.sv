module PCMUX(	input logic [15:0] PC_PP, BUS, MARMUX,
					input logic [1:0] PCMUX,
					output logic [15:0] PC_in);

MUX4 pcmux0(.Select(PCMUX), .In_00(PC_PP), 
.In_01(BUS), .In_10(MARMUX), .In_11(16'b0000000000000000), .MUX4_out(PC_in));

endmodule
