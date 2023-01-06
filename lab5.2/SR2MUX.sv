module SR2MUX(input logic  SR2MUX,
input logic [15:0] IR, SR2_out,
output logic [15:0] ALU_B);
					always_comb
					begin
					unique case(SR2MUX)
						1'b0:	ALU_B = SR2_out;
						1'b1: ALU_B = {{11{IR[4]}},IR[4:0]};
					endcase
					end
endmodule
