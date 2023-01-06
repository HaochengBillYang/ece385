module MUX_21 (input  logic  F_21, 
                input  logic [15:0] A_In, B_In,
                output logic [15:0] MUX_21_OUT);

	 //This is the 1-bit ALU
    always_comb
	 begin
        unique case (F_21) //The unique keyword here instructs synthesis to fail if a case appears more than once.
	 	   1'b0   : MUX_21_OUT = A_In;
		   1'b1   : MUX_21_OUT = B_In;
		   
		   
        endcase
    end 
	 
endmodule
