module MAR0(input logic Clk, LD_MAR, 
					input logic [15:0] MAR_in,
					output logic [15:0] MAR_out
);

reg_16 reg_mar(.Clk, .Reset(1'b0), .Load(LD_MAR), .D_in(MAR_in), .D_out(MAR_out));


endmodule
