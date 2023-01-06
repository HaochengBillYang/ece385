module Reg_system ( input logic [1:0] ADDER2MUX,
		input logic ADDER1MUX, SR2MUX, MARMUX
              input  logic [15:0]  PC, IR, SR2MUX_0, ALU_A,
              output logic [15:0]  ALU_B, MARMUX_OUT, PCMUX_2);

logic [15:0] ADDR2MUX_OUT, ADDR1MUX_OUT;

always comb
begin


unique case (SR2MUX)

	 	1'b0   : ALU_B = SR2MUX_0;
		1'b1   : ALU_B = {{11 IR [4]} , IR [4:0]};

endcase

unique case (ADDER1MUX)

	 	1'b0   : ADDR1MUX_OUT = PC;
		1'b1   : ADDR1MUX_OUT = ALU_A;

endcase

unique case (ADDER2MUX)

	 	2'b00   : ADDR2MUX_OUT = 16'b0000;
		2'b01   : ADDR2MUX_OUT = {{10 IR [4]} , IR [5:0]};
		2'b10   : ADDR2MUX_OUT = {{7 IR [4]} , IR [8:0]};
		2'b11   : ADDR2MUX_OUT = {{5 IR [4]} , IR [10:0]};

endcase


PCMUX_2 = ADDR1MUX_OUT + ADDR2MUX_OUT;

unique case (MARMUX)

	 	1'b0   : MARMUX_OUT = {{8 IR [4]} , IR [7:0]};
		1'b1   : MARMUX_OUT = PCMUX_2;

endcase

end

endmodule