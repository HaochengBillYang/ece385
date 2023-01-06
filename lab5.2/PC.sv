module PC(	input logic Clk, Reset, LD_PC,
				input logic [15:0] PC_in,
				output logic [15:0] PC, PC_PP			
); 

reg_16 pc0(.Clk, .Reset, .Load(LD_PC), .D_in(PC_in), .D_out(PC));
always_comb
begin
PC_PP = PC + 16'b0000000000000001;
end
endmodule
