module PC_ (input logic Clk, LD_PC, Reset,
              input  logic [15:0]  PC_In,
              output logic [15:0]  PC, PC_1);


reg_16 pc_reg(.Clk(Clk), .Reset, .Load(LD_PC), .Data_In(PC_In), .Data_Out(PC));

always_comb
begin
	PC_1 = PC + 16'b0000000000000001;

end

endmodule