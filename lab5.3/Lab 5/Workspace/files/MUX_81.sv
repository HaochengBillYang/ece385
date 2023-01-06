module MUX_81 (input  logic [2:0]  F_81, 
                input  logic [15:0] A_In, B_In, C_In, D_In, E_In, F_In, G_In, H_In,
                output logic [15:0] MUX_81_OUT);

	 //This is the 1-bit ALU
    always_comb
	 begin
        unique case (F_81) //The unique keyword here instructs synthesis to fail if a case appears more than once.
	 	   3'b000   : MUX_81_OUT = A_In;
		   3'b001   : MUX_81_OUT = B_In;
		   3'b010   : MUX_81_OUT = C_In;
			3'b011   : MUX_81_OUT = D_In;
		   3'b100   : MUX_81_OUT = E_In;
		   3'b101   : MUX_81_OUT = F_In;
		   3'b110   : MUX_81_OUT = G_In;
			3'b111   : MUX_81_OUT = H_In;
        endcase
    end 
	 
endmodule
