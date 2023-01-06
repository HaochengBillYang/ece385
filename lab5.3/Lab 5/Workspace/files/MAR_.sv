module MAR_ (input logic  Clk, LD_MAR,
              input  logic [15:0]  BUS,
              output logic [15:0]  MAR);


reg_16 mar_reg (.Clk(Clk), .Reset(1'b0), .Load(LD_MAR), .Data_In(BUS), .Data_Out(MAR));


endmodule