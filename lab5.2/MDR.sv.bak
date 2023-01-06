module MDR0(input logic Clk, LD_MDR, 
					input logic [15:0] MDR_in,
					output logic [15:0] MDR_out
);

reg_16 reg_mdr(.Clk, .Reset(1'b0), .Load(LD_MDR), .D_in(MDR_in), .D_out(MDR_out));


endmodule
