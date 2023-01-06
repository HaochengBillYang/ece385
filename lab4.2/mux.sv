module NEG(input logic [7:0] A,
					output logic [7:0] A_);
					
logic [7:0] J, I;
logic J1, cout;
full_adder FA0 (.x(A[0]), .y(1'b1), .z(1'b0), .s(I[0]), .c(J[0]));
full_adder FA1 (.x(A[1]), .y(1'b1), .z(1'b0), .s(I[1]), .c(J[1]));
full_adder FA2 (.x(A[2]), .y(1'b1), .z(1'b0), .s(I[2]), .c(J[2]));
full_adder FA3 (.x(A[3]), .y(1'b1), .z(1'b0), .s(I[3]), .c(J[3]));
full_adder FA4 (.x(A[4]), .y(1'b1), .z(1'b0), .s(I[4]), .c(J[4]));
full_adder FA5 (.x(A[5]), .y(1'b1), .z(1'b0), .s(I[5]), .c(J[5]));
full_adder FA6 (.x(A[6]), .y(1'b1), .z(1'b0), .s(I[6]), .c(J[6]));
full_adder FA7 (.x(A[7]), .y(1'b1), .z(1'b0), .s(I[7]), .c(J[7]));
Ripple RA0(.A(I[3:0]), .B(4'b0001), .cin(1'b0), .S(A_[3:0]), .cout);
Ripple RA1(.A(I[7:4]), .B(4'b0000), .cin(cout), .S(A_[7:4]), .cout(J1));
endmodule

module multiplexer(input logic sub, 
input logic [7:0] S0, 
output logic [8:0] Sout);
logic [7:0] S_;
NEG N(.A(S0), .A_(S_));
always_comb
begin
if (sub)
begin
Sout = {~S0[7], ~S0};
end
else
begin
Sout = {S0[7], S0};
end	
end	

endmodule