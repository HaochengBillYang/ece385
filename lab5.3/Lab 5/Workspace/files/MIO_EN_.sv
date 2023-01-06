module MIO_EN_(input logic[15:0] EN_MEM, DIS_MEM,
				  input logic[1:0] MIO_EN,
				  output logic [15:0] MDR_In);
				  
	
	MUX_21 mio_en(.F_21(MIO_EN), .A_In(DIS_MEM), .B_In(EN_MEM), .MUX_21_OUT(MDR_In));		

	 
endmodule
