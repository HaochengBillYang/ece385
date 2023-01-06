module PC0(input logic Clk, LD_PC, Reset,
					input logic [15:0] pc_in,
					output logic [15:0] pc_out, pc_next
);

reg_16 reg_pc(.Clk, .Reset, .Load(LD_PC), .D_in(pc_in), .D_out(pc_out));

assign pc_next = pc_out + 16'b0000000000000001;

endmodule
