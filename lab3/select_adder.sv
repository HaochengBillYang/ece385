module select_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);

    /* TODO
     *
     * Insert code here to implement a CSA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
		logic c4, c8, c12;
		logic [3:0] s00, s01, s10, s11, s20, s21;
		logic c00, c01, c10, c11, c20, c21;
		ADDER4 FA0(.A(A[3:0]), .B(B[3:0]), .c_in(cin), .S(S[3:0]), .c_out(c4));
		ADDER4 FA1(.A(A[7:4]), .B(B[7:4]), .c_in(0), .S(s00[3:0]), .c_out(c00));
		ADDER4 FA2(.A(A[7:4]), .B(B[7:4]), .c_in(1), .S(s01[3:0]), .c_out(c01));
		ADDER4 FA3(.A(A[11:8]), .B(B[11:8]), .c_in(0), .S(s10[3:0]), .c_out(c10));
		ADDER4 FA4(.A(A[11:8]), .B(B[11:8]), .c_in(1), .S(s11[3:0]), .c_out(c11));
		ADDER4 FA5(.A(A[15:12]), .B(B[15:12]), .c_in(0), .S(s20[3:0]), .c_out(c20));
		ADDER4 FA6(.A(A[15:12]), .B(B[15:12]), .c_in(1), .S(s21[3:0]), .c_out(c21));
		assign c8 = (c4 & c01) | c00;
		assign c12 = (c8 & c11) | c10;
		MUX2   M4(.A(s00), .B(s01), .S(c4), .Y(S[7:4]));
		MUX2   M8(.A(s10), .B(s11), .S(c8), .Y(S[11:8]));
		MUX2   M12(.A(s20), .B(s21), .S(c12), .Y(S[15:12]));
		assign cout = (c12 & c21) | c20;
		
endmodule
