module Processor (input logic   Clk,     // Internal
                                Reset,   // Push button 0
                                Execute, // Push button 3
                  input  logic [7:0]  Din,     // input data
                  output logic [3:0]  LED,     // DEBUG
                  output logic [7:0]  
										  Aval,    // DEBUG
                                Bval,    // DEBUG
										
                  output logic [6:0]  
										  AhexL,
                                AhexU,
                                BhexL,
                                BhexU,
						output logic [8:0] A_out, S_out_0
						);

	 //local logic variables go here
	 logic Reset_SH, Execute_SH, Shift_En, LD, LD_B, SUB, RESB, B0;
	 assign RESB = 1'b0;
	 logic [7:0] A, B, Din_S;
	 logic [8:0] S_out;
	 logic A_Shift_Out;
	 logic CLRA;
	 logic RESA;
	 assign RESA = Reset_SH | CLRA;
	 assign LD_B = Reset_SH;
	 
	 assign Aval = A;
	 assign Bval = B;
	 
	 assign LED[0] = LD;
	 assign LED[1] = Reset_SH;
	 assign LED[2] = Execute_SH;
	 assign LED[3] = LD_B;
	 assign S_out_0 = S_out;
	 
	 sync button_sync[1:0] (Clk, {~Reset, ~Execute}, {Reset_SH, Execute_SH});
	 sync Din_sync[7:0] (Clk, Din, Din_S);
	  
	 //Instantiation of modules here
	 control				CTRL(
								.Clk(Clk),
								.Execute(Execute_SH),
								.Reset(Reset_SH),
								.CLRA,
								.Shift_En,
								.LD,
								.SUB
								);
	 Operator			ALU(
								.S(Din_S),
								.A,
								.fn(SUB),
								.B0,
								.S_out,
								.A_out
								);
	 reg_8    			Reg_A (
                        .Clk(Clk),
								.D(S_out[8:1]),
                        .Reset(RESA),
								.Shift_In(1'b0),
                        .Shift_En(1'b0),
								.Load(LD),
								.Shift_Out(A_Shift_Out),
								.Data_Out(A)
                        );
	 reg_8    			Reg_B (
                        .Clk(Clk),
								.D(Din_S),
                        .Reset(RESB),
								.Shift_In(S_out[0]),
                        .Shift_En,
								.Load(LD_B),
								.Shift_Out(B0),
								.Data_Out(B)
								);							
								
	 HexDriver        Hex0 (
                        .In0(A[3:0]),
                        .Out0(AhexL) );
								
	 HexDriver        Hex1 (
                        .In0(A[7:4]),
                        .Out0(AhexU) );
	 HexDriver        Hex2 (
                        .In0(B[3:0]),
                        .Out0(BhexL) );
								
	 HexDriver        Hex3 (
                       .In0(B[7:4]),
                        .Out0(BhexU) );

								
								
	  
	  
endmodule
