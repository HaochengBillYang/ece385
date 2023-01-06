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
`define NUM_REGS 601 //80*30 characters / 4 characters per register
`define CTRL_REG 600 //index of control register

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
	input  logic [9:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,		// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,		// Avalon-MM Read Data
	
	// Exported Conduit (mapped to VGA port - make sure you export in Platform Designer)
	output logic [3:0]  red, green, blue,	// VGA color channels (mapped to output pins in top-level)
	output logic hs, vs						// VGA HS/VS
);

logic [31:0] LOCAL_REG       [`NUM_REGS]; // Registers
//put other local variables here
logic pixelclock, blank_bff, sync;
logic [9:0] DrawX, DrawY, Col, Row, Curr_reg, Curr_char;
logic [7:0] char, bits;
logic [31:0] reg_data, color_reg_data;
logic [10:0] font_addr;
logic [2:0] pixel;


      
//Declare submodules..e.g. VGA controller, ROMS, etc
vga_controller vga_controller(.Clk(CLK), .Reset(RESET), .hs(hs), .vs(vs), .pixel_clk(pixelclock), .blank(blank_bff), .sync(sync),	.DrawX(DrawX), .DrawY(DrawY));

font_rom font_rom(.addr(font_addr), .data(bits));

   
// Read and write from AVL interface to register block, note that READ waitstate = 1, so this should be in always_ff
always_ff @(posedge CLK) begin
if(AVL_CS)
	begin
	if (AVL_WRITE)
		case(AVL_BYTE_EN)
			4'b0001:
						LOCAL_REG[AVL_ADDR][7:0]=AVL_WRITEDATA[7:0];
			4'b0010:
						LOCAL_REG[AVL_ADDR][15:8]=AVL_WRITEDATA[15:8];
			4'b0100:
						LOCAL_REG[AVL_ADDR][23:16]=AVL_WRITEDATA[23:16];
			4'b1000:
						LOCAL_REG[AVL_ADDR][31:24]=AVL_WRITEDATA[31:24];
			4'b0011:
						LOCAL_REG[AVL_ADDR][15:0]=AVL_WRITEDATA[15:0];
			4'b1100:
						LOCAL_REG[AVL_ADDR][31:16]=AVL_WRITEDATA[31:16];
			4'b1111:
						LOCAL_REG[AVL_ADDR]=AVL_WRITEDATA;
			default: LOCAL_REG[AVL_ADDR]=LOCAL_REG[AVL_ADDR];
		endcase
	end
	else if (AVL_READ)
		begin
			AVL_READDATA=LOCAL_REG[AVL_ADDR];
	end
if(RESET)
	begin
		int i;
		for (i=0;i<601;i++)
		begin
			LOCAL_REG[i]=32'h0;
			end
	end
end
//handle drawing (may either be combinational or sequential - or both).
		
always_comb
begin
		Col=DrawX[9:3];
		Row=DrawY[9:4];
		
		Curr_reg=(Col+Row*80)/4;
		Curr_char=(Col+Row*80);
		reg_data = LOCAL_REG[Curr_reg];
		
		case(Curr_char[1:0])
			2'b00:
					char = reg_data[7:0];
			2'b01: 
					char = reg_data[15:8];
			2'b10:
					char = reg_data[23:16];
			2'b11:
					char = reg_data[31:24];
			default: char= reg_data[7:0];
		endcase
		
		font_addr=16*char[6:0] + DrawY[3:0];
		
		pixel = 7 - DrawX[2:0];
		
		color_reg_data = LOCAL_REG[`CTRL_REG];
		end
	
always_ff @(posedge pixelclock)
begin
		if(blank_bff)
		begin
				if(bits[pixel]==(1'b1 ^ char[7]))
				begin
						red = color_reg_data [24:21];
						green = color_reg_data[20:17];
						blue = color_reg_data [16:13];
				end
				else
				begin
						red = color_reg_data [12:9];
						green = color_reg_data [8:5];
						blue = color_reg_data [4:1];
				end
		end
		else
		begin
				red = 8'h00;
				green = 8'h00;
				blue = 8'h00;
		end
	end
	
	
		
		
endmodule

