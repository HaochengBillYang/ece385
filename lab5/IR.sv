module IR0(input logic Clk, LD_IR, 
					input logic [15:0] IR_in,
					output logic [15:0] IR_out
);

reg_16 reg_pc(.Clk, .Reset(1'b0), .Load(LD_IR), .D_in(IR_in), .D_out(IR_out));

endmodule
