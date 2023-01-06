module BUS_line(input logic[15:0] PC, ALU, MDR, MARMUX,
				input logic GateMARMUX, GatePC, GateALU, GateMDR,
				output logic [15:0] BUS
				);

			always_comb
			begin
			if(GatePC== 1'b1)
				BUS = PC;
			else if(GateALU == 1'b1)
				BUS = ALU;
			else if(GateMDR == 1'b1)
				BUS = MDR;
			else if(GateMARMUX == 1'b1)
				BUS = MARMUX;
			else
				BUS = 16'bxxxxxxxxxxxxxxxx;
			end
			
endmodule
