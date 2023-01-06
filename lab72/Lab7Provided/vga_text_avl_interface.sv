/************************************************************************
Avalon-MM Interface VGA Text mode display

Register Map:
0x000-0x0257 : VRAM, 80x30 (2400 byte, 600 word) raster order (first column then row)
0x258        : control register

VRAM Format:
X->
[ 31  30-24][ 23  22-16][ 15  14-8 ][ 7    6-0 ]
[IV3][CODE3][IV2][CODE2][IV1][CODE1][IV0][CODE0]

IVn = Draw inverse glyph
CODEn = Glyph code from IBM codepage 437

Control Register Format:
[[31-25][24-21][20-17][16-13][ 12-9][ 8-5 ][ 4-1 ][   0    ] 
[[RSVD ][FGD_R][FGD_G][FGD_B][BKG_R][BKG_G][BKG_B][RESERVED]

VSYNC signal = bit which flips on every Vsync (time for new frame), used to synchronize software
BKG_R/G/B = Background color, flipped with foreground when IVn bit is set
FGD_R/G/B = Foreground color, flipped with background when Inv bit is set

************************************************************************/
//`define NUM_REGS 601 //80*30 characters / 4 characters per register
//`define CTRL_REG 600 //index of control register

module vga_text_avl_interface (
	// Avalon Clock Input, note this clock is also used for VGA, so this must be 50Mhz
	// We can put a clock divider here in the future to make this IP more generalizable
	input logic CLK,
	
	// Avalon Reset Input
	input logic RESET,
	
	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,					// Avalon-MM Chip Select
	input  logic [3:0] AVL_BYTE_EN,			// Avalon-MM Byte Enable
	input  logic [11:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,		// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,		// Avalon-MM Read Data
	
	// Exported Conduit (mapped to VGA port - make sure you export in Platform Designer)
	output logic [3:0]  red, green, blue,	// VGA color channels (mapped to output pins in top-level)
	output logic hs, vs						// VGA HS/VS
);

//logic [31:0] LOCAL_REG       [`NUM_REGS]; // Registerslogic [10:0] n_word;

	 
//put other local variables here

logic blank, sync, VGA_Clk;
logic [9:0] drawxsig, drawysig;

		
//Self-declared variables


//Page 5: (Bit #, Address)
logic [7:0] bitNum;
logic [10:0] Address;

logic [11:0] romADDR;
logic [31:0] wordInfo;
logic [31:0] charStartPos;
logic [31:0] charEndPos;
logic [15:0] currChar;
logic [7:0]	 currData;
logic currBit;


logic [11:0] AVL_ADDR_;		
logic [31:0] AVL_WRITEDATA_;	
logic [31:0] AVL_READDATA_;	




//set the local AVL data to AVL_DATA or zero
always_comb begin
	if(AVL_CS) begin
		AVL_WRITEDATA_ = AVL_WRITEDATA;
		AVL_READDATA = AVL_READDATA_;
	
	end
	else begin
		AVL_WRITEDATA_ = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
		AVL_READDATA = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
	end

end






logic [31:0] RGB_REG_	[8];

always_ff @(posedge CLK) 
begin
	if (RESET)
		RGB_REG_ [AVL_ADDR[2:0]] <= 32'b0;
	else if (AVL_WRITE && AVL_CS && AVL_ADDR[11]) 
	begin
		RGB_REG_ [AVL_ADDR[2:0]] <= AVL_WRITEDATA;
	end
end





//Declare submodules..e.g. VGA controller, ROMS, etc
vga_controller v(.Clk(CLK),       // 50 MHz clock
                                      .Reset(RESET),     // reset signal
												  .hs(hs),        // Horizontal sync pulse.  Active low
								              .vs(vs),        // Vertical sync pulse.  Active low
												  .pixel_clk(VGA_Clk), // 25 MHz pixel clock output
												  .blank(blank),     // Blanking interval indicator.  Active low.
												  .sync(sync),      // Composite Sync signal.  Active low.  We don't use it in this lab,
												             //   but the video DAC on the DE2 board requires an input for it.
													.DrawX(drawxsig),     // horizontal coordinate
								              .DrawY(drawysig));   // vertical coordinate


		
//Note: ReDefine word: Change to 2 char per word

		
assign romADDR = (drawysig/16) * 40 + drawxsig / 16;										
	
OCM_0 on_chip_mem(
	.address_a(AVL_ADDR),
	.address_b(romADDR),
	.byteena_a(AVL_BYTE_EN),
	.byteena_b(4'b1111),
	.clock(CLK),
	.data_a(AVL_WRITEDATA_),
	.data_b(12'bxxxxxxxxxxxx),
	.rden_a(AVL_READ),
	.rden_b(1'b1),
	.wren_a(AVL_WRITE),
	.wren_b(1'b0),
	.q_a(AVL_READDATA_),
	.q_b(wordInfo));

   


//handle drawing (may either be combinational or sequential - or both).
		
	//get the n's word info
	
	
	
	//set in the OCM module
	//assign wordInfo = LOCAL_REG[(drawysig/16) * 20 + drawxsig / 32];
	
	
	assign charStartPos = 2 * ((drawxsig%16)/8 * 8);
		
	
	assign currChar = wordInfo[charStartPos +: 16];
	assign Address = drawysig - (drawysig/16)*16 + 16*currChar[15:8];
	
			 
	font_rom fr(.addr(Address),
					.data(currData)
						 );	
						 
always_comb begin						 
	
	bitNum = 7 - (drawxsig - (drawxsig/8)*8);
	currBit = currData[bitNum];				
	 	 
  end 


  
always_ff @(posedge VGA_Clk) begin

	if(blank) begin
		
		if(((currBit == 1'b0) && (currChar[15] == 1'b0)) || ((currBit == 1'b1) && (currChar[15] == 1'b1))) begin
			if(currChar[0] == 1'b0)begin
				red <= RGB_REG_[currChar[3:1]]  [12:9];
				green <= RGB_REG_[currChar[3:1]] [8:5];
				blue <= RGB_REG_[currChar[3:1]] [4:1];
			end
			else begin
				red <= RGB_REG_[currChar[3:1]] [24:21];
				green <=  RGB_REG_[currChar[3:1]] [20:17];
				blue <=  RGB_REG_[currChar[3:1]] [16:13];
			end
		end
		
		
			
		else begin
			if(currChar[4] == 1'b0)begin
				red <= RGB_REG_[currChar[7:5]]  [12:9];
				green <= RGB_REG_[currChar[7:5]] [8:5];
				blue <= RGB_REG_[currChar[7:5]] [4:1];
			end
			else begin
				red <= RGB_REG_[currChar[7:5]] [24:21];
				green <=  RGB_REG_[currChar[7:5]] [20:17];
				blue <=  RGB_REG_[currChar[7:5]] [16:13];
			end
		end
	
	end
		
	else begin
		red <= 4'h0;
		green <= 4'h0;
		blue <= 4'h0;
	end

end
	 
	 

endmodule
