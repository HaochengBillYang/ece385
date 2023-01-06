module SR1MUX_(
	input logic SR1,
	input logic [15:0] IR,
	output logic [0:2] SR1MUX_Out);

	
	always_comb
	 begin
        unique case (F_21) //The unique keyword here instructs synthesis to fail if a case appears more than once.
	 	   1'b0   : MUX_21_OUT = A_In;
		   1'b1   : MUX_21_OUT = B_In;
		   
		   
        endcase
    end 



endmodule


