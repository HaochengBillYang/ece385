module BEN( input logic Clk, Reset, LD_BEN, LD_CC,
				input logic [15:0] IR, BUS,
				output logic BEN);

logic [2:0] CurrentNZP, CC;

always_ff @ (posedge Clk) begin
	if(Reset)
		BEN <= 1'b0;
	else if(LD_BEN)
		BEN <= ((IR[11:9] & CC[2:0])!=3'b000);
		if(LD_CC) begin
			CC[2:0] <= CurrentNZP[2:0];
		end 
end 

always_comb
begin

if ((BUS==16'b0))
begin
	CurrentNZP[2:0] = 3'b010;
end
else if ((BUS[15]==1'b1))
begin
	CurrentNZP[2:0] = 3'b100;
end
else if ((BUS[15]==1'b0)&&(BUS!=16'b0000))
begin
	CurrentNZP[2:0] = 3'b001;
end
else begin
	CurrentNZP[2:0] = 3'b111;
end
end
endmodule
