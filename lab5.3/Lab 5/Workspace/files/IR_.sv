module IR_ (input logic Clk, LD_IR,
              input  logic [15:0]  BUS,
              output logic [15:0]  IR);


reg_16 ir_reg (.Clk(Clk), .Reset(1'b0), .Load(LD_IR), .Data_In(BUS), .Data_Out(IR));


endmodule
