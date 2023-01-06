module PCMUX(input logic [1:0] PCMUX,
				 input logic [15:0] pc_next, BUS_out, MARMUX,
				 output logic [15:0] pc_in	
);
MUX4 pcmux(.Select(PCMUX), .In_00(pc_next), .In_01(BUS_out), .In_10(MARMUX), .In_11(16'b0000000000000000), .MUX4_out(pc_in));

endmodule

module MIOMUX(input logic MIO_EN,
				input logic [15:0] BUS, MEM2,
				output logic [15:0] MDR_in	
);
MUX2 miomux(.Select(MIO_EN), .In_0(BUS), .In_1(MEM2), .MUX2_out(MDR_in));

endmodule
