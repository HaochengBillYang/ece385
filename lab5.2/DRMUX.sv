module DRMUX(
	input logic DRMUX,
	input logic [15:0] IR,
	output logic [2:0] DRMUX_out);
	always_comb
	begin	 
   unique case (DRMUX) 
	 	   1'b0   : DRMUX_out = IR[11:9];
		   1'b1   : DRMUX_out = 3'b111;
	endcase
	end 
endmodule
	