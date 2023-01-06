module MAR(input logic Clk, LD_MAR, 
					input logic [15:0] BUS,
					output logic [15:0] MAR
);

reg_16 mar0(.Clk, .Reset(1'b0), .Load(LD_MAR), .D_in(BUS), .D_out(MAR));


endmodule
