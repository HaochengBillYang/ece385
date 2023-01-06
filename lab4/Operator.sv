module Operator
(
input [7:0] S,A,
input logic fn, B0,
output [8:0] S_out, A_out
);
logic [7:0] B_0, Inv;
assign B_0[0]=B0; 
assign B_0[1]=B0;  
assign B_0[2]=B0;
assign B_0[3]=B0; 
assign B_0[4]=B0;  
assign B_0[5]=B0;
assign B_0[6]=B0; 
assign B_0[7]=B0;
assign Inv[0]=fn; 
assign Inv[1]=fn;  
assign Inv[2]=fn;  
assign Inv[3]=fn;  
assign Inv[4]=fn;  
assign Inv[5]=fn;  
assign Inv[6]=fn;  
assign Inv[7]=fn;

logic [8:0] XS, XSc, XA;

assign XSc[7:0] = S[7:0] & B_0;
assign XS[7:0] = (XSc ^ Inv);
assign XA[7:0] = A[7:0];
assign XS[8] = XS[7];
assign XA[8] = A[7];


ADDER9 FA9(.S9(XS[8:0]), .A9(XA[8:0]), .fn, .S_out(S_out[8:0]));
assign A_out[8:0] = XA[8:0];
endmodule

 