module MUX_41 (input  logic [1:0]  F_41, 
                input  logic [15:0] A_In, B_In, C_In, D_In,
                output logic [15:0] MUX_41_OUT);

	 //This is the 1-bit ALU
    always_comb
	 begin
        unique case (F_41) //The unique keyword here instructs synthesis to fail if a case appears more than once.
	 	   2'b00   : MUX_41_OUT = A_In;
		   2'b01   : MUX_41_OUT = B_In;
		   2'b10   : MUX_41_OUT = C_In;
			2'b11   : MUX_41_OUT = D_In;
		   
        endcase
    end 
	 
endmodule
