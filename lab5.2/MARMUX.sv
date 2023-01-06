module MARMUX(	input logic ADDR1MUX,
					input logic [1:0] ADDR2MUX,
					input logic [15:0] PC, IR, ALU_A,
					output logic [15:0] MARMUX);

logic [15:0] ADDR1MUX_out, ADDR2MUX_out;
always_comb
begin
unique case(ADDR1MUX)
1'b0: ADDR1MUX_out = PC;
1'b1: ADDR1MUX_out = ALU_A;
endcase
unique case(ADDR2MUX)
2'b00: ADDR2MUX_out = 16'b0;
2'b01: ADDR2MUX_out = {{10{IR[5]}},IR[5:0]};
2'b10: ADDR2MUX_out = {{7{IR[8]}},IR[8:0]};
2'b11: ADDR2MUX_out = {{5{IR[10]}},IR[10:0]};
endcase

MARMUX = ADDR1MUX_out + ADDR2MUX_out;
end					
endmodule
