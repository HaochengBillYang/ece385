module lookahead_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);
    /* TODO
     *
     * Insert code here to implement a CLA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	 /*
		c0 = c_in;
		c1 = c_in & p0 | g0;
		c2 = c_in & p0 & p1 | g0 & p1 | g1;
		c3 = c_in & p0 & p1 & p2 | g0 & p1 & p2 | g1 & p2 | g2;
	 */

		logic c0, c1, c2, c3, p0, p1, p2, p3, g0, g1, g2, g3;

		assign c0 = cin;		
		CLA4 cla0(.A(A[3:0]), .B(B[3:0]), .c_in(c0), .S(S[3:0]), .G(g0), .P(p0));
		assign c1 = (c0 & p0) | g0;
		CLA4 cla1(.A(A[7:4]), .B(B[7:4]), .c_in(c1), .S(S[7:4]), .G(g1), .P(p1));
		assign c2 = (c0 & p0 & p1) | (g0 & p1) | g1;
		CLA4 cla2(.A(A[11:8]), .B(B[11:8]), .c_in(c2), .S(S[11:8]), .G(g2), .P(p2));
		assign c3 = (c0 & p0 & p1 & p2) | (g0 & p1 & p2) | (g1 & p2) | g2;
		CLA4 cla3(.A(A[15:12]), .B(B[15:12]), .c_in(c3), .S(S[15:12]), .G(g3), .P(p3));
		assign cout = (c0 & p0 & p1 & p2 & p3) | (g0&p1&p2&p3) | (g1&p2&p3) | (g2&p3) | g3;
endmodule
