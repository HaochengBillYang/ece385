module SR2MUX_(
	input logic DR,
	input logic [15:0] IR,
	output logic [0:2] SR2MUX_Out);

	
	always_comb
	 begin	 
	 
        unique case (DR) //The unique keyword here instructs synthesis to fail if a case appears more than once.
	 	   1'b0   : SR2MUX_Out = IR[11:9];
		   1'b1   : SR2MUX_Out = 3'b111;
		   endcase
    end 



endmodule


