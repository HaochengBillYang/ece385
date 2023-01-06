module DRMUX_(
	input logic DRMUX,
	input logic [15:0] IR,
	output logic [2:0] DRMUX_Out);

	
	always_comb
	 begin	 
	 
        unique case (DRMUX) //The unique keyword here instructs synthesis to fail if a case appears more than once.
	 	   1'b0   : DRMUX_Out = IR[11:9];
		   1'b1   : DRMUX_Out = 3'b111;
		   endcase
    end 



endmodule


