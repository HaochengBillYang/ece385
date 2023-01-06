module BUS(input logic[15:0] PC, ALU, MDR,
				input logic GateMARMUX, GatePC, GateALU, GateMDR, MARMUX, 
				output logic [15:0] BUS_out
				);

			always_comb
			begin
			if(GatePC== 1'b1)
				BUS_out = PC;
			else if(GateALU == 1'b1)
				BUS_out = ALU;
			else if(GateMDR == 1'b1)
				BUS_out = MDR;
			else if(GateMARMUX == 1'b1)
				BUS_out = MARMUX;
			else
				BUS_out = 16'bxxxxxxxxxxxxxxxx;
			end
			
endmodule
