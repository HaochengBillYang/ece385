module ALU_ ( input logic [1:0] ALUK,
              input  logic [15:0]  ALU_A, ALU_B,
              output logic [15:0]  ALU);


always_comb
begin


unique case (ALUK)

	 	2'b00   : ALU = ALU_B + ALU_A;
		2'b01   : ALU = ALU_B & ALU_A;
		2'b10   : ALU = ~ALU_A;
		2'b11   : ALU = ALU_A;

endcase

end

endmodule