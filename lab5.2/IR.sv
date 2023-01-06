module IR(	input logic Clk, LD_IR,
				input logic [15:0] BUS,
				output logic [15:0] IR); 

reg_16 ir0(.Clk, .Reset(1'b0), .Load(LD_IR), .D_in(BUS), .D_out(IR));

endmodule
