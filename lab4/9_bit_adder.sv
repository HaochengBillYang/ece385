module 9_bit_adder
(
input [8:0] A,B,
input logic c_in,
output [8:0] S_out,
output logic X
);

ADDER9 FA9(.A(A[8:0]), .B(B[8:0]), .c_in, .S(S_out[8:0]), .c_out(X));
endmodule

