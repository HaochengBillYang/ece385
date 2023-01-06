//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf 03-01-2006                               --
//                              03-12-2007                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 298 Lab 7                                         --
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------


module  ghost3 ( input Reset, frame_clk,
					input [9:0] BallX, BallY, BallS,
					input [9:0] SpawnX, SpawnY,
					input Powerup,
               output [9:0]  GhostX, GhostY, GhostS,
					output Lost);
    
    logic [9:0] Ghost_X_Pos, Ghost_Y_Pos, Ghost_Size;
	 logic [2:0]stateX, stateY;
	 logic Captured;
	 

    parameter [9:0] Ghost_X_Min=160;       // Leftmost point on the X axis
    parameter [9:0] Ghost_X_Max=480;     // Rightmost point on the X axis
    parameter [9:0] Ghost_Y_Min=40;       // Topmost point on the Y axis
    parameter [9:0] Ghost_Y_Max=440;     // Bottommost point on the Y axis

    assign Ghost_Size = 6;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"

	 always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ghost
        if (Reset)  // Asynchronous Reset
        begin 
				Ghost_Y_Pos <= SpawnY;
				Ghost_X_Pos <= SpawnX;
				Lost <= 1'b0;
				stateX <= 2'b01;
				stateY <= 2'b00;
        end
			else 
			begin
				/*if(GhostX+GhostS+2'b10 == Ghost_X_Max)
				state <= 2'b01;
				else if(GhostX-GhostS-2'b10 == Ghost_X_Min)
				state <= 2'b10;
				else*/

				if(Ghost_X_Pos == 380-2 && Ghost_Y_Pos == 200)
				begin
					// TODO: first corner, turn down
					stateX <= 2'b00;
					stateY <= 2'b01;
				end
				else if(Ghost_X_Pos == 380 && Ghost_Y_Pos == 270-2)
				begin
					// TODO: second corner, turn left
					stateX <= 2'b10;
					stateY <= 2'b00;
				end

				else if(Ghost_X_Pos == 260+2 && Ghost_Y_Pos == 270)
				begin
					// TODO: third corner, turn up
					stateX <= 2'b00;
					stateY <= 2'b10;
				end
				
				else if(Ghost_X_Pos == 260 && Ghost_Y_Pos == 200+2)
				begin
					// TODO: forth corner (origin), turn right
					stateX <= 2'b01;
					stateY <= 2'b00;
				end
				
				/*
				if ((Ghost_X_Pos == 300 && Ghost_Y_Pos+GhostS == 120))
					begin stateX <= 2'b10; // 10 is for x left
							stateY <= 2'b00;
							end
				else if ((Ghost_X_Pos+GhostS==310 && Ghost_Y_Pos == 50))				
					begin stateX <= 2'b00;
							stateY <= 2'b01; //01 is for Y down
							end
				
				else if ((Ghost_X_Pos==370 && Ghost_Y_Pos == 170) | (Ghost_X_Pos == 340 && Ghost_Y_Pos == 200)| (Ghost_X_Pos == 300 && Ghost_Y_Pos == 170)| (Ghost_X_Pos == 260 && Ghost_Y_Pos == 120))				
					begin stateX <= 2'b10;
							stateY <= 2'b00;
							end
				else if ((Ghost_X_Pos==300 && Ghost_Y_Pos == 200) | (Ghost_X_Pos == 260 && Ghost_Y_Pos == 170)| (Ghost_X_Pos == 160 && Ghost_Y_Pos == 120))				
					begin stateX <= 2'b10;
							stateY <= 2'b00;
							end
				*/
				
				
				//stateX <= stateX;
				//stateY <= stateY; 
				if (stateX == 2'b01)
				Ghost_X_Pos <= Ghost_X_Pos+2;
				else if (stateX == 2'b10)
				Ghost_X_Pos <= Ghost_X_Pos-2;
				else if (stateY == 2'b01) 
				Ghost_Y_Pos <= Ghost_Y_Pos+2;
				else if (stateY == 2'b10) 
				Ghost_Y_Pos <= Ghost_Y_Pos-2;
				else
				begin
				Ghost_Y_Pos <= Ghost_Y_Pos;
				Ghost_X_Pos <= Ghost_X_Pos;
				end
				
				
				
				
				
				if (Powerup)
				begin
				if (((GhostX+GhostS) >= (BallX-BallS)) & ((GhostX-GhostS) <= (BallX+BallS)) & ((GhostY+GhostS) >= (BallY-BallS)) & ((GhostY-GhostS) <= (BallY+BallS))) 
						               Captured = 1; 
				else 
											Captured = 0;
				end
				else if (((GhostX+GhostS) >= (BallX-BallS)) & ((GhostX-GhostS) <= (BallX+BallS)) & ((GhostY+GhostS) >= (BallY-BallS)) & ((GhostY-GhostS) <= (BallY+BallS))) 
											Lost = 1; 
				else
											Lost = 0;
			end
		end  
       
	 assign GhostX = Ghost_X_Pos;
   
    assign GhostY = Ghost_Y_Pos;
   
    assign GhostS = Ghost_Size;
    

endmodule