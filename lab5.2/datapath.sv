module datapath(
					input logic Clk, Reset, 
					input logic LD_REG, LD_PC, LD_MDR, LD_MAR, LD_IR, LD_BEN, LD_CC, LD_LED,
					input logic GatePC, GateMDR, GateALU, GateMARMUX,
					input logic [1:0] ALUK, PCMUX, ADDR2MUX,
					input logic DRMUX, SR1MUX, SR2MUX, ADDR1MUX,
					input logic MIO_EN,
					input logic [15:0] MDR_In,
					output logic BEN,
					output logic [9:0] LED,
					output logic [15:0] IR, PC, MAR, MDR
					 );
					logic [2:0] DRMUX_out, SR1MUX_out;
					logic [15:0] ALU_A, ALU_B, ALU, PC_PP, PC_in, BUS, SR2_out, MARMUX, MIO_out;
					logic [15:0] PCcopy, IRcopy, MARcopy, MDRcopy;
					
					DRMUX drmux(.*);
					SR1MUX sr1mux(.*);
					SR2MUX sr2mux(.*);
					REGFILE regfile(.*);
					ALU alu(.*);
					PCMUX pcmux(.*);
					PC pc(.PC(PCcopy), .*);
					MIO mioen(.*);
					MDR mdr(.MDR(MDRcopy), .*);
					MAR mar(.MAR(MARcopy), .*);
					IR ir(.IR(IRcopy), .*);
					BUS_line bus(.PC(PCcopy), .MDR(MDRcopy), .*);
					MARMUX marmux(.PC(PCcopy), .IR(IRcopy), .*);
					BEN ben(.IR(IRcopy), .*);
					
					always_ff @(posedge Clk) begin 
					if(LD_LED)
					LED <= IR[9:0];
					else
					LED <= 10'b0;
					end
					
					always_comb 
					begin
					IR  = IRcopy;
					PC  = PCcopy;
					MAR = MARcopy;
					MDR = MDRcopy;
					end
					
					endmodule
