module SR1MUX(
input logic SR1MUX,
input logic [15:0] IR,
output logic [2:0] SR1MUX_out);
	always_comb
	begin
   unique case (SR1MUX)
	 	   1'b0   : SR1MUX_out = IR[11:9];
		   1'b1   : SR1MUX_out = IR[8:6];
   endcase
   end
endmodule
