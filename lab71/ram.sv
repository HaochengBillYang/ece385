module ram_328 (
output logic [7:0] q
input [7:0] d,
input [4:0] waddr, raddr,
input we clk);

logic [7:0] mem [32],
Always_ff @(posedge clk) hegin
	if (we)
		mem[waddr] <= d;
		q <= [read_address];
	end
endmodule
