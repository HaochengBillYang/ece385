module CLA4(
input [3:0] A, B,
input c_in,
output [3:0] S,
output G, P
);

logic p0,p1,p2,p3,g0,g1,g2,g3,c0,c1,c2,c3;

always_comb
begin
p0 = A[0] ^ B[0];
p1 = A[1] ^ B[1];
p2 = A[2] ^ B[2];
p3 = A[3] ^ B[3];
g0 = A[0] & B[0];
g1 = A[1] & B[1];
g2 = A[2] & B[2];
g3 = A[3] & B[3];
c0 = c_in;
c1 = (c_in & p0) | g0;
c2 = (c_in & p0 & p1) | (g0 & p1) | g1;
c3 = (c_in & p0 & p1 & p2) | (g0 & p1 & p2) | (g1 & p2) | g2;
S[0] = A[0] ^ B[0] ^ c0;
S[1] = A[1] ^ B[1] ^ c1;
S[2] = A[2] ^ B[2] ^ c2;
S[3] = A[3] ^ B[3] ^ c3;
G = g3 | (g2 & p3) | (g1 & p3 & p2) | (g0 & p3 & p2 & p1);
P = p0 & p1 & p2 & p3;
end
endmodule
