module ADDER9 (input logic [8:0] S, A,
input logic cin,
output logic [8:0] out, 
output logic X);

logic cout, cout2, useless;

Ripple ADDER0(.A(S[3:0]), .B(A[3:0]), .cin(cin), .S(out[3:0]), .cout(cout));
Ripple ADDER1(.A(S[7:4]), .B(A[7:4]), .cin(cout), .S(out[7:4]), .cout(cout2));
full_adder FA4 (.x(S[8]), .y(A[8]), .z(cout2), .s(out[8]), .c(useless));

assign X = useless;

endmodule

module full_adder (input logic x, y, z, 
output s, c);
assign s = x^y^z;
assign c = (x&y)|(y&z)|(x&z);

endmodule


module Ripple(input logic[3:0] A, B, 
input logic cin,
output logic [3:0] S,
output logic cout);

logic c1, c2, c3;

full_adder FA0(.x(A[0]), .y(B[0]), .z(cin), .s(S[0]), .c(c1));
full_adder FA1(.x(A[1]), .y(B[1]), .z(c1), .s(S[1]), .c(c2));
full_adder FA2(.x(A[2]), .y(B[2]), .z(c2), .s(S[2]), .c(c3));
full_adder FA3(.x(A[3]), .y(B[3]), .z(c3), .s(S[3]), .c(cout));

endmodule




