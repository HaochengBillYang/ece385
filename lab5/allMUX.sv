module MUX2(input logic Select,
				input logic [15:0] In_0, In_1,
				output logic [15:0] MUX2_out); 
				always_comb
					begin
					unique case(Select)
						1'b0: MUX2_out = In_0;
						1'b1: MUX2_out = In_1;
					endcase
					end
				endmodule

module MUX4(input logic [1:0] Select,
				input logic [15:0] In_00, In_01, In_10, In_11,
				output logic [15:0] MUX4_out); 
				always_comb
					begin
					unique case(Select)
						2'b00: MUX4_out = In_00;
						2'b01: MUX4_out = In_01;
						2'b10: MUX4_out = In_10;
						2'b11: MUX4_out = In_11;
					endcase
					end
				endmodule
				
module MUX8(input logic [2:0] Select,
				input logic [15:0] In_000, In_001, In_010, In_011, In_100, In_101, In_110, In_111,
				output logic [15:0] MUX8_out); 
				always_comb
					begin
					unique case(Select)
						3'b000: MUX8_out = In_000;
						3'b001: MUX8_out = In_001;
						3'b010: MUX8_out = In_010;
						3'b011: MUX8_out = In_011;
						3'b100: MUX8_out = In_100;
						3'b101: MUX8_out = In_101;
						3'b110: MUX8_out = In_110;
						3'b111: MUX8_out = In_111;
					endcase
					end
				endmodule