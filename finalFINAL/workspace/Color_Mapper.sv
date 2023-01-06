//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input        [9:0] BallX, BallY, DrawX, DrawY, Ball_size, Ball_X_Motion, Ball_Y_Motion,
							  input        Clk, 
							  input 			Exist0,
							  input        [9:0] PacX0, PacY0,
							  input 			Exist1,
							  input        [9:0] PacX1, PacY1, 
							  input 			Exist2,
							  input        [9:0] PacX2, PacY2, 
							  input 			Exist3,
							  input        [9:0] PacX3, PacY3, 
							  input 			Exist4,
							  input        [9:0] PacX4, PacY4, 
							  input 			Exist5,
							  input        [9:0] PacX5, PacY5, 
							  input 			Exist6,
							  input        [9:0] PacX6, PacY6, 
							  input 			Exist7,
							  input        [9:0] PacX7, PacY7, 
							  input 			Exist8,
							  input        [9:0] PacX8, PacY8, 
							  input 			Exist9,
							  input        [9:0] PacX9, PacY9,
							  input 			Exist10,
							  input        [9:0] PacX10, PacY10,
							  input 			Exist11,
							  input        [9:0] PacX11, PacY11, 
							  input 			Exist12,
							  input        [9:0] PacX12, PacY12, 
							  input 			Exist13,
							  input        [9:0] PacX13, PacY13, 
							  input 			Exist14,
							  input        [9:0] PacX14, PacY14, 
							  input 			Exist15,
							  input        [9:0] PacX15, PacY15, 
							  input 			Exist16,
							  input        [9:0] PacX16, PacY16, 
							  input 			Exist17,
							  input        [9:0] PacX17, PacY17, 
							  input 			Exist18,
							  input        [9:0] PacX18, PacY18, 
							  input 			Exist19,
							  input        [9:0] PacX19, PacY19,
							  input 			Exist20,
							  input        [9:0] PacX20, PacY20,
							  input 			Exist21,
							  input        [9:0] PacX21, PacY21, 
							  input 			Exist22,
							  input        [9:0] PacX22, PacY22, 
							  input 			Exist23,
							  input        [9:0] PacX23, PacY23, 
							  input 			Exist24,
							  input        [9:0] PacX24, PacY24, 
							  input 			Exist25,
							  input        [9:0] PacX25, PacY25, 
							  input 			Exist26,
							  input        [9:0] PacX26, PacY26, 
							  input 			Exist27,
							  input        [9:0] PacX27, PacY27, 
							  input 			Exist28, // continue here
							  input        [9:0] PacX28, PacY28, 
							  input 			Exist29,
							  input        [9:0] PacX29, PacY29,
							  input 			Exist30,
							  input        [9:0] PacX30, PacY30,
							  input 			Exist31,
							  input        [9:0] PacX31, PacY31, 
							  input 			Exist32,
							  input        [9:0] PacX32, PacY32, 
							  input 			Exist33,
							  input        [9:0] PacX33, PacY33, 
							  input 			Exist34,
							  input        [9:0] PacX34, PacY34, 
							  input 			Exist35,
							  input        [9:0] PacX35, PacY35, 
							  input 			Exist36,
							  input        [9:0] PacX36, PacY36, 
							  input 			Exist37,
							  input        [9:0] PacX37, PacY37, 
							  input 			Exist38,
							  input        [9:0] PacX38, PacY38, 
							  input 			Exist39,
							  input        [9:0] PacX39, PacY39,
							  input 			Exist40,
							  input        [9:0] PacX40, PacY40,
							  input 			Exist41,
							  input        [9:0] PacX41, PacY41, 
							  input 			Exist42,
							  input        [9:0] PacX42, PacY42, 
							  input 			Exist43,
							  input        [9:0] PacX43, PacY43, 
							  input 			Exist44,
							  input        [9:0] PacX44, PacY44, 
							  input 			Exist45,
							  input        [9:0] PacX45, PacY45, 
							  input 			Exist46,
							  input        [9:0] PacX46, PacY46, 
							  input 			Exist47,
							  input        [9:0] PacX47, PacY47, 
							  input 			Exist48,
							  input        [9:0] PacX48, PacY48, 
							  input 			Exist49,
							  input        [9:0] PacX49, PacY49,
							  input 			Exist50,
							  input        [9:0] PacX50, PacY50,
							  input 			Exist51,
							  input        [9:0] PacX51, PacY51, 
							  input 			Exist52,
							  input        [9:0] PacX52, PacY52, 
							  input 			Exist53,
							  input        [9:0] PacX53, PacY53, 
							  input 			Exist54,
							  input        [9:0] PacX54, PacY54, 
							  input 			Exist55,
							  input        [9:0] PacX55, PacY55, 
							  input 			Exist56,
							  input        [9:0] PacX56, PacY56, 
							  input 			Exist57,
							  input        [9:0] PacX57, PacY57, 
							  input 			Exist58,
							  input        [9:0] PacX58, PacY58, 
							  input 			Exist59,
							  input        [9:0] PacX59, PacY59,
							  input 			Exist60,
							  input        [9:0] PacX60, PacY60,
							  input 			Exist61,
							  input        [9:0] PacX61, PacY61, 
							  input 			Exist62,
							  input        [9:0] PacX62, PacY62, 
							  input 			Exist63,
							  input        [9:0] PacX63, PacY63, 
							  input 			Exist64,
							  input        [9:0] PacX64, PacY64, 
							  input 			Exist65,
							  input        [9:0] PacX65, PacY65, 
							  input 			Exist66,
							  input        [9:0] PacX66, PacY66, 
							  input 			Exist67,
							  input        [9:0] PacX67, PacY67, 
							  input 			Exist68,
							  input        [9:0] PacX68, PacY68, 
							  input 			Exist69,
							  input        [9:0] PacX69, PacY69,
							  input 			Exist70,
							  input        [9:0] PacX70, PacY70,
							  input 			Exist71,
							  input        [9:0] PacX71, PacY71, 
							  input 			Exist72,
							  input        [9:0] PacX72, PacY72, 
							  input 			Exist73,
							  input        [9:0] PacX73, PacY73, 
							  input 			Exist74,
							  input        [9:0] PacX74, PacY74, 
							  input 			Exist75,
							  input        [9:0] PacX75, PacY75, 
							  input 			Exist76,
							  input        [9:0] PacX76, PacY76, 
							  input 			Exist77,
							  input        [9:0] PacX77, PacY77, 
							  input 			Exist78,
							  input        [9:0] PacX78, PacY78, 
							  input 			Exist79,
							  input        [9:0] PacX79, PacY79,

							  input 			[9:0] wa0, wb0, wc0, wd0,
							  input 			[9:0] wa1, wb1, wc1, wd1,
							  input 			[9:0] wa2, wb2, wc2, wd2,
							  input 			[9:0] wa3, wb3, wc3, wd3,
							  input 			[9:0] wa4, wb4, wc4, wd4,
							  input 			[9:0] wa5, wb5, wc5, wd5,
							  input 			[9:0] wa6, wb6, wc6, wd6,
							  input 			[9:0] wa7, wb7, wc7, wd7,
							  input 			[9:0] wa8, wb8, wc8, wd8,
							  input 			[9:0] wa9, wb9, wc9, wd9,
							  input 			[9:0] wa10, wb10, wc10, wd10,
							  input 			[9:0] wa11, wb11, wc11, wd11,
							  input 			[9:0] wa12, wb12, wc12, wd12,
							  input 			[9:0] wa13, wb13, wc13, wd13,
							  input 			[9:0] wa14, wb14, wc14, wd14,
							  input 			[9:0] wa15, wb15, wc15, wd15,
							  input 			[9:0] wa16, wb16, wc16, wd16,
							  input 			[9:0] wa17, wb17, wc17, wd17,
							  input 			[9:0] wa18, wb18, wc18, wd18,
							  input 			[9:0] wa19, wb19, wc19, wd19,
							  input 			[9:0] wa20, wb20, wc20, wd20,
							  input 			[9:0] wa21, wb21, wc21, wd21,
							  input 			[9:0] wa22, wb22, wc22, wd22,
							  input 			[9:0] wa23, wb23, wc23, wd23,
							  input 			[9:0] wa24, wb24, wc24, wd24,
							  input 			[9:0] wa25, wb25, wc25, wd25,
							  input 			[9:0] wa26, wb26, wc26, wd26,
							  input 			[9:0] wa27, wb27, wc27, wd27,
							  input 			[9:0] wa28, wb28, wc28, wd28,
							  input 			[9:0] wa29, wb29, wc29, wd29,
							  input 			[9:0] wa30, wb30, wc30, wd30,
							  input 			[9:0] wa31, wb31, wc31, wd31,
							  input 			[9:0] wa32, wb32, wc32, wd32,
							  input 			[9:0] wa33, wb33, wc33, wd33,
							  input 			[9:0] wa34, wb34, wc34, wd34,
							  input 			[9:0] wa35, wb35, wc35, wd35,
							  input 			[9:0] wa36, wb36, wc36, wd36,
							  input 			[9:0] wa37, wb37, wc37, wd37,
							  input 			[9:0] wa38, wb38, wc38, wd38,
							  input 			[9:0] wa39, wb39, wc39, wd39,
							  input 			[9:0] wa40, wb40, wc40, wd40,
							  input 			[9:0] wa41, wb41, wc41, wd41,
							  input 			[9:0] wa42, wb42, wc42, wd42,
							  input 			[6:0] deci0, deci1,
							  input			[9:0] ghostxsig0,ghostysig0,ghostsizesig0,
							  input			[9:0] ghostxsig1,ghostysig1,ghostsizesig1,
							  input			[9:0] ghostxsig2,ghostysig2,ghostsizesig2,
							  input			[9:0] ghostxsig3,ghostysig3,ghostsizesig3,
                       output logic [7:0]  Red, Green, Blue );
    
    logic ball_on, mouth_on, outwall_on;
	 logic g0_on, g1_on, g2_on, g3_on;
	 logic pac0_on, pac1_on, pac2_on, pac3_on, pac4_on, pac5_on, pac6_on, pac7_on, pac8_on, pac9_on;
	 logic pac10_on, pac11_on, pac12_on, pac13_on, pac14_on, pac15_on, pac16_on, pac17_on, pac18_on, pac19_on;
	 logic pac20_on, pac21_on, pac22_on, pac23_on, pac24_on, pac25_on, pac26_on, pac27_on, pac28_on, pac29_on;
	 logic pac30_on, pac31_on, pac32_on, pac33_on, pac34_on, pac35_on, pac36_on, pac37_on, pac38_on, pac39_on;
	 logic pac40_on, pac41_on, pac42_on, pac43_on, pac44_on, pac45_on, pac46_on, pac47_on, pac48_on, pac49_on;
	 logic pac50_on, pac51_on, pac52_on, pac53_on, pac54_on, pac55_on, pac56_on, pac57_on, pac58_on, pac59_on;
	 logic pac60_on, pac61_on, pac62_on, pac63_on, pac64_on, pac65_on, pac66_on, pac67_on, pac68_on, pac69_on;
	 logic pac70_on, pac71_on, pac72_on, pac73_on, pac74_on, pac75_on, pac76_on, pac77_on, pac78_on, pac79_on;
	 logic w0_on, w1_on, w2_on, w3_on, w4_on, w5_on, w6_on, w7_on, w8_on, w9_on, w10_on,
			 w11_on,w12_on,w13_on,w14_on,w15_on,w16_on,w17_on,w18_on,w19_on ,w20_on ,w21_on ,w22_on ,w23_on,
			 w24_on,w25_on,w26_on,w27_on,w28_on,w29_on,w30_on,w31_on,w32_on,w33_on,w34_on,w35_on,w36_on,w37_on
			 ,w38_on,w39_on,w40_on,w41_on,w42_on;
	 logic LED00_on, LED01_on, LED02_on, LED03_on, LED04_on, LED05_on, LED06_on;
	 logic LED10_on, LED11_on, LED12_on, LED13_on, LED14_on, LED15_on, LED16_on;
	 int flag;
	 
 /* Old Ball: Generated square box by checking if the current pixel is within a square of length
    2*Ball_Size, centered at (BallX, BallY).  Note that this requires unsigned comparisons.
	 
    if ((DrawX >= BallX - Ball_size) &&
       (DrawX <= BallX + Ball_size) &&
       (DrawY >= BallY - Ball_size) &&
       (DrawY <= BallY + Ball_size))

     New Ball: Generates (pixelated) circle by using the standard circle formula.  Note that while 
     this single line is quite powerful descriptively, it causes the synthesis tool to use up three
     of the 12 available multipliers on the chip!  Since the multiplicants are required to be signed,
	  we have to first cast them from logic to int (signed by default) before they are multiplied). */
	  
    int DistX, DistY, Size;
	 assign DistX = DrawX - BallX;
    assign DistY = DrawY - BallY;
    assign Size = Ball_size*Ball_size;
	 parameter C = 10000000;
	 always_ff @ (posedge Clk)
	 begin
	 flag <= flag + 1;
	 if (flag >= C)
	 flag <= 0;
	 end
	  
    always_comb
    begin:Ball_on_proc
        if ( ( DistX*DistX + DistY*DistY) <= (Size) ) 
            ball_on = 1'b1;
        else 
            ball_on = 1'b0;
     end 
	 
	 always_comb
    begin:Mouth_on_proc
        if(Ball_Y_Motion == 10'b0)
		  begin
			if(Ball_X_Motion == 10'b010) //RIGHT
			begin
				if (((DistX*DistX + DistY*DistY) <= (Size)) && (DistY <= DistX) && (DistY >= -DistX) && (flag <= C/2))
				begin
            mouth_on = 1'b1;
				end
				else
				begin
            mouth_on = 1'b0;
				end
			end
			else if(Ball_X_Motion !=10'b0)//LEFT
			begin
				if (((DistX*DistX + DistY*DistY) <= (Size)) && (DistY >= DistX) && (DistY <= -DistX) && (flag <= C/2))				 
            begin
				mouth_on = 1'b1;
				end
				else 
            begin
				mouth_on = 1'b0;
				end
			end
			else
			begin
			mouth_on = 1'b0; // never gets here
			end
		  end
		  else
		  begin
			if(Ball_Y_Motion == 10'b010) // DOWN
			begin
				if (((DistX*DistX + DistY*DistY) <= (Size)) && (DistY >= DistX) && (DistY >= -DistX) && (flag <= C/2))
				begin
            mouth_on = 1'b1;
				end
				else
				begin
            mouth_on = 1'b0;
				end
			end
			else if(Ball_Y_Motion != 10'b0) // UP
			begin
				if (((DistX*DistX + DistY*DistY) <= (Size)) && (DistY <= DistX) && (DistY <= -DistX) && (flag <= C/2))
				begin
            mouth_on = 1'b1;
				end
				else
				begin
            mouth_on = 1'b0;
				end
			end
			else
			begin
			mouth_on = 1'b0; // never gets here
			end
		  end
     end 
	  
	  //WALL CODE >>>>>>>>>>>>>>>>>>>>>
	  always_comb
	 begin:Wall0_on_proc
		  if ((DrawX<=wc0)&&(DrawX>=wa0)&&(DrawY<=wd0)&&(DrawY>=wb0)) 
				w0_on = 1'b1;
		  else 
				w0_on = 1'b0;
	  end 
	  always_comb
	 begin:Wall1_on_proc
		  if ((DrawX<=wc1)&&(DrawX>=wa1)&&(DrawY<=wd1)&&(DrawY>=wb1)) 
				w1_on = 1'b1;
		  else 
				w1_on = 1'b0;
	  end 
	  always_comb
	 begin:Wall2_on_proc
		  if ((DrawX<=wc2)&&(DrawX>=wa2)&&(DrawY<=wd2)&&(DrawY>=wb2)) 
				w2_on = 1'b1;
		  else 
				w2_on = 1'b0;
	  end 
	  always_comb
	 begin:Wall3_on_proc
		  if ((DrawX<=wc3)&&(DrawX>=wa3)&&(DrawY<=wd3)&&(DrawY>=wb3)) 
				w3_on = 1'b1;
		  else 
				w3_on = 1'b0;
	  end 
	  always_comb
	  begin:Wall4_on_proc
		  if ((DrawX<=wc4)&&(DrawX>=wa4)&&(DrawY<=wd4)&&(DrawY>=wb4)) 
				w4_on = 1'b1;
		  else 
				w4_on = 1'b0;
	  end 
	  always_comb
	  begin:Wall5_on_proc
		  if ((DrawX<=wc5)&&(DrawX>=wa5)&&(DrawY<=wd5)&&(DrawY>=wb5)) 
				w5_on = 1'b1;
		  else 
				w5_on = 1'b0;
	  end 
	  always_comb
	  begin:Wall6_on_proc
		  if ((DrawX<=wc6)&&(DrawX>=wa6)&&(DrawY<=wd6)&&(DrawY>=wb6)) 
				w6_on = 1'b1;
		  else 
				w6_on = 1'b0;
	  end 
	  always_comb
	  begin:Wall7_on_proc
		  if ((DrawX<=wc7)&&(DrawX>=wa7)&&(DrawY<=wd7)&&(DrawY>=wb7)) 
				w7_on = 1'b1;
		  else 
				w7_on = 1'b0;
	  end	 
	  always_comb
	  begin:Wall8_on_proc
		  if ((DrawX<=wc8)&&(DrawX>=wa8)&&(DrawY<=wd8)&&(DrawY>=wb8)) 
				w8_on = 1'b1;
		  else 
				w8_on = 1'b0;
	  end
	  always_comb
	  begin:Wall9_on_proc
		  if ((DrawX<=wc9)&&(DrawX>=wa9)&&(DrawY<=wd9)&&(DrawY>=wb9)) 
				w9_on = 1'b1;
		  else 
				w9_on = 1'b0;
	  end 
	  always_comb
	  begin:Wall10_on_proc
		  if ((DrawX<=wc10)&&(DrawX>=wa10)&&(DrawY<=wd10)&&(DrawY>=wb10)) 
				w10_on = 1'b1;
		  else 
				w10_on = 1'b0;
	  end
	  always_comb
	  begin:Wall11_on_proc
		  if ((DrawX<=wc11)&&(DrawX>=wa11)&&(DrawY<=wd11)&&(DrawY>=wb11)) 
				w11_on = 1'b1;
		  else 
				w11_on = 1'b0;
	  end 
	  always_comb
	  begin:Wall12_on_proc
		  if ((DrawX<=wc12)&&(DrawX>=wa12)&&(DrawY<=wd12)&&(DrawY>=wb12)) 
				w12_on = 1'b1;
		  else 
				w12_on = 1'b0;
	  end
  	  always_comb
	  begin:Wall13_on_proc
		  if ((DrawX<=wc13)&&(DrawX>=wa13)&&(DrawY<=wd13)&&(DrawY>=wb13)) 
				w13_on = 1'b1;
		  else 
				w13_on = 1'b0;
	  end 
	  always_comb
	  begin:Wall14_on_proc
		  if ((DrawX<=wc14)&&(DrawX>=wa14)&&(DrawY<=wd14)&&(DrawY>=wb14)) 
				w14_on = 1'b1;
		  else 
				w14_on = 1'b0;
	  end 
	  always_comb
	  begin:Wall15_on_proc
		  if ((DrawX<=wc15)&&(DrawX>=wa15)&&(DrawY<=wd15)&&(DrawY>=wb15)) 
				w15_on = 1'b1;
		  else 
				w15_on = 1'b0;
	  end 
	  always_comb
	  begin:Wall16_on_proc
		  if ((DrawX<=wc16)&&(DrawX>=wa16)&&(DrawY<=wd16)&&(DrawY>=wb16)) 
				w16_on = 1'b1;
		  else 
				w16_on = 1'b0;
	  end 
	  always_comb
	  begin:Wall17_on_proc
		  if ((DrawX<=wc17)&&(DrawX>=wa17)&&(DrawY<=wd17)&&(DrawY>=wb17)) 
				w17_on = 1'b1;
		  else 
				w17_on = 1'b0;
	  end 
	  always_comb
	  begin:Wall18_on_proc
		  if ((DrawX<=wc18)&&(DrawX>=wa18)&&(DrawY<=wd18)&&(DrawY>=wb18)) 
				w18_on = 1'b1;
		  else 
				w18_on = 1'b0;
	  end   
	  always_comb
	  begin:Wall19_on_proc
		  if ((DrawX<=wc19)&&(DrawX>=wa19)&&(DrawY<=wd19)&&(DrawY>=wb19)) 
				w19_on = 1'b1;
		  else 
				w19_on = 1'b0;
	  end 
	  always_comb
	  begin:Wall20_on_proc
		  if ((DrawX<=wc20)&&(DrawX>=wa20)&&(DrawY<=wd20)&&(DrawY>=wb20)) 
				w20_on = 1'b1;
		  else 
				w20_on = 1'b0;
	  end 
	  always_comb
	  begin:Wall21_on_proc
		  if ((DrawX<=wc21)&&(DrawX>=wa21)&&(DrawY<=wd21)&&(DrawY>=wb21)) 
				w21_on = 1'b1;
		  else 
				w21_on = 1'b0;
	  end 
	  always_comb
	  begin:Wall22_on_proc
		  if ((DrawX<=wc22)&&(DrawX>=wa22)&&(DrawY<=wd22)&&(DrawY>=wb22)) 
				w22_on = 1'b1;
		  else 
				w22_on = 1'b0;
	  end 
	  always_comb
	  begin:Wall23_on_proc
		  if ((DrawX<=wc23)&&(DrawX>=wa23)&&(DrawY<=wd23)&&(DrawY>=wb23)) 
				w23_on = 1'b1;
		  else 
				w23_on = 1'b0;
	  end 
	  always_comb
	  begin:Wall24_on_proc
		  if ((DrawX<=wc24)&&(DrawX>=wa24)&&(DrawY<=wd24)&&(DrawY>=wb24)) 
				w24_on = 1'b1;
		  else 
				w24_on = 1'b0;
	  end 
	 
	 always_comb
	  begin:Wall25_on_proc
		  if ((DrawX<=wc25)&&(DrawX>=wa25)&&(DrawY<=wd25)&&(DrawY>=wb25)) 
				w25_on = 1'b1;
		  else 
				w25_on = 1'b0;
	  end 
	 
	 always_comb
	  begin:Wall26_on_proc
		  if ((DrawX<=wc26)&&(DrawX>=wa26)&&(DrawY<=wd26)&&(DrawY>=wb26)) 
				w26_on = 1'b1;
		  else 
				w26_on = 1'b0;
	  end 
	 always_comb
	  begin:Wall27_on_proc
		  if ((DrawX<=wc27)&&(DrawX>=wa27)&&(DrawY<=wd27)&&(DrawY>=wb27)) 
				w27_on = 1'b1;
		  else 
				w27_on = 1'b0;
	  end 
	 always_comb
	  begin:Wall28_on_proc
		  if ((DrawX<=wc28)&&(DrawX>=wa28)&&(DrawY<=wd28)&&(DrawY>=wb28)) 
				w28_on = 1'b1;
		  else 
				w28_on = 1'b0;
	  end 
	 always_comb
	  begin:Wall29_on_proc
		  if ((DrawX<=wc29)&&(DrawX>=wa29)&&(DrawY<=wd29)&&(DrawY>=wb29)) 
				w29_on = 1'b1;
		  else 
				w29_on = 1'b0;
	  end 
	 always_comb
	  begin:Wall30_on_proc
		  if ((DrawX<=wc30)&&(DrawX>=wa30)&&(DrawY<=wd30)&&(DrawY>=wb30)) 
				w30_on = 1'b1;
		  else 
				w30_on = 1'b0;
	  end 
	 always_comb
	  begin:Wall31_on_proc
		  if ((DrawX<=wc31)&&(DrawX>=wa31)&&(DrawY<=wd31)&&(DrawY>=wb31)) 
				w31_on = 1'b1;
		  else 
				w31_on = 1'b0;
	  end 
	 
	 always_comb
	  begin:Wall32_on_proc
		  if ((DrawX<=wc32)&&(DrawX>=wa32)&&(DrawY<=wd32)&&(DrawY>=wb32)) 
				w32_on = 1'b1;
		  else 
				w32_on = 1'b0;
	  end 
	 
	 always_comb
	  begin:Wall33_on_proc
		  if ((DrawX<=wc33)&&(DrawX>=wa33)&&(DrawY<=wd33)&&(DrawY>=wb33)) 
				w33_on = 1'b1;
		  else 
				w33_on = 1'b0;
	  end 
	 
	 always_comb
	  begin:Wall34_on_proc
		  if ((DrawX<=wc34)&&(DrawX>=wa34)&&(DrawY<=wd34)&&(DrawY>=wb34)) 
				w34_on = 1'b1;
		  else 
				w34_on = 1'b0;
	  end 
	 
	 always_comb
	  begin:Wall35_on_proc
		  if ((DrawX<=wc35)&&(DrawX>=wa35)&&(DrawY<=wd35)&&(DrawY>=wb35)) 
				w35_on = 1'b1;
		  else 
				w35_on = 1'b0;
	  end 
	 
	 always_comb
	  begin:Wall36_on_proc
		  if ((DrawX<=wc36)&&(DrawX>=wa36)&&(DrawY<=wd36)&&(DrawY>=wb36)) 
				w36_on = 1'b1;
		  else 
				w36_on = 1'b0;
	  end 
	 
	 always_comb
	  begin:Wall37_on_proc
		  if ((DrawX<=wc37)&&(DrawX>=wa37)&&(DrawY<=wd37)&&(DrawY>=wb37)) 
				w37_on = 1'b1;
		  else 
				w37_on = 1'b0;
	  end 
	 
	 always_comb
	  begin:Wall38_on_proc
		  if ((DrawX<=wc38)&&(DrawX>=wa38)&&(DrawY<=wd38)&&(DrawY>=wb38)) 
				w38_on = 1'b1;
		  else 
				w38_on = 1'b0;
	  end 
	  
	 always_comb
	  begin:Wall39_on_proc
		  if ((DrawX<=wc39)&&(DrawX>=wa39)&&(DrawY<=wd39)&&(DrawY>=wb39)) 
				w39_on = 1'b1;
		  else 
				w39_on = 1'b0;
	  end 
	 always_comb
	  begin:Wall40_on_proc
		  if ((DrawX<=wc40)&&(DrawX>=wa40)&&(DrawY<=wd40)&&(DrawY>=wb40)) 
				w40_on = 1'b1;
		  else 
				w40_on = 1'b0;
	  end 
	  always_comb
	  begin:Wall41_on_proc
		  if ((DrawX<=wc41)&&(DrawX>=wa41)&&(DrawY<=wd41)&&(DrawY>=wb41)) 
				w41_on = 1'b1;
		  else 
				w41_on = 1'b0;
	  end 
	  always_comb
	  begin:Wall42_on_proc
		  if ((DrawX<=wc42)&&(DrawX>=wa42)&&(DrawY<=wd42)&&(DrawY>=wb42)) 
				w42_on = 1'b1;
		  else 
				w42_on = 1'b0;
	  end 

	 //PAC CODE >>>>>>>>>>>>>>>>>>>>>>>> 
	 always_comb 
	 begin:Pac0_on_proc
		  if ( (DrawX) <= (PacX0+1) && (DrawX) >= (PacX0-1)  && (DrawY) <= (PacY0+1)  && (DrawY) >= (PacY0-1) && Exist0 == 1) 
				pac0_on = 1'b1;
		  else 
				pac0_on = 1'b0;
	  end 
	  
	 always_comb
	 begin:Pac1_on_proc
		  if ( (DrawX) <= (PacX1+1) && (DrawX) >= (PacX1-1)  && (DrawY) <= (PacY1+1)  && (DrawY) >= (PacY1-1) && Exist1 == 1) 
				pac1_on = 1'b1;
		  else 
				pac1_on = 1'b0;
	  end 
	 
	 always_comb
	 begin:Pac2_on_proc
		  if ( (DrawX) <= (PacX2+1) && (DrawX) >= (PacX2-1)  && (DrawY) <= (PacY2+1)  && (DrawY) >= (PacY2-1) && Exist2 == 1) 
				pac2_on = 1'b1;
		  else 
				pac2_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac3_on_proc
		  if ( (DrawX) <= (PacX3+1) && (DrawX) >= (PacX3-1)  && (DrawY) <= (PacY3+1)  && (DrawY) >= (PacY3-1) && Exist3 == 1) 
				pac3_on = 1'b1;
		  else 
				pac3_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac4_on_proc
		  if ( (DrawX) <= (PacX4+1) && (DrawX) >= (PacX4-1)  && (DrawY) <= (PacY4+1)  && (DrawY) >= (PacY4-1) && Exist4 == 1) 
				pac4_on = 1'b1;
		  else 
				pac4_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac5_on_proc
		  if ( (DrawX) <= (PacX5+1) && (DrawX) >= (PacX5-1)  && (DrawY) <= (PacY5+1)  && (DrawY) >= (PacY5-1) && Exist5 == 1) 
				pac5_on = 1'b1;
		  else 
				pac5_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac6_on_proc
		  if ( (DrawX) <= (PacX6+1) && (DrawX) >= (PacX6-1)  && (DrawY) <= (PacY6+1)  && (DrawY) >= (PacY6-1) && Exist6 == 1) 
				pac6_on = 1'b1;
		  else 
				pac6_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac7_on_proc
		  if ( (DrawX) <= (PacX7+1) && (DrawX) >= (PacX7-1)  && (DrawY) <= (PacY7+1)  && (DrawY) >= (PacY7-1) && Exist7 == 1) 
				pac7_on = 1'b1;
		  else 
				pac7_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac8_on_proc
		  if ( (DrawX) <= (PacX8+1) && (DrawX) >= (PacX8-1)  && (DrawY) <= (PacY8+1)  && (DrawY) >= (PacY8-1) && Exist8 == 1) 
				pac8_on = 1'b1;
		  else 
				pac8_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac9_on_proc
		  if ( (DrawX) <= (PacX9+1) && (DrawX) >= (PacX9-1)  && (DrawY) <= (PacY9+1)  && (DrawY) >= (PacY9-1) && Exist9 == 1) 
				pac9_on = 1'b1;
		  else 
				pac9_on = 1'b0;
	  end 
	 
	
	always_comb 
	 begin:Pac10_on_proc
		  if ( (DrawX) <= (PacX10+1) && (DrawX) >= (PacX10-1)  && (DrawY) <= (PacY10+1)  && (DrawY) >= (PacY10-1) && Exist10 == 1) 
				pac10_on = 1'b1;
		  else 
				pac10_on = 1'b0;
	  end 
	  
	 always_comb
	 begin:Pac11_on_proc
		  if ( (DrawX) <= (PacX11+1) && (DrawX) >= (PacX11-1)  && (DrawY) <= (PacY11+1)  && (DrawY) >= (PacY11-1) && Exist11 == 1) 
				pac11_on = 1'b1;
		  else 
				pac11_on = 1'b0;
	  end 
	 
	 always_comb
	 begin:Pac12_on_proc
		  if ( (DrawX) <= (PacX12+1) && (DrawX) >= (PacX12-1)  && (DrawY) <= (PacY12+1)  && (DrawY) >= (PacY12-1) && Exist12 == 1) 
				pac12_on = 1'b1;
		  else 
				pac12_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac13_on_proc
		  if ( (DrawX) <= (PacX13+1) && (DrawX) >= (PacX13-1)  && (DrawY) <= (PacY13+1)  && (DrawY) >= (PacY13-1) && Exist13 == 1) 
				pac13_on = 1'b1;
		  else 
				pac13_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac14_on_proc
		  if ( (DrawX) <= (PacX14+1) && (DrawX) >= (PacX14-1)  && (DrawY) <= (PacY14+1)  && (DrawY) >= (PacY14-1) && Exist14 == 1) 
				pac14_on = 1'b1;
		  else 
				pac14_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac15_on_proc
		  if ( (DrawX) <= (PacX15+1) && (DrawX) >= (PacX15-1)  && (DrawY) <= (PacY15+1)  && (DrawY) >= (PacY15-1) && Exist15 == 1) 
				pac15_on = 1'b1;
		  else 
				pac15_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac16_on_proc
		  if ( (DrawX) <= (PacX16+1) && (DrawX) >= (PacX16-1)  && (DrawY) <= (PacY16+1)  && (DrawY) >= (PacY16-1) && Exist16 == 1) 
				pac16_on = 1'b1;
		  else 
				pac16_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac17_on_proc
		  if ( (DrawX) <= (PacX17+1) && (DrawX) >= (PacX17-1)  && (DrawY) <= (PacY17+1)  && (DrawY) >= (PacY17-1) && Exist17 == 1) 
				pac17_on = 1'b1;
		  else 
				pac17_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac18_on_proc
		  if ( (DrawX) <= (PacX18+1) && (DrawX) >= (PacX18-1)  && (DrawY) <= (PacY18+1)  && (DrawY) >= (PacY18-1) && Exist18 == 1) 
				pac18_on = 1'b1;
		  else 
				pac18_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac19_on_proc
		  if ( (DrawX) <= (PacX19+1) && (DrawX) >= (PacX19-1)  && (DrawY) <= (PacY19+1)  && (DrawY) >= (PacY19-1) && Exist19 == 1) 
				pac19_on = 1'b1;
		  else 
				pac19_on = 1'b0;
	  end 
	
	always_comb 
	 begin:Pac20_on_proc
		  if ( (DrawX) <= (PacX20+1) && (DrawX) >= (PacX20-1)  && (DrawY) <= (PacY20+1)  && (DrawY) >= (PacY20-1) && Exist20 == 1) 
				pac20_on = 1'b1;
		  else 
				pac20_on = 1'b0;
	  end 
	  
	 always_comb
	 begin:Pac21_on_proc
		  if ( (DrawX) <= (PacX21+1) && (DrawX) >= (PacX21-1)  && (DrawY) <= (PacY21+1)  && (DrawY) >= (PacY21-1) && Exist21 == 1) 
				pac21_on = 1'b1;
		  else 
				pac21_on = 1'b0;
	  end 
	 
	 always_comb
	 begin:Pac22_on_proc
		  if ( (DrawX) <= (PacX22+1) && (DrawX) >= (PacX22-1)  && (DrawY) <= (PacY22+1)  && (DrawY) >= (PacY22-1) && Exist22 == 1) 
				pac22_on = 1'b1;
		  else 
				pac22_on = 1'b0;
	  end 
	  
	  always_comb //continue here
	 begin:Pac23_on_proc
		  if ( (DrawX) <= (PacX23+1) && (DrawX) >= (PacX23-1)  && (DrawY) <= (PacY23+1)  && (DrawY) >= (PacY23-1) && Exist23 == 1) 
				pac23_on = 1'b1;
		  else 
				pac23_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac24_on_proc
		  if ( (DrawX) <= (PacX24+1) && (DrawX) >= (PacX24-1)  && (DrawY) <= (PacY24+1)  && (DrawY) >= (PacY24-1) && Exist24 == 1) 
				pac24_on = 1'b1;
		  else 
				pac24_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac25_on_proc
		  if ( (DrawX) <= (PacX25+1) && (DrawX) >= (PacX25-1)  && (DrawY) <= (PacY25+1)  && (DrawY) >= (PacY25-1) && Exist25 == 1) 
				pac25_on = 1'b1;
		  else 
				pac25_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac26_on_proc
		  if ( (DrawX) <= (PacX26+1) && (DrawX) >= (PacX26-1)  && (DrawY) <= (PacY26+1)  && (DrawY) >= (PacY26-1) && Exist26 == 1) 
				pac26_on = 1'b1;
		  else 
				pac26_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac27_on_proc
		  if ( (DrawX) <= (PacX27+1) && (DrawX) >= (PacX27-1)  && (DrawY) <= (PacY27+1)  && (DrawY) >= (PacY27-1) && Exist27 == 1) 
				pac27_on = 1'b1;
		  else 
				pac27_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac28_on_proc
		  if ( (DrawX) <= (PacX28+1) && (DrawX) >= (PacX28-1)  && (DrawY) <= (PacY28+1)  && (DrawY) >= (PacY28-1) && Exist28 == 1) 
				pac28_on = 1'b1;
		  else 
				pac28_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac29_on_proc
		  if ( (DrawX) <= (PacX29+1) && (DrawX) >= (PacX29-1)  && (DrawY) <= (PacY29+1)  && (DrawY) >= (PacY29-1) && Exist29 == 1) 
				pac29_on = 1'b1;
		  else 
				pac29_on = 1'b0;
	  end 
	 
	 always_comb 
	 begin:Pac30_on_proc
		  if ( (DrawX) <= (PacX30+1) && (DrawX) >= (PacX30-1)  && (DrawY) <= (PacY30+1)  && (DrawY) >= (PacY30-1) && Exist30 == 1) 
				pac30_on = 1'b1;
		  else 
				pac30_on = 1'b0;
	  end 
	  
	 always_comb
	 begin:Pac31_on_proc
		  if ( (DrawX) <= (PacX31+1) && (DrawX) >= (PacX31-1)  && (DrawY) <= (PacY31+1)  && (DrawY) >= (PacY31-1) && Exist31 == 1) 
				pac31_on = 1'b1;
		  else 
				pac31_on = 1'b0;
	  end 
	 
	 always_comb
	 begin:Pac32_on_proc
		  if ( (DrawX) <= (PacX32+1) && (DrawX) >= (PacX32-1)  && (DrawY) <= (PacY32+1)  && (DrawY) >= (PacY32-1) && Exist32 == 1) 
				pac32_on = 1'b1;
		  else 
				pac32_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac33_on_proc
		  if ( (DrawX) <= (PacX33+1) && (DrawX) >= (PacX33-1)  && (DrawY) <= (PacY33+1)  && (DrawY) >= (PacY33-1) && Exist33 == 1) 
				pac33_on = 1'b1;
		  else 
				pac33_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac34_on_proc
		  if ( (DrawX) <= (PacX34+1) && (DrawX) >= (PacX34-1)  && (DrawY) <= (PacY34+1)  && (DrawY) >= (PacY34-1) && Exist34 == 1) 
				pac34_on = 1'b1;
		  else 
				pac34_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac35_on_proc
		  if ( (DrawX) <= (PacX35+1) && (DrawX) >= (PacX35-1)  && (DrawY) <= (PacY35+1)  && (DrawY) >= (PacY35-1) && Exist35 == 1) 
				pac35_on = 1'b1;
		  else 
				pac35_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac36_on_proc
		  if ( (DrawX) <= (PacX36+1) && (DrawX) >= (PacX36-1)  && (DrawY) <= (PacY36+1)  && (DrawY) >= (PacY36-1) && Exist36 == 1) 
				pac36_on = 1'b1;
		  else 
				pac36_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac37_on_proc
		  if ( (DrawX) <= (PacX37+1) && (DrawX) >= (PacX37-1)  && (DrawY) <= (PacY37+1)  && (DrawY) >= (PacY37-1) && Exist37 == 1) 
				pac37_on = 1'b1;
		  else 
				pac37_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac38_on_proc
		  if ( (DrawX) <= (PacX38+1) && (DrawX) >= (PacX38-1)  && (DrawY) <= (PacY38+1)  && (DrawY) >= (PacY38-1) && Exist38 == 1) 
				pac38_on = 1'b1;
		  else 
				pac38_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac39_on_proc
		  if ( (DrawX) <= (PacX39+1) && (DrawX) >= (PacX39-1)  && (DrawY) <= (PacY39+1)  && (DrawY) >= (PacY39-1) && Exist39 == 1) 
				pac39_on = 1'b1;
		  else 
				pac39_on = 1'b0;
	  end 
	  
	  always_comb 
	 begin:Pac40_on_proc
		  if ( (DrawX) <= (PacX40+1) && (DrawX) >= (PacX40-1)  && (DrawY) <= (PacY40+1)  && (DrawY) >= (PacY40-1) && Exist40 == 1) 
				pac40_on = 1'b1;
		  else 
				pac40_on = 1'b0;
	  end 
	  
	 always_comb
	 begin:Pac41_on_proc
		  if ( (DrawX) <= (PacX41+1) && (DrawX) >= (PacX41-1)  && (DrawY) <= (PacY41+1)  && (DrawY) >= (PacY41-1) && Exist41 == 1) 
				pac41_on = 1'b1;
		  else 
				pac41_on = 1'b0;
	  end 
	 
	 always_comb
	 begin:Pac42_on_proc
		  if ( (DrawX) <= (PacX42+1) && (DrawX) >= (PacX42-1)  && (DrawY) <= (PacY42+1)  && (DrawY) >= (PacY42-1) && Exist42 == 1) 
				pac42_on = 1'b1;
		  else 
				pac42_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac43_on_proc
		  if ( (DrawX) <= (PacX43+1) && (DrawX) >= (PacX43-1)  && (DrawY) <= (PacY43+1)  && (DrawY) >= (PacY43-1) && Exist43 == 1) 
				pac43_on = 1'b1;
		  else 
				pac43_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac44_on_proc
		  if ( (DrawX) <= (PacX44+1) && (DrawX) >= (PacX44-1)  && (DrawY) <= (PacY44+1)  && (DrawY) >= (PacY44-1) && Exist44 == 1) 
				pac44_on = 1'b1;
		  else 
				pac44_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac45_on_proc
		  if ( (DrawX) <= (PacX45+1) && (DrawX) >= (PacX45-1)  && (DrawY) <= (PacY45+1)  && (DrawY) >= (PacY45-1) && Exist45 == 1) 
				pac45_on = 1'b1;
		  else 
				pac45_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac46_on_proc
		  if ( (DrawX) <= (PacX46+1) && (DrawX) >= (PacX46-1)  && (DrawY) <= (PacY46+1)  && (DrawY) >= (PacY46-1) && Exist46 == 1) 
				pac46_on = 1'b1;
		  else 
				pac46_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac47_on_proc
		  if ( (DrawX) <= (PacX47+1) && (DrawX) >= (PacX47-1)  && (DrawY) <= (PacY47+1)  && (DrawY) >= (PacY47-1) && Exist47 == 1) 
				pac47_on = 1'b1;
		  else 
				pac47_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac48_on_proc
		  if ( (DrawX) <= (PacX48+1) && (DrawX) >= (PacX48-1)  && (DrawY) <= (PacY48+1)  && (DrawY) >= (PacY48-1) && Exist48 == 1) 
				pac48_on = 1'b1;
		  else 
				pac48_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac49_on_proc
		  if ( (DrawX) <= (PacX49+1) && (DrawX) >= (PacX49-1)  && (DrawY) <= (PacY49+1)  && (DrawY) >= (PacY49-1) && Exist49 == 1) 
				pac49_on = 1'b1;
		  else 
				pac49_on = 1'b0;
	  end 
	  
	  always_comb 
	 begin:Pac50_on_proc
		  if ( (DrawX) <= (PacX50+1) && (DrawX) >= (PacX50-1)  && (DrawY) <= (PacY50+1)  && (DrawY) >= (PacY50-1) && Exist50 == 1) 
				pac50_on = 1'b1;
		  else 
				pac50_on = 1'b0;
	  end 
	  
	 always_comb
	 begin:Pac51_on_proc
		  if ( (DrawX) <= (PacX51+1) && (DrawX) >= (PacX51-1)  && (DrawY) <= (PacY51+1)  && (DrawY) >= (PacY51-1) && Exist51 == 1) 
				pac51_on = 1'b1;
		  else 
				pac51_on = 1'b0;
	  end 
	 
	 always_comb
	 begin:Pac52_on_proc
		  if ( (DrawX) <= (PacX52+1) && (DrawX) >= (PacX52-1)  && (DrawY) <= (PacY52+1)  && (DrawY) >= (PacY52-1) && Exist52 == 1) 
				pac52_on = 1'b1;
		  else 
				pac52_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac53_on_proc
		  if ( (DrawX) <= (PacX53+1) && (DrawX) >= (PacX53-1)  && (DrawY) <= (PacY53+1)  && (DrawY) >= (PacY53-1) && Exist53 == 1) 
				pac53_on = 1'b1;
		  else 
				pac53_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac54_on_proc
		  if ( (DrawX) <= (PacX54+1) && (DrawX) >= (PacX54-1)  && (DrawY) <= (PacY54+1)  && (DrawY) >= (PacY54-1) && Exist54 == 1) 
				pac54_on = 1'b1;
		  else 
				pac54_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac55_on_proc
		  if ( (DrawX) <= (PacX55+1) && (DrawX) >= (PacX55-1)  && (DrawY) <= (PacY55+1)  && (DrawY) >= (PacY55-1) && Exist55 == 1) 
				pac55_on = 1'b1;
		  else 
				pac55_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac56_on_proc
		  if ( (DrawX) <= (PacX56+1) && (DrawX) >= (PacX56-1)  && (DrawY) <= (PacY56+1)  && (DrawY) >= (PacY56-1) && Exist56 == 1) 
				pac56_on = 1'b1;
		  else 
				pac56_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac57_on_proc
		  if ( (DrawX) <= (PacX57+1) && (DrawX) >= (PacX57-1)  && (DrawY) <= (PacY57+1)  && (DrawY) >= (PacY57-1) && Exist57 == 1) 
				pac57_on = 1'b1;
		  else 
				pac57_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac58_on_proc
		  if ( (DrawX) <= (PacX58+1) && (DrawX) >= (PacX58-1)  && (DrawY) <= (PacY58+1)  && (DrawY) >= (PacY58-1) && Exist58 == 1) 
				pac58_on = 1'b1;
		  else 
				pac58_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac59_on_proc
		  if ( (DrawX) <= (PacX59+1) && (DrawX) >= (PacX59-1)  && (DrawY) <= (PacY59+1)  && (DrawY) >= (PacY59-1) && Exist59 == 1) 
				pac59_on = 1'b1;
		  else 
				pac59_on = 1'b0;
	  end 
	  
	  always_comb 
	 begin:Pac60_on_proc
		  if ( (DrawX) <= (PacX60+1) && (DrawX) >= (PacX60-1)  && (DrawY) <= (PacY60+1)  && (DrawY) >= (PacY60-1) && Exist60 == 1) 
				pac60_on = 1'b1;
		  else 
				pac60_on = 1'b0;
	  end 
	  
	 always_comb
	 begin:Pac61_on_proc
		  if ( (DrawX) <= (PacX61+1) && (DrawX) >= (PacX61-1)  && (DrawY) <= (PacY61+1)  && (DrawY) >= (PacY61-1) && Exist61 == 1) 
				pac61_on = 1'b1;
		  else 
				pac61_on = 1'b0;
	  end 
	 
	 always_comb
	 begin:Pac62_on_proc
		  if ( (DrawX) <= (PacX62+1) && (DrawX) >= (PacX62-1)  && (DrawY) <= (PacY62+1)  && (DrawY) >= (PacY62-1) && Exist62 == 1) 
				pac62_on = 1'b1;
		  else 
				pac62_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac63_on_proc
		  if ( (DrawX) <= (PacX63+1) && (DrawX) >= (PacX63-1)  && (DrawY) <= (PacY63+1)  && (DrawY) >= (PacY63-1) && Exist63 == 1) 
				pac63_on = 1'b1;
		  else 
				pac63_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac64_on_proc
		  if ( (DrawX) <= (PacX64+1) && (DrawX) >= (PacX64-1)  && (DrawY) <= (PacY64+1)  && (DrawY) >= (PacY64-1) && Exist64 == 1) 
				pac64_on = 1'b1;
		  else 
				pac64_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac65_on_proc
		  if ( (DrawX) <= (PacX65+1) && (DrawX) >= (PacX65-1)  && (DrawY) <= (PacY65+1)  && (DrawY) >= (PacY65-1) && Exist65 == 1) 
				pac65_on = 1'b1;
		  else 
				pac65_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac66_on_proc
		  if ( (DrawX) <= (PacX66+1) && (DrawX) >= (PacX66-1)  && (DrawY) <= (PacY66+1)  && (DrawY) >= (PacY66-1) && Exist66 == 1) 
				pac66_on = 1'b1;
		  else 
				pac66_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac67_on_proc
		  if ( (DrawX) <= (PacX67+1) && (DrawX) >= (PacX67-1)  && (DrawY) <= (PacY67+1)  && (DrawY) >= (PacY67-1) && Exist67 == 1) 
				pac67_on = 1'b1;
		  else 
				pac67_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac68_on_proc
		  if ( (DrawX) <= (PacX68+1) && (DrawX) >= (PacX68-1)  && (DrawY) <= (PacY68+1)  && (DrawY) >= (PacY68-1) && Exist68 == 1) 
				pac68_on = 1'b1;
		  else 
				pac68_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac69_on_proc
		  if ( (DrawX) <= (PacX69+1) && (DrawX) >= (PacX69-1)  && (DrawY) <= (PacY69+1)  && (DrawY) >= (PacY69-1) && Exist69 == 1) 
				pac69_on = 1'b1;
		  else 
				pac69_on = 1'b0;
	  end 
	  
	  always_comb 
	 begin:Pac70_on_proc
		  if ( (DrawX) <= (PacX70+1) && (DrawX) >= (PacX70-1)  && (DrawY) <= (PacY70+1)  && (DrawY) >= (PacY70-1) && Exist70 == 1) 
				pac70_on = 1'b1;
		  else 
				pac70_on = 1'b0;
	  end 
	  
	 always_comb
	 begin:Pac71_on_proc
		  if ( (DrawX) <= (PacX71+1) && (DrawX) >= (PacX71-1)  && (DrawY) <= (PacY71+1)  && (DrawY) >= (PacY71-1) && Exist71 == 1) 
				pac71_on = 1'b1;
		  else 
				pac71_on = 1'b0;
	  end 
	 
	 always_comb
	 begin:Pac72_on_proc
		  if ( (DrawX) <= (PacX72+1) && (DrawX) >= (PacX72-1)  && (DrawY) <= (PacY72+1)  && (DrawY) >= (PacY72-1) && Exist72 == 1) 
				pac72_on = 1'b1;
		  else 
				pac72_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac73_on_proc
		  if ( (DrawX) <= (PacX73+1) && (DrawX) >= (PacX73-1)  && (DrawY) <= (PacY73+1)  && (DrawY) >= (PacY73-1) && Exist73 == 1) 
				pac73_on = 1'b1;
		  else 
				pac73_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac74_on_proc
		  if ( (DrawX) <= (PacX74+1) && (DrawX) >= (PacX74-1)  && (DrawY) <= (PacY74+1)  && (DrawY) >= (PacY74-1) && Exist74 == 1) 
				pac74_on = 1'b1;
		  else 
				pac74_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac75_on_proc
		  if ( (DrawX) <= (PacX75+1) && (DrawX) >= (PacX75-1)  && (DrawY) <= (PacY75+1)  && (DrawY) >= (PacY75-1) && Exist75 == 1) 
				pac75_on = 1'b1;
		  else 
				pac75_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac76_on_proc
		  if ( (DrawX) <= (PacX76+1) && (DrawX) >= (PacX76-1)  && (DrawY) <= (PacY76+1)  && (DrawY) >= (PacY76-1) && Exist76 == 1) 
				pac76_on = 1'b1;
		  else 
				pac76_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac77_on_proc
		  if ( (DrawX) <= (PacX77+1) && (DrawX) >= (PacX77-1)  && (DrawY) <= (PacY77+1)  && (DrawY) >= (PacY77-1) && Exist77 == 1) 
				pac77_on = 1'b1;
		  else 
				pac77_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac78_on_proc
		  if ( (DrawX) <= (PacX78+1) && (DrawX) >= (PacX78-1)  && (DrawY) <= (PacY78+1)  && (DrawY) >= (PacY78-1) && Exist78 == 1) 
				pac78_on = 1'b1;
		  else 
				pac78_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Pac79_on_proc
		  if ( (DrawX) <= (PacX79+1) && (DrawX) >= (PacX79-1)  && (DrawY) <= (PacY79+1)  && (DrawY) >= (PacY79-1) && Exist79 == 1) 
				pac79_on = 1'b1;
		  else 
				pac79_on = 1'b0;
	  end 
	  
	  
	  always_comb
	 begin:Ghost0_on_proc
		  if ((DrawX) <= (ghostxsig0+ghostsizesig0) && (DrawX) >= (ghostxsig0-ghostsizesig0)  && (DrawY) <= (ghostysig0+ghostsizesig0)  && (DrawY) >= (ghostysig0-ghostsizesig0)) 
				g0_on = 1'b1;
		  else 
				g0_on = 1'b0;
	  end 
	  
	  always_comb
	 begin:Ghost1_on_proc
		  if ((DrawX) <= (ghostxsig1+ghostsizesig1) && (DrawX) >= (ghostxsig1-ghostsizesig1)  && (DrawY) <= (ghostysig1+ghostsizesig1)  && (DrawY) >= (ghostysig1-ghostsizesig1)) 
				g1_on = 1'b1;
		  else 
				g1_on = 1'b0;
	  end 
	  always_comb
	 begin:Ghost2_on_proc
		  if ((DrawX) <= (ghostxsig2+ghostsizesig2) && (DrawX) >= (ghostxsig2-ghostsizesig2)  && (DrawY) <= (ghostysig2+ghostsizesig2)  && (DrawY) >= (ghostysig2-ghostsizesig2)) 
				g2_on = 1'b1;
		  else 
				g2_on = 1'b0;
	  end 
	  always_comb
	 begin:Ghost3_on_proc
		  if ((DrawX) <= (ghostxsig3+ghostsizesig3) && (DrawX) >= (ghostxsig3-ghostsizesig3)  && (DrawY) <= (ghostysig3+ghostsizesig3)  && (DrawY) >= (ghostysig3-ghostsizesig3)) 
				g3_on = 1'b1;
		  else 
				g3_on = 1'b0;
	  end 
	  
	  //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	  //SCORE LED CODE STARTS HERE
	  // 
	 always_comb
	 begin:LED00_on_proc
		  if ( (DrawX) <= (630) && (DrawX) >= (600)  && (DrawY) <= (15)  && (DrawY) >= (5) && (!deci0[0])) 
				LED00_on = 1'b1;
		  else 
				LED00_on = 1'b0;				
	  end
	  
	  always_comb
	 begin:LED01_on_proc
		  if ( (DrawX) <= (630) && (DrawX) >= (620)  && (DrawY) <= (35)  && (DrawY) >= (5) && (!deci0[1])) 
				LED01_on = 1'b1;
		  else 
				LED01_on = 1'b0;
	  end
	  always_comb
	 begin:LED02_on_proc
		  if ( (DrawX) <= (630) && (DrawX) >= (620)  && (DrawY) <= (55)  && (DrawY) >= (25) && (!deci0[2])) 
				LED02_on = 1'b1;
		  else 
				LED02_on = 1'b0;
	  end
	  always_comb
	 begin:LED03_on_proc
		  if ( (DrawX) <= (630) && (DrawX) >= (600)  && (DrawY) <= (55)  && (DrawY) >= (45) && (!deci0[3])) 
				LED03_on = 1'b1;
		  else 
				LED03_on = 1'b0;
	  end
	  always_comb
	 begin:LED04_on_proc
		  if ( (DrawX) <= (610) && (DrawX) >= (600)  && (DrawY) <= (55)  && (DrawY) >= (25) && (!deci0[4])) 
				LED04_on = 1'b1;
		  else 
				LED04_on = 1'b0;
	  end
	  always_comb
	 begin:LED05_on_proc
		  if ( (DrawX) <= (610) && (DrawX) >= (600)  && (DrawY) <= (35)  && (DrawY) >= (5) && (!deci0[5])) 
				LED05_on = 1'b1;
		  else 
				LED05_on = 1'b0;
	  end
	  always_comb
	 begin:LED06_on_proc
		  if ( (DrawX) <= (630) && (DrawX) >= (600)  && (DrawY) <= (35)  && (DrawY) >= (25) && (!deci0[6])) 
				LED06_on = 1'b1;
		  else 
				LED06_on = 1'b0;
	  end
	  
	  always_comb
	 begin:LED10_on_proc
		  if ( (DrawX) <= (630-40) && (DrawX) >= (600-40)  && (DrawY) <= (15)  && (DrawY) >= (5) && (!deci1[0])) 
				LED10_on = 1'b1;
		  else 
				LED10_on = 1'b0;				
	  end
	  
	  always_comb
	 begin:LED11_on_proc
		  if ( (DrawX) <= (630-40) && (DrawX) >= (620-40)  && (DrawY) <= (35)  && (DrawY) >= (5) && (!deci1[1])) 
				LED11_on = 1'b1;
		  else 
				LED11_on = 1'b0;
	  end
	  always_comb
	 begin:LED12_on_proc
		  if ( (DrawX) <= (630-40) && (DrawX) >= (620-40)  && (DrawY) <= (55)  && (DrawY) >= (25) && (!deci1[2])) 
				LED12_on = 1'b1;
		  else 
				LED12_on = 1'b0;
	  end
	  always_comb
	 begin:LED13_on_proc
		  if ( (DrawX) <= (630-40) && (DrawX) >= (600-40)  && (DrawY) <= (55)  && (DrawY) >= (45) && (!deci1[3])) 
				LED13_on = 1'b1;
		  else 
				LED13_on = 1'b0;
	  end
	  always_comb
	 begin:LED14_on_proc
		  if ( (DrawX) <= (610-40) && (DrawX) >= (600-40)  && (DrawY) <= (55)  && (DrawY) >= (25) && (!deci1[4])) 
				LED14_on = 1'b1;
		  else 
				LED14_on = 1'b0;
	  end
	  always_comb
	 begin:LED15_on_proc
		  if ( (DrawX) <= (610-40) && (DrawX) >= (600-40)  && (DrawY) <= (35)  && (DrawY) >= (5) && (!deci1[5])) 
				LED15_on = 1'b1;
		  else 
				LED15_on = 1'b0;
	  end
	  always_comb
	 begin:LED16_on_proc
		  if ( (DrawX) <= (630-40) && (DrawX) >= (600-40)  && (DrawY) <= (35)  && (DrawY) >= (25) && (!deci1[6])) 
				LED16_on = 1'b1;
		  else 
				LED16_on = 1'b0;
	  end
	  
	  
	  
	  //score led code end here
	  always_comb
	 begin:Outside_Wall
		  if ((DrawX) <= (120) && (DrawX) >= (120-Ball_size)  && (DrawY) <= (440+Ball_size)  && (DrawY) >= (40-Ball_size)) 
				outwall_on = 1'b1;
		  else if ((DrawX) <= (520+Ball_size) && (DrawX) >= (120-Ball_size)  && (DrawY) <= (440+Ball_size)  && (DrawY) >= (440)) 
				outwall_on = 1'b1;
		  else if ((DrawX) <= (520+Ball_size) && (DrawX) >= (520)  && (DrawY) <= (440+Ball_size)  && (DrawY) >= (40-Ball_size)) 
				outwall_on = 1'b1;
		  else if ((DrawX) <= (520+Ball_size) && (DrawX) >= (120-Ball_size)  && (DrawY) <= (40)  && (DrawY) >= (40-Ball_size)) 
				outwall_on = 1'b1;
		  else 
				outwall_on = 1'b0;
	  end  
	  
// Display HERE   
    always_comb
    begin:RGB_Display
        if (ball_on == 1'b1 && mouth_on == 1'b0) 
        begin 
            Red = 8'hff;
            Green = 8'hff;
            Blue = 8'h00;
        end
		  else if (g0_on)
		  begin 
				Red = 8'hFF;
				Green = 8'h7F;
				Blue = 8'h50;
		  end
		  else if (g1_on)
		  begin 
				Red = 8'hff;
				Green = 8'h45;
				Blue = 8'h00;
		  end
		  else if (g2_on)
		  begin 
				Red = 8'hff;
				Green = 8'haa;
				Blue = 8'haa;
		  end
		  else if (g3_on)
		  begin 
				Red = 8'hE1;
				Green = 8'hAD;
				Blue = 8'h01;
		  end
		  else if (pac0_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac1_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac2_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac3_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac4_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac5_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac6_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac7_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac8_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac9_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac10_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac11_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac12_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac13_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac14_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac15_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac16_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac17_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac18_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac19_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  
		  else if (pac20_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac21_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac22_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac23_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac24_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac25_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac26_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac27_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac28_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac29_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac30_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac31_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac32_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac33_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac34_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac35_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac36_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac37_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac38_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac39_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  
		  else if (pac40_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac41_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac42_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac43_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac44_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac45_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac46_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac47_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac48_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac49_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac50_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac51_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac52_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac53_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac54_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac55_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac56_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac57_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac58_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac59_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac60_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac61_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac62_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac63_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac64_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac65_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac66_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac67_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac68_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac69_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac70_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac71_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac72_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac73_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac74_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end
		  else if (pac75_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac76_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac77_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac78_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (pac79_on)
		  begin 
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'hff;
		  end 
		  else if (w4_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
		  else if (w5_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
		  else if (w6_on)
		  begin 
				Red = 8'hDE;
				Green = 8'h97;
				Blue = 8'h51;
		  end
	     else if (w7_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
	     else if (w8_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
	     else if (w9_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
	     else if (w10_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
	     else if (w11_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
	     else if (w12_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
	     else if (w13_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
	     else if (w14_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
	     else if (w15_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
	     else if (w16_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
	     else if (w17_on)
		  begin 
				Red = 8'hDE;
				Green = 8'h97;
				Blue = 8'h51;
		  end
	     else if (w18_on)
		  begin 
				Red = 8'hDE;
				Green = 8'h97;
				Blue = 8'h51;
		  end
	  	  else if (w19_on)
		  begin 
				Red = 8'hDE;
				Green = 8'h97;
				Blue = 8'h51;
		  end
		  else if (w20_on)
		  begin 
				Red = 8'hDE;
				Green = 8'h97;
				Blue = 8'h51;
		  end
		  else if (w21_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end 
		  else if (w22_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
		  else if (w23_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
		  else if (w24_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
		  else if (w25_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
		  else if (w26_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
		  else if (w27_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end	
		  else if (w28_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
		  else if (w29_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
		  else if (w30_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
		  else if (w31_on)
		  begin 
				Red = 8'hDE;
				Green = 8'h97;
				Blue = 8'h51;
		  end
		  else if (w32_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
		  else if (w33_on)
		  begin 
				Red = 8'hDE;
				Green = 8'h97;
				Blue = 8'h51;
		  end
		  else if (w34_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
		  else if (w35_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
		  else if (w36_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
		  else if (w37_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
		  else if (w38_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
		  else if (w42_on)
		  begin 
				Red = 8'hff;
				Green = 8'h5e;
				Blue = 8'h0e;
		  end
		  else if (w39_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
		  else if (w40_on)
		 begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
		  else if (w41_on)
		  begin 
				Red = 8'hf0;
				Green = 8'h61;
				Blue = 8'h05;
		  end
		  else
		  begin
		  		Red = 8'h00;
				Green = 8'h00;
				Blue = 8'h00;
		  end
		  
		  if (outwall_on)
		  begin 
				Red = 8'hDE;
				Green = 8'h97;
				Blue = 8'h51;
		  end
		  if (w0_on)
		  begin 
				Red = 8'hDE;
				Green = 8'h97;
				Blue = 8'h51;
		  end
		  if (w1_on)
		  begin 
				Red = 8'hDE;
				Green = 8'h97;
				Blue = 8'h51;
		  end
		  if (w2_on)
		  begin 
				Red = 8'hDE;
				Green = 8'h97;
				Blue = 8'h51;
		  end
		  if (w3_on)
		  begin 
				Red = 8'hDE;
				Green = 8'h97;
				Blue = 8'h51;
		  end
		  
		  
		  if (LED00_on)
		  begin 
				Red = 8'hff;
				Green = 8'h97;
				Blue = 8'h00;
		  end
		  if (LED01_on)
		  begin 
				Red = 8'hff;
				Green = 8'h97;
				Blue = 8'h00;
		  end
		  if (LED02_on)
		  begin 
				Red = 8'hff;
				Green = 8'h97;
				Blue = 8'h00;
		  end
		  if (LED03_on)
		  begin 
				Red = 8'hff;
				Green = 8'h97;
				Blue = 8'h00;
		  end
		  if (LED04_on)
		  begin 
				Red = 8'hff;
				Green = 8'h97;
				Blue = 8'h00;
		  end
		  if (LED05_on)
		  begin 
				Red = 8'hff;
				Green = 8'h97;
				Blue = 8'h00;
		  end
		  if (LED06_on)
		  begin 
				Red = 8'hff;
				Green = 8'h97;
				Blue = 8'h00;
		  end
		  if (LED10_on)
		  begin 
				Red = 8'hff;
				Green = 8'h97;
				Blue = 8'h00;
		  end
		  if (LED11_on)
		  begin 
				Red = 8'hff;
				Green = 8'h97;
				Blue = 8'h00;
		  end
		  if (LED12_on)
		  begin 
				Red = 8'hff;
				Green = 8'h97;
				Blue = 8'h00;
		  end
		  if (LED13_on)
		  begin 
				Red = 8'hff;
				Green = 8'h97;
				Blue = 8'h00;
		  end
		  if (LED14_on)
		  begin 
				Red = 8'hff;
				Green = 8'h97;
				Blue = 8'h00;
		  end
		  if (LED15_on)
		  begin 
				Red = 8'hff;
				Green = 8'h97;
				Blue = 8'h00;
		  end
		  if (LED16_on)
		  begin 
				Red = 8'hff;
				Green = 8'h97;
				Blue = 8'h00;
		  end
		  
		  end 

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
