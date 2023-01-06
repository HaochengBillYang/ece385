module score(input logic existsig0, 
								 existsig1,
								 existsig2,
								 existsig3,
								 existsig4,
								 existsig5,
								 existsig6,
								 existsig7,
								 existsig8,
								 existsig9,
								 existsig10, 
								 existsig11,
								 existsig12,
								 existsig13,
								 existsig14,
								 existsig15,
								 existsig16,
								 existsig17,
								 existsig18,
								 existsig19,
								 existsig20, 
								 existsig21,
								 existsig22,
								 existsig23,
								 existsig24,
								 existsig25,
								 existsig26,
								 existsig27,
								 existsig28,
								 existsig29,
								 existsig30, 
								 existsig31,
								 existsig32,
								 existsig33,
								 existsig34,
								 existsig35,
								 existsig36,
								 existsig37,
								 existsig38,
								 existsig39,
								 existsig40, 
								 existsig41,
								 existsig42,
								 existsig43,
								 existsig44,
								 existsig45,
								 existsig46,
								 existsig47,
								 existsig48,
								 existsig49,
								 existsig50, 
								 existsig51,
								 existsig52,
								 existsig53,
								 existsig54,
								 existsig55,
								 existsig56,
								 existsig57,
								 existsig58,
								 existsig59,
								 existsig60, 
								 existsig61,
								 existsig62,
								 existsig63,
								 existsig64,
								 existsig65,
								 existsig66,
								 existsig67,
								 existsig68,
								 existsig69,
								 existsig70, 
								 existsig71,
								 existsig72,
								 existsig73,
								 existsig74,
								 existsig75,
								 existsig76,
								 existsig77,
								 existsig78,
								 existsig79,
				 output [7:0] scoreval);
				 logic [7:0] tempnum;
				 int tempint;
				 logic [3:0] temp;
				 assign tempnum = 8'h50 - (existsig0+existsig1+existsig2+existsig3+existsig4+existsig5+existsig6+existsig7+existsig8+existsig9+
				                   existsig10+existsig11+existsig12+existsig13+existsig14+existsig15+existsig16+existsig17+existsig18+existsig19+										 
				                   existsig20+existsig21+existsig22+existsig23+existsig24+existsig25+existsig26+existsig27+existsig28+existsig29+										 
				                   existsig30+existsig31+existsig32+existsig33+existsig34+existsig35+existsig36+existsig37+existsig38+existsig39+										 
				                   existsig40+existsig41+existsig42+existsig43+existsig44+existsig45+existsig46+existsig47+existsig48+existsig49+
				                   existsig50+existsig51+existsig52+existsig53+existsig54+existsig55+existsig56+existsig57+existsig58+existsig59+
				                   existsig60+existsig61+existsig62+existsig63+existsig64+existsig65+existsig66+existsig67+existsig68+existsig69+
				                   existsig70+existsig71+existsig72+existsig73+existsig74+existsig75+existsig76+existsig77+existsig78+existsig79);
				
				assign tempint = 80 - (existsig0+existsig1+existsig2+existsig3+existsig4+existsig5+existsig6+existsig7+existsig8+existsig9+
				                   existsig10+existsig11+existsig12+existsig13+existsig14+existsig15+existsig16+existsig17+existsig18+existsig19+										 
				                   existsig20+existsig21+existsig22+existsig23+existsig24+existsig25+existsig26+existsig27+existsig28+existsig29+										 
				                   existsig30+existsig31+existsig32+existsig33+existsig34+existsig35+existsig36+existsig37+existsig38+existsig39+										 
				                   existsig40+existsig41+existsig42+existsig43+existsig44+existsig45+existsig46+existsig47+existsig48+existsig49+
				                   existsig50+existsig51+existsig52+existsig53+existsig54+existsig55+existsig56+existsig57+existsig58+existsig59+
				                   existsig60+existsig61+existsig62+existsig63+existsig64+existsig65+existsig66+existsig67+existsig68+existsig69+
				                   existsig70+existsig71+existsig72+existsig73+existsig74+existsig75+existsig76+existsig77+existsig78+existsig79);
				
				always_comb 
					begin
						if (tempnum >= 80)
						begin
							scoreval [7:4] = 4'b1000;
							scoreval [3:0] = tempint - 80;
						end
						else if (tempnum >= 70)
						begin scoreval [7:4] = 4'b0111;
							scoreval [3:0] = tempint - 70;
					end	else if (tempnum >=60)
						begin scoreval [7:4] = 4'b0110;
							scoreval [3:0] = tempint - 60;
					end	else if (tempnum>=50)
							begin scoreval [7:4] = 4'b0101;
							scoreval [3:0] = tempint - 50;
					end	else if (tempnum>=40)
						begin	scoreval [7:4] = 4'b0100;
							scoreval [3:0] = tempint - 40;
					end	else if (tempnum >= 30)
						begin	scoreval [7:4] = 4'b0011;
							scoreval [3:0] = tempint - 30;
					end	else if (tempnum >= 20)
						begin	scoreval [7:4] = 4'b0010;
							scoreval [3:0] = tempint - 20;
					end	else if (tempnum >= 10)
						begin	scoreval [7:4] = 4'b0001;
							scoreval [3:0] = tempint - 10;
					end	else
						begin	scoreval [7:4] = 4'b0000;
							scoreval [3:0] = tempint - 0;
					end
					end
				
				
				


				/*initial begin	
					for ( int i=0 ; i<tempnum;i++)
							begin
								temp = temp + 1;
								if (temp == 10 )
									temp = 0;
							end
						scoreval [3:0] = temp;
							end*/
				 
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
