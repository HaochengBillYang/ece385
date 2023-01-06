module BEN_ ( input logic Clk, LD_BEN, LD_CC, Reset,
              input  logic [15:0]  IR, BUS,
              output logic BEN);

logic N, Z, P, n_, z_, p_;







always_ff @ (posedge Clk) begin
	if(Reset)
		BEN <= 1'b0;
	else if(LD_BEN)
		BEN <= ((IR[11:9] & {n_, z_, p_}) != 3'b000);
		if(LD_CC) begin
			n_ <= N;
			z_ <= Z;
			p_ <= P;
		end 
end 
		





always_comb
begin


if ((BUS==16'b0000))
begin
	Z = 1'b1;
	N = 1'b0;
	P = 1'b0;
end
else if ((BUS[15] == 1'b1))
begin
	Z = 1'b0;
	N = 1'b1;
	P = 1'b0;
end
else if ((BUS[15] == 1'b0)&&(BUS!=16'b0000))
begin
	Z = 1'b0;
	N = 1'b0;
	P = 1'b1;
end
else begin
	N = 1'bz;
	Z = 1'bz;
	P = 1'bz;

end

end

endmodule