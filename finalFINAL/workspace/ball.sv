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


module  ball ( input Reset, frame_clk,
					input [3:0] ready,
					input [7:0] keycode,
					input [7:0] scoreval,
               output [9:0]  BallX, BallY, BallS, Ball_X_Motion, Ball_Y_Motion);
    
    logic [9:0] Ball_X_Pos, Ball_Y_Pos,  Ball_Size;
	 
    parameter [9:0] Ball_X_Center=320;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=240;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min=120;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=520;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=40;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=440;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=2;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=2;      // Step size on the Y axis

    assign Ball_Size = 6;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ball
        if (Reset)  // Asynchronous Reset
        begin 
            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
				Ball_X_Motion <= 10'd0; //Ball_X_Step;
				Ball_Y_Pos <= Ball_Y_Center;
				Ball_X_Pos <= Ball_X_Center;
        end
           
        else 
        begin/* 
				 if ( (Ball_Y_Pos + Ball_Size) >= Ball_Y_Max )  // Ball is at the bottom edge, STOP!
					  Ball_Y_Pos <= Ball_Y_Max-Ball_Size;  // STOP
					  
				 else if ( ((Ball_Y_Pos - Ball_Size) <= Ball_Y_Min ) || (Ball_Y_Pos < 0))  // Ball is at the top edge, STOP!
					  Ball_Y_Pos <= Ball_Y_Min+Ball_Size;  // STOP
					  
				 else if (Ball_X_Pos > Ball_X_Max)  // Ball is at the Right edge, PASS!
					  Ball_X_Pos <= Ball_X_Min+2;  // Pass
					  
				 else if (Ball_X_Pos <= Ball_X_Min)  // Ball is at the Left edge, PASS!
					  Ball_X_Pos <= Ball_X_Max-2; // Pass
				 */
				 //else if (keycode != 0)
				 //begin
				 case (keycode) //unique seems useless here
					8'h04 : begin
								begin
								/*
								if(Ball_X_Pos-Ball_X_Step >= Ball_X_Min)
									begin	
									Ball_X_Pos <= Ball_X_Pos-Ball_X_Step;//A
									end*/
								if (ready[2] == 1'b0)
									begin
									Ball_X_Pos <= Ball_X_Pos-Ball_X_Step;//A
									Ball_X_Motion <= -Ball_X_Step; //obsolete, just to make the mouth move
									Ball_Y_Motion <= 0;
									end
								else
									begin
									Ball_X_Motion <= 0;
									Ball_Y_Motion <= 0;
									end
								if (Ball_X_Pos <= Ball_X_Min)  // Ball is at the Left edge, PASS!
									Ball_X_Pos <= Ball_X_Max-2; // Pass
								
								end
								end
					        
					8'h07 : begin
								/*
								if(Ball_X_Pos+Ball_X_Step <= Ball_X_Max)
									begin	
									Ball_X_Pos <= Ball_X_Pos+Ball_X_Step;//D
									end*/
								if (ready[0] == 1'b0)
									begin
									Ball_X_Pos <= Ball_X_Pos+Ball_X_Step;//D
									Ball_X_Motion <= Ball_X_Step;
									Ball_Y_Motion <= 0;
									end
								else
									begin
									Ball_X_Motion <= 0;
									Ball_Y_Motion <= 0;
									end
								if (Ball_X_Pos >= Ball_X_Max)  // Ball is at the Right edge, PASS!
									Ball_X_Pos <= Ball_X_Min+2;  // Pass
								
								end	  
					8'h16 : begin
								if((Ball_Y_Pos+Ball_Size+Ball_Y_Step <= Ball_Y_Max) && (ready[1] == 1'b0))
									begin	
									Ball_Y_Pos <= Ball_Y_Pos+Ball_Y_Step;//S
									Ball_Y_Motion <= Ball_Y_Step;
									Ball_X_Motion <= 0;
									end
								else if ((Ball_Y_Pos + Ball_Size) >= Ball_Y_Max )  // Ball is at the bottom edge, STOP!
									Ball_Y_Pos <= Ball_Y_Max-Ball_Size;  // STOP
								
								else
									begin
									Ball_X_Motion <= 0;
									Ball_Y_Motion <= 0;
									end
								end
								
							  
					8'h1A : begin
								if((Ball_Y_Pos-Ball_Size-Ball_Y_Step >= Ball_Y_Min) && (Ball_Y_Pos > 0) && (ready[3] == 1'b0))
									begin	
									Ball_Y_Pos <= Ball_Y_Pos-Ball_Y_Step;//W
									Ball_Y_Motion <= -Ball_Y_Step;
									Ball_X_Motion <= 0;
									end
								
								else if(((Ball_Y_Pos - Ball_Size) <= Ball_Y_Min ) || (Ball_Y_Pos < 0))  // Ball is at the top edge, STOP!
									Ball_Y_Pos <= Ball_Y_Min+Ball_Size;  // STOP
								
									else
									begin
									Ball_X_Motion <= 0;
									Ball_Y_Motion <= 0;
									end
								end
					default: 	begin
									Ball_X_Motion <= 0;
									Ball_Y_Motion <= 0;
									end
					endcase
					
					if(Ball_X_Motion != 0 && Ball_Y_Motion != 0)
					begin
						Ball_Y_Motion <= 0;
					end

					
				//end
				
				
				
				 //Ball_Y_Pos <= (Ball_Y_Pos + Ball_Y_Motion);  // Update ball position
				 //Ball_X_Pos <= (Ball_X_Pos + Ball_X_Motion);
			
			
	  /**************************************************************************************
	    ATTENTION! Please answer the following quesiton in your lab report! Points will be allocated for the answers!
		 Hidden Question #2/2:
          Note that Ball_Y_Motion in the above statement may have been changed at the same clock edge
          that is causing the assignment of Ball_Y_pos.  Will the new value of Ball_Y_Motion be used,
          or the old?  How will this impact behavior of the ball during a bounce, and how might that 
          interact with a response to a keypress?  Can you fix it?  Give an answer in your Post-Lab.
      **************************************************************************************/
      
			
		end  
    end
       
    assign BallX = Ball_X_Pos;
   
    assign BallY = Ball_Y_Pos;
   
    assign BallS = Ball_Size;
    

endmodule

/*
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@,,,@@@,,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@,,,,@@,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@(,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@,,,,@@,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,@@@,,,,,,,@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@,,,,,@,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,@@,,,,,,,,,@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,,,,,,@@@,,,,@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*,,&@@@@@,,,,@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@#,,@@,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,,@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@*,,@@,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,,@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@#,,@@,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,,,,,,@@@,,,,@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@,,@@@@,,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@,,,@@,,,,@&,,,@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,,,@@@@@@@@@@@@@@@@@@@@@@@,,,@@@,,,,,,,@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
*/
