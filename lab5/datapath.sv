module datapath(input logic Clk, Reset, 
					 input logic LD_REG, LD_PC, LD_MDR, LD_MAR, LD_IR,LD_LED,
					 input logic GatePC, GateMDR, GateALU, GateMARMUX,
					 input logic [1:0] PCMUX,
					 input logic MIO_EN,
					 input logic [15:0] MDR_In,
					 output logic [15:0] IR, PC, MAR, MDR,
					 output logic [9:0] LED);
					 logic [15:0] MARMUX;
					 
					 logic [15:0] pc_next, pc_in, BUS_out, ALU, MIO_mid;
					 
					 assign ALU = 16'b000000000000000;
					 
					 PCMUX pcmux(.PCMUX, .pc_next, .BUS_out, .MARMUX(16'b000000000000000), .pc_in);
					 
					 PC pc(.Clk, .Reset, .LD_PC, .pc_in, .pc_out(PC), .pc_next);
					 
					 BUS bus(.PC, .MDR, .ALU, .MARMUX, .GatePC, .GateALU, .GateMDR, .GateMARMUX, .BUS_out);
					 
					 MDR mdr(.Clk, .LD_MDR, .MDR_in(MIO_mid), .MDR_out(MDR), .Reset);
					 
					 MAR mar(.Clk, .LD_MAR, .MAR_in(BUS_out), .MAR_out(MAR), .Reset);
					 
					 IR ir(.Clk, .LD_IR, .IR_in(BUS_out), .IR_out(IR), .Reset);
					 
					 MIOMUX miomux(.MIO_EN, .BUS(BUS_out), .MEM2(MDR_In), .MDR_in(MIO_mid));
					
					 always_ff @(posedge Clk) begin
						 
						 if(LD_LED)
								LED <= IR[9:0];
						 else
								LED <= 10'b0;
						end
					 endmodule
