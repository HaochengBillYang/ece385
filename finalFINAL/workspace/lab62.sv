//-------------------------------------------------------------------------
//                                                                       --
//                                                                       --
//      For use with ECE 385 Lab 62                                       --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------
module lab62 (

      ///////// Clocks /////////
      input     MAX10_CLK1_50, 

      ///////// KEY /////////
      input    [ 1: 0]   KEY,

      ///////// SW /////////
      input    [ 9: 0]   SW,

      ///////// LEDR /////////
      output   [ 9: 0]   LEDR,

      ///////// HEX /////////
      output   [ 7: 0]   HEX0,
      output   [ 7: 0]   HEX1,
      output   [ 7: 0]   HEX2,
      output   [ 7: 0]   HEX3,
      output   [ 7: 0]   HEX4,
      output   [ 7: 0]   HEX5,

      ///////// SDRAM /////////
      output             DRAM_CLK,
      output             DRAM_CKE,
      output   [12: 0]   DRAM_ADDR,
      output   [ 1: 0]   DRAM_BA,
      inout    [15: 0]   DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_UDQM,
      output             DRAM_CS_N,
      output             DRAM_WE_N,
      output             DRAM_CAS_N,
      output             DRAM_RAS_N,

      ///////// VGA /////////
      output             VGA_HS,
      output             VGA_VS,
      output   [ 3: 0]   VGA_R,
      output   [ 3: 0]   VGA_G,
      output   [ 3: 0]   VGA_B,


      ///////// ARDUINO /////////
      inout    [15: 0]   ARDUINO_IO,
      inout              ARDUINO_RESET_N 

);




logic Reset_h, vssig, blank, sync, VGA_Clk;

//=======================================================
//  REG/WIRE declarations
//=======================================================
	logic SPI0_CS_N, SPI0_SCLK, SPI0_MISO, SPI0_MOSI, USB_GPX, USB_IRQ, USB_RST;
	logic [3:0] hex_num_4, hex_num_3, hex_num_1, hex_num_0; //4 bit input hex digits
	logic [1:0] signs;
	logic [1:0] hundreds;
	logic [9:0] drawxsig, drawysig, ballxsig, ballysig, ballsizesig, Ball_X_Motion, Ball_Y_Motion;
	logic [7:0] Red, Blue, Green;
	logic [7:0] keycode;
	//WALL SIGS
	logic [3:0] rsig;
	logic [9:0] wa0, wb0, wc0, wd0;
	logic [3:0] wr0;
	logic [9:0] wa1, wb1, wc1, wd1;
	logic [3:0] wr1;
	logic [9:0] wa2, wb2, wc2, wd2;
	logic [3:0] wr2;
	logic [9:0] wa3, wb3, wc3, wd3;
	logic [3:0] wr3;
	logic [9:0] wa4, wb4, wc4, wd4;
	logic [3:0] wr4;
	logic [9:0] wa5, wb5, wc5, wd5;
	logic [3:0] wr5;
	logic [9:0] wa6, wb6, wc6, wd6;
	logic [3:0] wr6;
	logic [9:0] wa7, wb7, wc7, wd7;
	logic [3:0] wr7;
	logic [9:0] wa8, wb8, wc8, wd8;
	logic [3:0] wr8;
	logic [9:0] wa9, wb9, wc9, wd9;
	logic [3:0] wr9;
	logic [9:0] wa10, wb10, wc10, wd10;
	logic [3:0] wr10;
	logic [9:0] wa11, wb11, wc11, wd11;
	logic [3:0] wr11;
	logic [9:0] wa12, wb12, wc12, wd12;
	logic [3:0] wr12;
	logic [9:0] wa13, wb13, wc13, wd13;
	logic [3:0] wr13;
	logic [9:0] wa14, wb14, wc14, wd14;
	logic [3:0] wr14;
	logic [9:0] wa15, wb15, wc15, wd15;
	logic [3:0] wr15;
	logic [9:0] wa16, wb16, wc16, wd16;
	logic [3:0] wr16;
	logic [9:0] wa17, wb17, wc17, wd17;
	logic [3:0] wr17;
	logic [9:0] wa18, wb18, wc18, wd18;
	logic [3:0] wr18;
	logic [9:0] wa19, wb19, wc19, wd19;
	logic [3:0] wr19;
	logic [9:0] wa20, wb20, wc20, wd20;
	logic [3:0] wr20;
	logic [9:0] wa21, wb21, wc21, wd21;
	logic [3:0] wr21;
	logic [9:0] wa22, wb22, wc22, wd22;
	logic [3:0] wr22;
	logic [9:0] wa23, wb23, wc23, wd23;
	logic [3:0] wr23;
	logic [9:0] wa24, wb24, wc24, wd24;
	logic [3:0] wr24;
	logic [9:0] wa25, wb25, wc25, wd25;
	logic [3:0] wr25;
	logic [9:0] wa26, wb26, wc26, wd26;
	logic [3:0] wr26;
	logic [9:0] wa27, wb27, wc27, wd27;
	logic [3:0] wr27;
	logic [9:0] wa28, wb28, wc28, wd28;
	logic [3:0] wr28;
	logic [9:0] wa29, wb29, wc29, wd29;
	logic [3:0] wr29;
	logic [9:0] wa30, wb30, wc30, wd30;
	logic [3:0] wr30;
	logic [9:0] wa31, wb31, wc31, wd31;
	logic [3:0] wr31;
	logic [9:0] wa32, wb32, wc32, wd32;
	logic [3:0] wr32;
	logic [9:0] wa33, wb33, wc33, wd33;
	logic [3:0] wr33;
	logic [9:0] wa34, wb34, wc34, wd34;
	logic [3:0] wr34;
	logic [9:0] wa35, wb35, wc35, wd35;
	logic [3:0] wr35;
	logic [9:0] wa36, wb36, wc36, wd36;
	logic [3:0] wr36;
	logic [9:0] wa37, wb37, wc37, wd37;
	logic [3:0] wr37;
	logic [9:0] wa38, wb38, wc38, wd38;
	logic [3:0] wr38;
	logic [9:0] wa39, wb39, wc39, wd39;
	logic [3:0] wr39;
	logic [9:0] wa40, wb40, wc40, wd40;
	logic [3:0] wr40;
	logic [9:0] wa41, wb41, wc41, wd41;
	logic [3:0] wr41;
	logic [9:0] wa42, wb42, wc42, wd42;
	logic [3:0] wr42;
	//PACSIGS
	logic [9:0] pacxsig0, pacysig0;
	logic existsig0;
	
	logic [9:0] pacxsig1, pacysig1;
	logic existsig1;
	
	logic [9:0] pacxsig2, pacysig2;
	logic existsig2;
	
	logic [9:0] pacxsig3, pacysig3;
	logic existsig3;
	
	logic [9:0] pacxsig4, pacysig4;
	logic existsig4;
	
	logic [9:0] pacxsig5, pacysig5;
	logic existsig5;
	
	logic [9:0] pacxsig6, pacysig6;
	logic existsig6;
	
	logic [9:0] pacxsig7, pacysig7;
	logic existsig7;
	
	logic [9:0] pacxsig8, pacysig8;
	logic existsig8;
	
	logic [9:0] pacxsig9, pacysig9;
	logic existsig9;
	
	logic [9:0] pacxsig10, pacysig10;
	logic existsig10;
	
	logic [9:0] pacxsig11, pacysig11;
	logic existsig11;
	
	logic [9:0] pacxsig12, pacysig12;
	logic existsig12;
	
	logic [9:0] pacxsig13, pacysig13;
	logic existsig13;
	
	logic [9:0] pacxsig14, pacysig14;
	logic existsig14;
	
	logic [9:0] pacxsig15, pacysig15;
	logic existsig15;
	
	logic [9:0] pacxsig16, pacysig16;
	logic existsig16;
	
	logic [9:0] pacxsig17, pacysig17;
	logic existsig17;
	
	logic [9:0] pacxsig18, pacysig18;
	logic existsig18;
	
	logic [9:0] pacxsig19, pacysig19;
	logic existsig19;
	
	logic [9:0] pacxsig20, pacysig20;
	logic existsig20;
	
	logic [9:0] pacxsig21, pacysig21;
	logic existsig21;
	
	logic [9:0] pacxsig22, pacysig22;
	logic existsig22;
	
	logic [9:0] pacxsig23, pacysig23;
	logic existsig23;
	
	logic [9:0] pacxsig24, pacysig24;
	logic existsig24;
	
	logic [9:0] pacxsig25, pacysig25;
	logic existsig25;
	
	logic [9:0] pacxsig26, pacysig26;
	logic existsig26;
	
	logic [9:0] pacxsig27, pacysig27;
	logic existsig27;
	
	logic [9:0] pacxsig28, pacysig28;
	logic existsig28;
	
	logic [9:0] pacxsig29, pacysig29;
	logic existsig29;
	
	logic [9:0] pacxsig30, pacysig30;
	logic existsig30;
	
	logic [9:0] pacxsig31, pacysig31;
	logic existsig31;
	
	logic [9:0] pacxsig32, pacysig32;
	logic existsig32;
	
	logic [9:0] pacxsig33, pacysig33;
	logic existsig33;
	
	logic [9:0] pacxsig34, pacysig34;
	logic existsig34;
	
	logic [9:0] pacxsig35, pacysig35;
	logic existsig35;
	
	logic [9:0] pacxsig36, pacysig36;
	logic existsig36;
	
	logic [9:0] pacxsig37, pacysig37;
	logic existsig37;
	
	logic [9:0] pacxsig38, pacysig38;
	logic existsig38;
	
	logic [9:0] pacxsig39, pacysig39;
	logic existsig39;
	
	logic [9:0] pacxsig40, pacysig40;
	logic existsig40;
	
	logic [9:0] pacxsig41, pacysig41;
	logic existsig41;
	
	logic [9:0] pacxsig42, pacysig42;
	logic existsig42;
	
	logic [9:0] pacxsig43, pacysig43;
	logic existsig43;
	
	logic [9:0] pacxsig44, pacysig44;
	logic existsig44;
	
	logic [9:0] pacxsig45, pacysig45;
	logic existsig45;
	
	logic [9:0] pacxsig46, pacysig46;
	logic existsig46;
	
	logic [9:0] pacxsig47, pacysig47;
	logic existsig47;
	
	logic [9:0] pacxsig48, pacysig48;
	logic existsig48;
	
	logic [9:0] pacxsig49, pacysig49;
	logic existsig49;
	
	logic [9:0] pacxsig50, pacysig50;
	logic existsig50;
	
	logic [9:0] pacxsig51, pacysig51;
	logic existsig51;
	
	logic [9:0] pacxsig52, pacysig52;
	logic existsig52;
	
	logic [9:0] pacxsig53, pacysig53;
	logic existsig53;
	
	logic [9:0] pacxsig54, pacysig54;
	logic existsig54;
	
	logic [9:0] pacxsig55, pacysig55;
	logic existsig55;
	
	logic [9:0] pacxsig56, pacysig56;
	logic existsig56;
	
	logic [9:0] pacxsig57, pacysig57;
	logic existsig57;
	
	logic [9:0] pacxsig58, pacysig58;
	logic existsig58;
	
	logic [9:0] pacxsig59, pacysig59;
	logic existsig59;
	
	logic [9:0] pacxsig60, pacysig60;
	logic existsig60;
	
	logic [9:0] pacxsig61, pacysig61;
	logic existsig61;
	
	logic [9:0] pacxsig62, pacysig62;
	logic existsig62;
	
	logic [9:0] pacxsig63, pacysig63;
	logic existsig63;
	
	logic [9:0] pacxsig64, pacysig64;
	logic existsig64;
	
	logic [9:0] pacxsig65, pacysig65;
	logic existsig65;
	
	logic [9:0] pacxsig66, pacysig66;
	logic existsig66;
	
	logic [9:0] pacxsig67, pacysig67;
	logic existsig67;
	
	logic [9:0] pacxsig68, pacysig68;
	logic existsig68;
	
	logic [9:0] pacxsig69, pacysig69;
	logic existsig69;
	
	logic [9:0] pacxsig70, pacysig70;
	logic existsig70;
	
	logic [9:0] pacxsig71, pacysig71;
	logic existsig71;
	
	logic [9:0] pacxsig72, pacysig72;
	logic existsig72;
	
	logic [9:0] pacxsig73, pacysig73;
	logic existsig73;
	
	logic [9:0] pacxsig74, pacysig74;
	logic existsig74;
	
	logic [9:0] pacxsig75, pacysig75;
	logic existsig75;
	
	logic [9:0] pacxsig76, pacysig76;
	logic existsig76;
	
	logic [9:0] pacxsig77, pacysig77;
	logic existsig77;
	
	logic [9:0] pacxsig78, pacysig78;
	logic existsig78;
	
	logic [9:0] pacxsig79, pacysig79;
	logic existsig79;
	
	logic [9:0] ghostxsig0, ghostysig0, ghostsizesig0, lost0;
	
	logic [9:0] ghostxsig1, ghostysig1, ghostsizesig1, lost1;
	
	logic [9:0] ghostxsig2, ghostysig2, ghostsizesig2, lost2;
	
	logic [9:0] ghostxsig3, ghostysig3, ghostsizesig3, lost3;
	
	logic [7:0] scoreval;
	
	logic [6:0] scoredis0, scoredis1;
	
	logic Lost;
	
	assign Lost = lost0 | lost1 | lost2 | lost3;
	
	
	
	
//=======================================================
//  Structural coding
//=======================================================
	assign ARDUINO_IO[10] = SPI0_CS_N;
	assign ARDUINO_IO[13] = SPI0_SCLK;
	assign ARDUINO_IO[11] = SPI0_MOSI;
	assign ARDUINO_IO[12] = 1'bZ;
	assign SPI0_MISO = ARDUINO_IO[12];
	
	assign ARDUINO_IO[9] = 1'bZ; 
	assign USB_IRQ = ARDUINO_IO[9];
		
	//Assignments specific to Circuits At Home UHS_20
	assign ARDUINO_RESET_N = USB_RST;
	assign ARDUINO_IO[7] = USB_RST;//USB reset 
	assign ARDUINO_IO[8] = 1'bZ; //this is GPX (set to input)
	assign USB_GPX = 1'b0;//GPX is not needed for standard USB host - set to 0 to prevent interrupt
	
	//Assign uSD CS to '1' to prevent uSD card from interfering with USB Host (if uSD card is plugged in)
	assign ARDUINO_IO[6] = 1'b1;
	
	//HEX drivers to convert numbers to HEX output
	HexDriver hex_driver4 (hex_num_4, HEX4[6:0]);
	assign HEX4[7] = 1'b1;
	
	HexDriver hex_driver3 (hex_num_3, HEX3[6:0]);
	assign HEX3[7] = 1'b1;
	
	HexDriver hex_driver1 (hex_num_1, HEX1[6:0]);
	assign HEX1[7] = 1'b1;
	
	HexDriver hex_driver0 (hex_num_0, HEX0[6:0]);
	assign HEX0[7] = 1'b1;
	
	//fill in the hundreds digit as well as the negative sign
	assign HEX5 = {1'b1, ~signs[1], 3'b111, ~hundreds[1], ~hundreds[1], 1'b1};
	assign HEX2 = {1'b1, ~signs[0], 3'b111, ~hundreds[0], ~hundreds[0], 1'b1};
	
	
	//Assign one button to reset
	assign {Reset_h}=(~ (KEY[0]) | Lost);

	//Our A/D converter is only 12 bit
	assign VGA_R = Red[7:4];
	assign VGA_B = Blue[7:4];
	assign VGA_G = Green[7:4];
	
	
	lab62_soc u0 (
		.clk_clk                           (MAX10_CLK1_50),  //clk.clk
		.reset_reset_n                     (1'b1),           //reset.reset_n
		.altpll_0_locked_conduit_export    (),               //altpll_0_locked_conduit.export
		.altpll_0_phasedone_conduit_export (),               //altpll_0_phasedone_conduit.export
		.altpll_0_areset_conduit_export    (),               //altpll_0_areset_conduit.export
		.key_external_connection_export    (KEY),            //key_external_connection.export

		//SDRAM
		.sdram_clk_clk(DRAM_CLK),                            //clk_sdram.clk
		.sdram_wire_addr(DRAM_ADDR),                         //sdram_wire.addr
		.sdram_wire_ba(DRAM_BA),                             //.ba
		.sdram_wire_cas_n(DRAM_CAS_N),                       //.cas_n
		.sdram_wire_cke(DRAM_CKE),                           //.cke
		.sdram_wire_cs_n(DRAM_CS_N),                         //.cs_n
		.sdram_wire_dq(DRAM_DQ),                             //.dq
		.sdram_wire_dqm({DRAM_UDQM,DRAM_LDQM}),              //.dqm
		.sdram_wire_ras_n(DRAM_RAS_N),                       //.ras_n
		.sdram_wire_we_n(DRAM_WE_N),                         //.we_n

		//USB SPI	
		.spi0_SS_n(SPI0_CS_N),
		.spi0_MOSI(SPI0_MOSI),
		.spi0_MISO(SPI0_MISO),
		.spi0_SCLK(SPI0_SCLK),
		
		//USB GPIO
		.usb_rst_export(USB_RST),
		.usb_irq_export(USB_IRQ),
		.usb_gpx_export(USB_GPX),
		
		//LEDs and HEX
		.hex_digits_export({hex_num_4, hex_num_3, hex_num_1, hex_num_0}),
		.leds_export({hundreds, signs, LEDR}),
		.keycode_export(keycode)
		
	 );
	

//instantiate a vga_controller, ball, and color_mapper here with the ports.
	 
	ball BBB(			.Reset(Reset_h), 
							.frame_clk(VGA_VS), 
							.keycode(keycode), 
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig),
							.Ball_X_Motion, 
							.Ball_Y_Motion,
							.ready(rsig),
							.scoreval
							);
							
	wall w0(				.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(120), 
							.b(40), 
							.c(150), 
							.d(230),
							.a_out(wa0),
							.b_out(wb0),
							.c_out(wc0),
							.d_out(wd0),
							.ready(wr0)
							);
							
	
	wall w1(				.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(490), 
							.b(40), 
							.c(520), 
							.d(230),
							.a_out(wa1),
							.b_out(wb1),
							.c_out(wc1),
							.d_out(wd1),
							.ready(wr1)
							);
	
	wall w2(				.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(120), 
							.b(250), 
							.c(150), 
							.d(440),
							.a_out(wa2),
							.b_out(wb2),
							.c_out(wc2),
							.d_out(wd2),
							.ready(wr2)
							);
	wall w3(				.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(490), 
							.b(250), 
							.c(520), 
							.d(440),
							.a_out(wa3),
							.b_out(wb3),
							.c_out(wc3),
							.d_out(wd3),
							.ready(wr3)
							);
	wall w4(				.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(170), 
							.b(60), 
							.c(220), 
							.d(110),
							.a_out(wa4),
							.b_out(wb4),
							.c_out(wc4),
							.d_out(wd4),
							.ready(wr4)
							);
	wall w5(				.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(240), 
							.b(60), 
							.c(290), 
							.d(110),
							.a_out(wa5),
							.b_out(wb5),
							.c_out(wc5),
							.d_out(wd5),
							.ready(wr5)
							);
	wall w6(				.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(310), 
							.b(40), 
							.c(330), 
							.d(110),
							.a_out(wa6),
							.b_out(wb6),
							.c_out(wc6),
							.d_out(wd6),
							.ready(wr6)
							);	
	wall w7(				.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(350), 
							.b(60), 
							.c(400), 
							.d(110),
							.a_out(wa7),
							.b_out(wb7),
							.c_out(wc7),
							.d_out(wd7),
							.ready(wr7)
							);	
	wall w8(				.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(420), 
							.b(60), 
							.c(470), 
							.d(110),
							.a_out(wa8),
							.b_out(wb8),
							.c_out(wc8),
							.d_out(wd8),
							.ready(wr8)
							);
	wall w9(				.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(170), 
							.b(130), 
							.c(220), 
							.d(160),
							.a_out(wa9),
							.b_out(wb9),
							.c_out(wc9),
							.d_out(wd9),
							.ready(wr9)
							);
	wall w10(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(240), 
							.b(130), 
							.c(250), 
							.d(230),
							.a_out(wa10),
							.b_out(wb10),
							.c_out(wc10),
							.d_out(wd10),
							.ready(wr10)
							);
	wall w11(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(250), 
							.b(180), 
							.c(290), 
							.d(190),
							.a_out(wa11),
							.b_out(wb11),
							.c_out(wc11),
							.d_out(wd11),
							.ready(wr11)
							);
	wall w12(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(270), 
							.b(130), 
							.c(370), 
							.d(160),
							.a_out(wa12),
							.b_out(wb12),
							.c_out(wc12),
							.d_out(wd12),
							.ready(wr12)
							);
	wall w13(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(310), 
							.b(160), 
							.c(330), 
							.d(190),
							.a_out(wa13),
							.b_out(wb13),
							.c_out(wc13),
							.d_out(wd13),
							.ready(wr13)
							);
	wall w14(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(350), 
							.b(180), 
							.c(390), 
							.d(190),
							.a_out(wa14),
							.b_out(wb14),
							.c_out(wc14),
							.d_out(wd14),
							.ready(wr14)
							);
	wall w15(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(390), 
							.b(130), 
							.c(400), 
							.d(230),
							.a_out(wa15),
							.b_out(wb15),
							.c_out(wc15),
							.d_out(wd15),
							.ready(wr15)
							);
	wall w16(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(420), 
							.b(130), 
							.c(470), 
							.d(160),
							.a_out(wa16),
							.b_out(wb16),
							.c_out(wc16),
							.d_out(wd16),
							.ready(wr16)
							);
	wall w17(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(150), 
							.b(180), 
							.c(220), 
							.d(230),
							.a_out(wa17),
							.b_out(wb17),
							.c_out(wc17),
							.d_out(wd17),
							.ready(wr17)
							);
	wall w18(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(420), 
							.b(180), 
							.c(490), 
							.d(230),
							.a_out(wa18),
							.b_out(wb18),
							.c_out(wc18),
							.d_out(wd18),
							.ready(wr18)
							);
	wall w19(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(150), 
							.b(250), 
							.c(220), 
							.d(300),
							.a_out(wa19),
							.b_out(wb19),
							.c_out(wc19),
							.d_out(wd19),
							.ready(wr19)
							);
	wall w20(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(420), 
							.b(250), 
							.c(490), 
							.d(300),
							.a_out(wa20),
							.b_out(wb20),
							.c_out(wc20),
							.d_out(wd20),
							.ready(wr20)
							);
	wall w21(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(240), 
							.b(250), 
							.c(250), 
							.d(300),
							.a_out(wa21),
							.b_out(wb21),
							.c_out(wc21),
							.d_out(wd21),
							.ready(wr21)
							);
	wall w22(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(270), 
							.b(280), 
							.c(370), 
							.d(300),
							.a_out(wa22),
							.b_out(wb22),
							.c_out(wc22),
							.d_out(wd22),
							.ready(wr22)
							);
	wall w23(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(390), 
							.b(250), 
							.c(400), 
							.d(300),
							.a_out(wa23),
							.b_out(wb23),
							.c_out(wc23),
							.d_out(wd23),
							.ready(wr23)
							);
	wall w24(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(310), 
							.b(300), 
							.c(330), 
							.d(330),
							.a_out(wa24),
							.b_out(wb24),
							.c_out(wc24),
							.d_out(wd24),
							.ready(wr24)
							);
	wall w25(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(240), 
							.b(320), 
							.c(290), 
							.d(330),
							.a_out(wa25),
							.b_out(wb25),
							.c_out(wc25),
							.d_out(wd25),
							.ready(wr25)
							);
	wall w26(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(350), 
							.b(320), 
							.c(400), 
							.d(330),
							.a_out(wa26),
							.b_out(wb26),
							.c_out(wc26),
							.d_out(wd26),
							.ready(wr26)
							);
	wall w27(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(170), 
							.b(320), 
							.c(220), 
							.d(330),
							.a_out(wa27),
							.b_out(wb27),
							.c_out(wc27),
							.d_out(wd27),
							.ready(wr27)
							);
	wall w28(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(420), 
							.b(320), 
							.c(470), 
							.d(330),
							.a_out(wa28),
							.b_out(wb28),
							.c_out(wc28),
							.d_out(wd28),
							.ready(wr28)
							);
	wall w29(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(210), 
							.b(330), 
							.c(220), 
							.d(370),
							.a_out(wa29),
							.b_out(wb29),
							.c_out(wc29),
							.d_out(wd29),
							.ready(wr29)
							);
	wall w30(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(420), 
							.b(330), 
							.c(430), 
							.d(370),
							.a_out(wa30),
							.b_out(wb30),
							.c_out(wc30),
							.d_out(wd30),
							.ready(wr30)
							);
	wall w31(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(150), 
							.b(350), 
							.c(190), 
							.d(370),
							.a_out(wa31),
							.b_out(wb31),
							.c_out(wc31),
							.d_out(wd31),
							.ready(wr31)
							);
	wall w32(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(270), 
							.b(350), 
							.c(370), 
							.d(370),
							.a_out(wa32),
							.b_out(wb32),
							.c_out(wc32),
							.d_out(wd32),
							.ready(wr32)
							);
	wall w33(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(450), 
							.b(350), 
							.c(490), 
							.d(370),
							.a_out(wa33),
							.b_out(wb33),
							.c_out(wc33),
							.d_out(wd33),
							.ready(wr33)
							);
	wall w34(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(310), 
							.b(370), 
							.c(330), 
							.d(420),
							.a_out(wa34),
							.b_out(wb34),
							.c_out(wc34),
							.d_out(wd34),
							.ready(wr34)
							);
	wall w35(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(170), 
							.b(390), 
							.c(290), 
							.d(420),
							.a_out(wa35),
							.b_out(wb35),
							.c_out(wc35),
							.d_out(wd35),
							.ready(wr35)
							);
	wall w36(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(350), 
							.b(390), 
							.c(470), 
							.d(420),
							.a_out(wa36),
							.b_out(wb36),
							.c_out(wc36),
							.d_out(wd36),
							.ready(wr36)
							);
	wall w37(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(240), 
							.b(350), 
							.c(250), 
							.d(390),
							.a_out(wa37),
							.b_out(wb37),
							.c_out(wc37),
							.d_out(wd37),
							.ready(wr37)
							);
	wall w38(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(390), 
							.b(350), 
							.c(400), 
							.d(390),
							.a_out(wa38),
							.b_out(wb38),
							.c_out(wc38),
							.d_out(wd38),
							.ready(wr38)
							);
						
	wall w39(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(270), 
							.b(250), 
							.c(370), 
							.d(260),
							.a_out(wa39),
							.b_out(wb39),
							.c_out(wc39),
							.d_out(wd39),
							.ready(wr39)
							);
	wall w40(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(270), 
							.b(210), 
							.c(280), 
							.d(250),
							.a_out(wa40),
							.b_out(wb40),
							.c_out(wc40),
							.d_out(wd40),
							.ready(wr40)
							);	
	wall w41(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.a(360), 
							.b(210), 
							.c(370), 
							.d(250),
							.a_out(wa41),
							.b_out(wb41),
							.c_out(wc41),
							.d_out(wd41),
							.ready(wr41)
							);	
	door w42(			.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.Reset(Reset_h), 
							.frame_clk(VGA_VS), 
							.a(280), 
							.b(210), 
							.c(360), 
							.d(214),
							.a_out(wa42),
							.b_out(wb42),
							.c_out(wc42),
							.d_out(wd42),
							.ready(wr42)
							);			
	wallbus wallBUS(	.r0(wr0),
							.r1(wr1),
							.r2(wr2),
							.r3(wr3),
							.r4(wr4),
							.r5(wr5),
							.r6(wr6),
							.r7(wr7),
							.r8(wr8),
							.r9(wr9),
							.r10(wr10),
							.r11(wr11),
							.r12(wr12),
							.r13(wr13),
							.r14(wr14),
							.r15(wr15),
							.r16(wr16),
							.r17(wr17),
							.r18(wr18),
							.r19(wr19),
							.r20(wr20),
							.r21(wr21),
							.r22(wr22),
							.r23(wr23),
							.r24(wr24),
							.r25(wr25),
							.r26(wr26),
							.r27(wr27),
							.r28(wr28),
							.r29(wr29),
							.r30(wr30),
							.r31(wr31),
							.r32(wr32),
							.r33(wr33),
							.r34(wr34),
							.r35(wr35),
							.r36(wr36),
							.r37(wr37),
							.r38(wr38),
							.r39(wr39),
							.r40(wr40),
							.r41(wr41),
							.r42(wr42),
							.r(rsig),
							);
							
// PAC MODULES HERE	
	pac p0(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(160),
							.PacY(50),
							.PacX_out(pacxsig0),
							.PacY_out(pacysig0),
							.Exists(existsig0)
							);
							
	pac p1(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(190),
							.PacY(50),
							.PacX_out(pacxsig1),
							.PacY_out(pacysig1),
							.Exists(existsig1)
							);
							
	pac p2(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(230),
							.PacY(50),
							.PacX_out(pacxsig2),
							.PacY_out(pacysig2),
							.Exists(existsig2)
							);
							
	pac p3(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(270),
							.PacY(50),
							.PacX_out(pacxsig3),
							.PacY_out(pacysig3),
							.Exists(existsig3)
							);						
	
	pac p4(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(300),
						.PacY(50),
						.PacX_out(pacxsig4),
						.PacY_out(pacysig4),
						.Exists(existsig4)
						);
						// hori 1st row
	
	pac p5(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(300),
						.PacY(80),
						.PacX_out(pacxsig5),
						.PacY_out(pacysig5),
						.Exists(existsig5)
						);
	
	pac p6(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(160),
						.PacY(80),
						.PacX_out(pacxsig6),
						.PacY_out(pacysig6),
						.Exists(existsig6)
						);
						
	pac p7(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(300),
						.PacY(120),
						.PacX_out(pacxsig7),
						.PacY_out(pacysig7),
						.Exists(existsig7)
						);
	pac p8(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(270),
						.PacY(120),
						.PacX_out(pacxsig8),
						.PacY_out(pacysig8),
						.Exists(existsig8)
						);
	pac p9(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(230),
						.PacY(120),
						.PacX_out(pacxsig9),
						.PacY_out(pacysig9),
						.Exists(existsig9)
						);

	pac p10(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(190),
							.PacY(120),
							.PacX_out(pacxsig10),
							.PacY_out(pacysig10),
							.Exists(existsig10)
							);
							
	pac p11(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(160),
							.PacY(120),
							.PacX_out(pacxsig11),
							.PacY_out(pacysig11),
							.Exists(existsig11)
							);
							
	pac p12(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(230),
							.PacY(170),
							.PacX_out(pacxsig12),
							.PacY_out(pacysig12),
							.Exists(existsig12)
							);
							
	pac p13(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(160),
							.PacY(170),
							.PacX_out(pacxsig13),
							.PacY_out(pacysig13),
							.Exists(existsig13)
							);						
	
	pac p14(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(230),
						.PacY(280),
						.PacX_out(pacxsig14),
						.PacY_out(pacysig14),
						.Exists(existsig14)
						);
	
	pac p15(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(230),
						.PacY(200),
						.PacX_out(pacxsig15),
						.PacY_out(pacysig15),
						.Exists(existsig15)
						);
	
	pac p16(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(300),
						.PacY(170),
						.PacX_out(pacxsig16),
						.PacY_out(pacysig16),
						.Exists(existsig16)
						);
						//300, 170 here
						
	pac p17(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(270),
						.PacY(430),
						.PacX_out(pacxsig17),
						.PacY_out(pacysig17),
						.Exists(existsig17)
						);
	pac p18(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(190),
						.PacY(170),
						.PacX_out(pacxsig18),
						.PacY_out(pacysig18),
						.Exists(existsig18)
						);
							// break 1
	pac p19(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(270),
						.PacY(170),
						.PacX_out(pacxsig19),
						.PacY_out(pacysig19),
						.Exists(existsig19)
						);
	
	pac p20(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(230),
							.PacY(240),
							.PacX_out(pacxsig20),
							.PacY_out(pacysig20),
							.Exists(existsig20)
							);
							//break 2
							
	pac p21(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(270),
							.PacY(380),
							.PacX_out(pacxsig21),
							.PacY_out(pacysig21),
							.Exists(existsig21)
							);
							
	pac p22(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(230),
							.PacY(310),
							.PacX_out(pacxsig22),
							.PacY_out(pacysig22),
							.Exists(existsig22)
							);
							
	pac p23(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(160),
							.PacY(310),
							.PacX_out(pacxsig23),
							.PacY_out(pacysig23),
							.Exists(existsig23)
							);						
	
	pac p24(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(190),
						.PacY(310),
						.PacX_out(pacxsig24),
						.PacY_out(pacysig24),
						.Exists(existsig24)
						);
						
	
	pac p25(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(230),
						.PacY(340),
						.PacX_out(pacxsig25),
						.PacY_out(pacysig25),
						.Exists(existsig25)
						);

	pac p26(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(270),
						.PacY(310),
						.PacX_out(pacxsig26),
						.PacY_out(pacysig26),
						.Exists(existsig26)
						);
						
	pac p27(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(300),
						.PacY(310),
						.PacX_out(pacxsig27),
						.PacY_out(pacysig27),
						.Exists(existsig27)
						);
	pac p28(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(300),
						.PacY(340),
						.PacX_out(pacxsig28),
						.PacY_out(pacysig28),
						.Exists(existsig28)
						);
	pac p29(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(270),
						.PacY(340),
						.PacX_out(pacxsig29),
						.PacY_out(pacysig29),
						.Exists(existsig29)
						);

	pac p30(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(230),
							.PacY(380),
							.PacX_out(pacxsig30),
							.PacY_out(pacysig30),
							.Exists(existsig30)
							);
							//break 3
							
	pac p31(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(190),
							.PacY(340),
							.PacX_out(pacxsig31),
							.PacY_out(pacysig31),
							.Exists(existsig31)
							);
							
	pac p32(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(190),
							.PacY(380),
							.PacX_out(pacxsig32),
							.PacY_out(pacysig32),
							.Exists(existsig32)
							);
							
	pac p33(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(160),
							.PacY(380),
							.PacX_out(pacxsig33),
							.PacY_out(pacysig33),
							.Exists(existsig33)
							);						
	
	pac p34(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(160),
						.PacY(430),
						.PacX_out(pacxsig34),
						.PacY_out(pacysig34),
						.Exists(existsig34)
						);
	
	pac p35(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(190),
						.PacY(430),
						.PacX_out(pacxsig35),
						.PacY_out(pacysig35),
						.Exists(existsig35)
						);
	
	pac p36(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(230),
						.PacY(430),
						.PacX_out(pacxsig36),
						.PacY_out(pacysig36),
						.Exists(existsig36)
						);
						
	pac p37(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(300),
						.PacY(430),
						.PacX_out(pacxsig37),
						.PacY_out(pacysig37),
						.Exists(existsig37)
						);
	pac p38(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(300),
						.PacY(380),
						.PacX_out(pacxsig38),
						.PacY_out(pacysig38),
						.Exists(existsig38)
						);
	pac p39(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(160),
						.PacY(340),
						.PacX_out(pacxsig39),
						.PacY_out(pacysig39),
						.Exists(existsig39)
						);
						//break left half
	pac p40(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(340),
							.PacY(50),
							.PacX_out(pacxsig40),
							.PacY_out(pacysig40),
							.Exists(existsig40)
							);
							
	pac p41(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(370),
							.PacY(50),
							.PacX_out(pacxsig41),
							.PacY_out(pacysig41),
							.Exists(existsig41)
							);
							
	pac p42(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(410),
							.PacY(50),
							.PacX_out(pacxsig42),
							.PacY_out(pacysig42),
							.Exists(existsig42)
							);
							
	pac p43(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(450),
							.PacY(50),
							.PacX_out(pacxsig43),
							.PacY_out(pacysig43),
							.Exists(existsig43)
							);						
	
	pac p44(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(480),
						.PacY(50),
						.PacX_out(pacxsig44),
						.PacY_out(pacysig44),
						.Exists(existsig44)
						);
	
						//right line 1
	pac p45(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(340),
						.PacY(80),
						.PacX_out(pacxsig45),
						.PacY_out(pacysig45),
						.Exists(existsig45)
						);
	
	pac p46(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(480),
						.PacY(80),
						.PacX_out(pacxsig46),
						.PacY_out(pacysig46),
						.Exists(existsig46)
						);
						

						//right line 2
	pac p47(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(340),
						.PacY(120),
						.PacX_out(pacxsig47),
						.PacY_out(pacysig47),
						.Exists(existsig47)
						);
	pac p48(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(370),
						.PacY(120),
						.PacX_out(pacxsig48),
						.PacY_out(pacysig48),
						.Exists(existsig48)
						);
	pac p49(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(410),
						.PacY(120),
						.PacX_out(pacxsig49),
						.PacY_out(pacysig49),
						.Exists(existsig49)
						);

	pac p50(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(450),
							.PacY(120),
							.PacX_out(pacxsig50),
							.PacY_out(pacysig50),
							.Exists(existsig50)
							);
							
	pac p51(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(480),
							.PacY(120),
							.PacX_out(pacxsig51),
							.PacY_out(pacysig51),
							.Exists(existsig51)
							);
							// right line 3
							
	pac p52(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(340),
							.PacY(170),
							.PacX_out(pacxsig52),
							.PacY_out(pacysig52),
							.Exists(existsig52)
							);
							
	pac p53(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(370),
							.PacY(170),
							.PacX_out(pacxsig53),
							.PacY_out(pacysig53),
							.Exists(existsig53)
							);						
	
	pac p54(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(410),
						.PacY(170),
						.PacX_out(pacxsig54),
						.PacY_out(pacysig54),
						.Exists(existsig54)
						);
	
	pac p55(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(450),
						.PacY(170),
						.PacX_out(pacxsig55),
						.PacY_out(pacysig55),
						.Exists(existsig55)
						);
	
	pac p56(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(480),
						.PacY(170),
						.PacX_out(pacxsig56),
						.PacY_out(pacysig56),
						.Exists(existsig56)
						);
						
						//right line 4
	pac p57(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(410),
						.PacY(200),
						.PacX_out(pacxsig57),
						.PacY_out(pacysig57),
						.Exists(existsig57)
						);
						//right line 5
	pac p58(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(410),
						.PacY(240),
						.PacX_out(pacxsig58),
						.PacY_out(pacysig58),
						.Exists(existsig58)
						);
						
						//right line 6
	pac p59(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(410),
						.PacY(280),
						.PacX_out(pacxsig59),
						.PacY_out(pacysig59),
						.Exists(existsig59)
						);
						
						//right line 7
	pac p60(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(340),
							.PacY(310),
							.PacX_out(pacxsig60),
							.PacY_out(pacysig60),
							.Exists(existsig60)
							);
							
	pac p61(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(370),
							.PacY(310),
							.PacX_out(pacxsig61),
							.PacY_out(pacysig61),
							.Exists(existsig61)
							);
							
	pac p62(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(410),
							.PacY(310),
							.PacX_out(pacxsig62),
							.PacY_out(pacysig62),
							.Exists(existsig62)
							);
							
	pac p63(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(450),
							.PacY(310),
							.PacX_out(pacxsig63),
							.PacY_out(pacysig63),
							.Exists(existsig63)
							);						
	
	pac p64(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(480),
						.PacY(310),
						.PacX_out(pacxsig64),
						.PacY_out(pacysig64),
						.Exists(existsig64)
						);
						
						//right line 8
	
	pac p65(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(340),
						.PacY(340),
						.PacX_out(pacxsig65),
						.PacY_out(pacysig65),
						.Exists(existsig65)
						);
	
	pac p66(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(370),
						.PacY(340),
						.PacX_out(pacxsig66),
						.PacY_out(pacysig66),
						.Exists(existsig66)
						);
						
	pac p67(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(410),
						.PacY(340),
						.PacX_out(pacxsig67),
						.PacY_out(pacysig67),
						.Exists(existsig67)
						);
	pac p68(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(450),
						.PacY(340),
						.PacX_out(pacxsig68),
						.PacY_out(pacysig68),
						.Exists(existsig68)
						);
	pac p69(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(480),
						.PacY(340),
						.PacX_out(pacxsig69),
						.PacY_out(pacysig69),
						.Exists(existsig69)
						);
						
						//right line 9

	pac p70(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(340),
							.PacY(380),
							.PacX_out(pacxsig70),
							.PacY_out(pacysig70),
							.Exists(existsig70)
							);
							
	pac p71(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(370),
							.PacY(380),
							.PacX_out(pacxsig71),
							.PacY_out(pacysig71),
							.Exists(existsig71)
							);
							
	pac p72(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(410),
							.PacY(380),
							.PacX_out(pacxsig72),
							.PacY_out(pacysig72),
							.Exists(existsig72)
							);
							
	pac p73(				.Reset(Reset_h), 
							.frame_clk(VGA_VS),  
							.BallX(ballxsig), 
							.BallY(ballysig), 
							.BallS(ballsizesig), 
							.PacX(450),
							.PacY(380),
							.PacX_out(pacxsig73),
							.PacY_out(pacysig73),
							.Exists(existsig73)
							);						
	
	pac p74(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(480),
						.PacY(380),
						.PacX_out(pacxsig74),
						.PacY_out(pacysig74),
						.Exists(existsig74)
						);
						
						//right line 10
	
	pac p75(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(340),
						.PacY(430),
						.PacX_out(pacxsig75),
						.PacY_out(pacysig75),
						.Exists(existsig75)
						);
	
	pac p76(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(370),
						.PacY(430),
						.PacX_out(pacxsig76),
						.PacY_out(pacysig76),
						.Exists(existsig76)
						);
						
	pac p77(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(410),
						.PacY(430),
						.PacX_out(pacxsig77),
						.PacY_out(pacysig77),
						.Exists(existsig77)
						);
	pac p78(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(450),
						.PacY(430),
						.PacX_out(pacxsig78),
						.PacY_out(pacysig78),
						.Exists(existsig78)
						);
	pac p79(				.Reset(Reset_h), 
						.frame_clk(VGA_VS),  
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.BallS(ballsizesig), 
						.PacX(480),
						.PacY(430),
						.PacX_out(pacxsig79),
						.PacY_out(pacysig79),
						.Exists(existsig79)
						);
						
	score s(.*);				
	vga_controller vga_ctrl(	.Clk(MAX10_CLK1_50),       
										  .Reset(Reset_h),     
										  .hs(VGA_HS),        
										  .vs(VGA_VS),        
										  .pixel_clk(VGA_Clk), 
										  .blank,     
										  .sync,      
										  .DrawX(drawxsig),     
										  .DrawY(drawysig) );   
	
	color_mapper clr_map(
						.Clk(MAX10_CLK1_50),
						.BallX(ballxsig), 
						.BallY(ballysig), 
						.DrawX(drawxsig), 
						.DrawY(drawysig), 
						.Ball_size(ballsizesig),
						.Ball_X_Motion, 
						.Ball_Y_Motion,
                  .Red, 
						.Green, 
						.Blue,
						.PacX0(pacxsig0),
						.PacY0(pacysig0),
						.Exist0(existsig0),
						.PacX1(pacxsig1),
						.PacY1(pacysig1),
						.Exist1(existsig1),
						.PacX2(pacxsig2),
						.PacY2(pacysig2),
						.Exist2(existsig2),
						.PacX3(pacxsig3),
						.PacY3(pacysig3),
						.Exist3(existsig3),
						.PacX4(pacxsig4),
						.PacY4(pacysig4),
						.Exist4(existsig4),
						.PacX5(pacxsig5),
						.PacY5(pacysig5),
						.Exist5(existsig5),
						.PacX6(pacxsig6),
						.PacY6(pacysig6),
						.Exist6(existsig6),
						.PacX7(pacxsig7),
						.PacY7(pacysig7),
						.Exist7(existsig7),
						.PacX8(pacxsig8),
						.PacY8(pacysig8),
						.Exist8(existsig8),
						.PacX9(pacxsig9),
						.PacY9(pacysig9),
						.Exist9(existsig9),
						.PacX10(pacxsig10),
						.PacY10(pacysig10),
						.Exist10(existsig10),
						.PacX11(pacxsig11),
						.PacY11(pacysig11),
						.Exist11(existsig11),
						.PacX12(pacxsig12),
						.PacY12(pacysig12),
						.Exist12(existsig12),
						.PacX13(pacxsig13),
						.PacY13(pacysig13),
						.Exist13(existsig13),
						.PacX14(pacxsig14),
						.PacY14(pacysig14),
						.Exist14(existsig14),
						.PacX15(pacxsig15),
						.PacY15(pacysig15),
						.Exist15(existsig15),
						.PacX16(pacxsig16),
						.PacY16(pacysig16),
						.Exist16(existsig16),
						.PacX17(pacxsig17),
						.PacY17(pacysig17),
						.Exist17(existsig17),
						.PacX18(pacxsig18),
						.PacY18(pacysig18),
						.Exist18(existsig18),
						.PacX19(pacxsig19),
						.PacY19(pacysig19),
						.Exist19(existsig19),
						.PacX20(pacxsig20),
						.PacY20(pacysig20),
						.Exist20(existsig20),
						.PacX21(pacxsig21),
						.PacY21(pacysig21),
						.Exist21(existsig21),
						.PacX22(pacxsig22),
						.PacY22(pacysig22),
						.Exist22(existsig22),
						.PacX23(pacxsig23),
						.PacY23(pacysig23),
						.Exist23(existsig23),
						.PacX24(pacxsig24),
						.PacY24(pacysig24),
						.Exist24(existsig24),
						.PacX25(pacxsig25),
						.PacY25(pacysig25),
						.Exist25(existsig25),
						.PacX26(pacxsig26),
						.PacY26(pacysig26),
						.Exist26(existsig26),
						.PacX27(pacxsig27),
						.PacY27(pacysig27),
						.Exist27(existsig27),
						.PacX28(pacxsig28),
						.PacY28(pacysig28),
						.Exist28(existsig28),
						.PacX29(pacxsig29),
						.PacY29(pacysig29),
						.Exist29(existsig29),
						.PacX30(pacxsig30),
						.PacY30(pacysig30),
						.Exist30(existsig30),
						.PacX31(pacxsig31),
						.PacY31(pacysig31),
						.Exist31(existsig31),
						.PacX32(pacxsig32),
						.PacY32(pacysig32),
						.Exist32(existsig32),
						.PacX33(pacxsig33),
						.PacY33(pacysig33),
						.Exist33(existsig33),
						.PacX34(pacxsig34),
						.PacY34(pacysig34),
						.Exist34(existsig34),
						.PacX35(pacxsig35),
						.PacY35(pacysig35),
						.Exist35(existsig35),
						.PacX36(pacxsig36),
						.PacY36(pacysig36),
						.Exist36(existsig36),
						.PacX37(pacxsig37),
						.PacY37(pacysig37),
						.Exist37(existsig37),
						.PacX38(pacxsig38),
						.PacY38(pacysig38),
						.Exist38(existsig38),
						.PacX39(pacxsig39),
						.PacY39(pacysig39),
						.Exist39(existsig39),
						.PacX40(pacxsig40),
						.PacY40(pacysig40),
						.Exist40(existsig40),
						.PacX41(pacxsig41),
						.PacY41(pacysig41),
						.Exist41(existsig41),
						.PacX42(pacxsig42),
						.PacY42(pacysig42),
						.Exist42(existsig42),
						.PacX43(pacxsig43),
						.PacY43(pacysig43),
						.Exist43(existsig43),
						.PacX44(pacxsig44),
						.PacY44(pacysig44),
						.Exist44(existsig44),
						.PacX45(pacxsig45),
						.PacY45(pacysig45),
						.Exist45(existsig45),
						.PacX46(pacxsig46),
						.PacY46(pacysig46),
						.Exist46(existsig46),
						.PacX47(pacxsig47),
						.PacY47(pacysig47),
						.Exist47(existsig47),
						.PacX48(pacxsig48),
						.PacY48(pacysig48),
						.Exist48(existsig48),
						.PacX49(pacxsig49),
						.PacY49(pacysig49),
						.Exist49(existsig49),
						.PacX50(pacxsig50),
						.PacY50(pacysig50),
						.Exist50(existsig50),
						.PacX51(pacxsig51),
						.PacY51(pacysig51),
						.Exist51(existsig51),
						.PacX52(pacxsig52),
						.PacY52(pacysig52),
						.Exist52(existsig52),
						.PacX53(pacxsig53),
						.PacY53(pacysig53),
						.Exist53(existsig53),
						.PacX54(pacxsig54),
						.PacY54(pacysig54),
						.Exist54(existsig54),
						.PacX55(pacxsig55),
						.PacY55(pacysig55),
						.Exist55(existsig55),
						.PacX56(pacxsig56),
						.PacY56(pacysig56),
						.Exist56(existsig56),
						.PacX57(pacxsig57),
						.PacY57(pacysig57),
						.Exist57(existsig57),
						.PacX58(pacxsig58),
						.PacY58(pacysig58),
						.Exist58(existsig58),
						.PacX59(pacxsig59),
						.PacY59(pacysig59),
						.Exist59(existsig59),
						.PacX60(pacxsig60),
						.PacY60(pacysig60),
						.Exist60(existsig60),
						.PacX61(pacxsig61),
						.PacY61(pacysig61),
						.Exist61(existsig61),
						.PacX62(pacxsig62),
						.PacY62(pacysig62),
						.Exist62(existsig62),
						.PacX63(pacxsig63),
						.PacY63(pacysig63),
						.Exist63(existsig63),
						.PacX64(pacxsig64),
						.PacY64(pacysig64),
						.Exist64(existsig64),
						.PacX65(pacxsig65),
						.PacY65(pacysig65),
						.Exist65(existsig65),
						.PacX66(pacxsig66),
						.PacY66(pacysig66),
						.Exist66(existsig66),
						.PacX67(pacxsig67),
						.PacY67(pacysig67),
						.Exist67(existsig67),
						.PacX68(pacxsig68),
						.PacY68(pacysig68),
						.Exist68(existsig68),
						.PacX69(pacxsig69),
						.PacY69(pacysig69),
						.Exist69(existsig69),
						.PacX70(pacxsig70),
						.PacY70(pacysig70),
						.Exist70(existsig70),
						.PacX71(pacxsig71),
						.PacY71(pacysig71),
						.Exist71(existsig71),
						.PacX72(pacxsig72),
						.PacY72(pacysig72),
						.Exist72(existsig72),
						.PacX73(pacxsig73),
						.PacY73(pacysig73),
						.Exist73(existsig73),
						.PacX74(pacxsig74),
						.PacY74(pacysig74),
						.Exist74(existsig74),
						.PacX75(pacxsig75),
						.PacY75(pacysig75),
						.Exist75(existsig75),
						.PacX76(pacxsig76),
						.PacY76(pacysig76),
						.Exist76(existsig76),
						.PacX77(pacxsig77),
						.PacY77(pacysig77),
						.Exist77(existsig77),
						.PacX78(pacxsig78),
						.PacY78(pacysig78),
						.Exist78(existsig78),
						.PacX79(pacxsig79),
						.PacY79(pacysig79),
						.Exist79(existsig79),

						.wa0, 
						.wb0, 
						.wc0, 
						.wd0,
						.wa1, 
						.wb1, 
						.wc1, 
						.wd1,
						.wa2, 
						.wb2, 
						.wc2, 
						.wd2,
						.wa3, 
						.wb3, 
						.wc3, 
						.wd3,
						.wa4, 
						.wb4, 
						.wc4, 
						.wd4,
						.wa5, 
						.wb5, 
						.wc5, 
						.wd5,
						.wa6, 
						.wb6, 
						.wc6, 
						.wd6,
                  .wa7, 
						.wb7, 
						.wc7, 
						.wd7,
						.wa8, 
						.wb8, 
						.wc8, 
						.wd8,
						.wa9, 
						.wb9, 
						.wc9, 
						.wd9,
						.wa10, 
						.wb10, 
						.wc10, 
						.wd10,
						.wa11, 
						.wb11, 
						.wc11, 
						.wd11,
						.wa12, 
						.wb12, 
						.wc12, 
						.wd12,
						.wa13, 
						.wb13, 
						.wc13, 
						.wd13,
						.wa14, 
						.wb14, 
						.wc14, 
						.wd14,
						.wa15, 
						.wb15, 
						.wc15, 
						.wd15,
						.wa16, 
						.wb16, 
						.wc16, 
						.wd16,
						.wa17, 
						.wb17, 
						.wc17, 
						.wd17,
						.wa18, 
						.wb18, 
						.wc18, 
						.wd18,
						.wa19, 
						.wb19, 
						.wc19, 
						.wd19,
						.wa20, 
						.wb20, 
						.wc20, 
						.wd20,
						.wa21, 
						.wb21, 
						.wc21, 
						.wd21,
						.wa22, 
						.wb22, 
						.wc22, 
						.wd22,
						.wa23, 
						.wb23, 
						.wc23, 
						.wd23,
						.wa24, 
						.wb24, 
						.wc24, 
						.wd24,
						.wa25, 
						.wb25, 
						.wc25, 
						.wd25,
						.wa26, 
						.wb26, 
						.wc26, 
						.wd26,
						.wa27, 
						.wb27, 
						.wc27, 
						.wd27,
						.wa28, 
						.wb28, 
						.wc28, 
						.wd28,
						.wa29, 
						.wb29, 
						.wc29, 
						.wd29,
						.wa30, 
						.wb30, 
						.wc30, 
						.wd30,
						.wa31, 
						.wb31, 
						.wc31, 
						.wd31,
						.wa32, 
						.wb32, 
						.wc32, 
						.wd32,
						.wa33, 
						.wb33, 
						.wc33, 
						.wd33,
						.wa34, 
						.wb34, 
						.wc34, 
						.wd34,
						.wa35, 
						.wb35, 
						.wc35, 
						.wd35,
						.wa36, 
						.wb36, 
						.wc36, 
						.wd36,
						.wa37, 
						.wb37, 
						.wc37, 
						.wd37,
						.wa38, 
						.wb38, 
						.wc38, 
						.wd38,
						.wa39, 
						.wb39, 
						.wc39, 
						.wd39,
						.wa40, 
						.wb40, 
						.wc40, 
						.wd40,
						.wa41, 
						.wb41, 
						.wc41, 
						.wd41,
						.wa42, 
						.wb42, 
						.wc42, 
						.wd42,
						.deci0(scoredis0),
						.deci1(scoredis1),
						.ghostxsig0,
						.ghostysig0,
						.ghostsizesig0,
						.ghostxsig1,
						.ghostysig1,
						.ghostsizesig1,
						.ghostxsig2,
						.ghostysig2,
						.ghostsizesig2,
						.ghostxsig3,
						.ghostysig3,
						.ghostsizesig3,
						);
						
	ghost0 red( .Reset(Reset_h), .frame_clk(VGA_VS), .BallX(ballxsig), .BallY(ballysig), .BallS(ballsizesig),
					.SpawnX(162),  .SpawnY(50),
					.Powerup(1'b0), 
					.GhostX(ghostxsig0), 
					.GhostY(ghostysig0), 
					.GhostS(ghostsizesig0),
					.Lost(lost0)
					);
	
	ghost1 green( .Reset(Reset_h), .frame_clk(VGA_VS), .BallX(ballxsig), .BallY(ballysig), .BallS(ballsizesig),
				.SpawnX(342),  .SpawnY(50),
				.Powerup(1'b0), 
				.GhostX(ghostxsig1), 
				.GhostY(ghostysig1), 
				.GhostS(ghostsizesig1),
				.Lost(lost1)
				);
			
	ghost2 blue( .Reset(Reset_h), .frame_clk(VGA_VS), .BallX(ballxsig), .BallY(ballysig), .BallS(ballsizesig),
				.SpawnX(230),  .SpawnY(120),
				.Powerup(1'b0), 
				.GhostX(ghostxsig2), 
				.GhostY(ghostysig2), 
				.GhostS(ghostsizesig2),
				.Lost(lost2)
				);
		
	ghost3 grey( .Reset(Reset_h), .frame_clk(VGA_VS), .BallX(ballxsig), .BallY(ballysig), .BallS(ballsizesig),
				.SpawnX(260),  .SpawnY(200),
				.Powerup(1'b0), 
				.GhostX(ghostxsig3), 
				.GhostY(ghostysig3), 
				.GhostS(ghostsizesig3),
				.Lost(lost3)
				);
				
	decidriver decidriver (   .In0 (scoreval) , .Out0 (scoredis0) , .Out1(scoredis1) );
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
