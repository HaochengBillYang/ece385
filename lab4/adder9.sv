module full_adder  (input logic  x, y, z,
output logic s, c     );
	assign s = x^y^z;
	assign c = (x&y)|(y&z)|(x&z);
endmodule

module ADDER9 (input logic   [8:0] S9, A9,
input logic         fn,
output logic  [8:0] S_out
);

logic       c0, c1, c2, c3, c4, c5, c6, c7, c8;
full_adder  FA0(.x(S9[0]), .y(A9[0]), .z(fn), .s(S_out[0]), .c(c0));
full_adder  FA1(.x(S9[1]), .y(A9[1]), .z(c0), .s(S_out[1]), .c(c1));
full_adder  FA2(.x(S9[2]), .y(A9[2]), .z(c1), .s(S_out[2]), .c(c2));
full_adder  FA3(.x(S9[3]), .y(A9[3]), .z(c2), .s(S_out[3]), .c(c3));
full_adder  FA4(.x(S9[4]), .y(A9[4]), .z(c3), .s(S_out[4]), .c(c4));
full_adder  FA5(.x(S9[5]), .y(A9[5]), .z(c4), .s(S_out[5]), .c(c5));
full_adder  FA6(.x(S9[6]), .y(A9[6]), .z(c5), .s(S_out[6]), .c(c6));
full_adder  FA7(.x(S9[7]), .y(A9[7]), .z(c6), .s(S_out[7]), .c(c7));
full_adder  FA8(.x(S9[8]), .y(A9[8]), .z(c7), .s(S_out[8]), .c(c8));

endmodule
