module SR1MUX_(
	input logic SR1MUX,
	input logic [15:0] IR,
	output logic [2:0] SR1MUX_Out);

	
	always_comb
	 begin
        unique case (SR1MUX) //The unique keyword here instructs synthesis to fail if a case appears more than once.
	 	   1'b0   : SR1MUX_Out = IR[11:9];
		   1'b1   : SR1MUX_Out = IR[8:6];
		   
		   
        endcase
    end 



endmodule


