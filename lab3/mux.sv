module MUX2(input [3:0] A, B,
			input S,
			output [3:0] Y);
			always_comb
			begin
			Y[0] = (A[0]&(~S))|(B[0]&S);
			Y[1] = (A[1]&(~S))|(B[1]&S);
			Y[2] = (A[2]&(~S))|(B[2]&S);
			Y[3] = (A[3]&(~S))|(B[3]&S);
			end
			endmodule
			