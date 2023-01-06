module MDR(input logic Clk, LD_MDR, 
					input logic [15:0] MIO_out,
					output logic [15:0] MDR
);

reg_16 mdr(.Clk, .Reset(1'b0), .Load(LD_MDR), .D_in(MIO_out), .D_out(MDR));


endmodule
