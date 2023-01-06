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
`define NUM_REGS 8 //80*30 characters / 4 characters per register
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

logic [31:0] LOCAL_REG       [`NUM_REGS]; // Registers
//put other local variables here
logic pixelclock, blank_bff, sync;
logic [9:0] DrawX, DrawY, Col, Row, Curr_char, Char_start; 
logic [7:0] bits;
logic [31:0] reg_data; //color_reg_data;
logic [10:0] font_addr;
logic [2:0] pixel;

//local var for lab 7.2

logic [15:0] char;
logic bitn;
logic [11:0] fgcol, bgcol;
logic [10:0] rdaddr;
logic [31:0] avl_wdata, avl_rdata;




always_comb begin
if (AVL_CS)
		begin
			 avl_wdata = AVL_WRITEDATA;
			 AVL_READDATA = avl_rdata;
		end
	else
		begin
			avl_wdata = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
		AVL_READDATA = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
		end
end

      
//Declare submodules..e.g. VGA controller, ROMS, etc
vga_controller vga_controller(.Clk(CLK), .Reset(RESET), .hs(hs), .vs(vs), .pixel_clk(pixelclock), .blank(blank_bff), .sync(sync),	.DrawX(DrawX), .DrawY(DrawY));

font_rom font_rom(.addr(font_addr), .data(bits));



assign rdaddr = (DrawY/16)*40 + DrawX/16;

 VRAM vram(
	.address_a(AVL_ADDR),.address_b(rdaddr),
	.byteena_a(AVL_BYTE_EN),.byteena_b(4'b1111),
	.clock(CLK),
	.data_a(avl_wdata),.data_b(12'bxxxxxxxxxxxx),
	.rden_a(AVL_READ),.rden_b(1'b1),
	.wren_a(AVL_WRITE),.wren_b(1'b0),
	.q_a(avl_rdata),.q_b(reg_data));

   
assign Char_Start = 2*((DrawX%16)/8*8);

assign Curr_char = reg_data [Char_Start +: 16];
assign font_addr = DrawY-(DrawY/16)*16 + 16*Curr_char[15:8];


 
//this is a 1200x32 ram, formatted as follows
//[31]  [30-27]  [26-23] [22-16]  [15]   [14-11]  [10-7]  [6-0]
//[IV2] [FGC2]   [BGC2]  [CODE2]  [IV1]  [FGC1]   [BGC1]  [CODE1]
   
// Read and write from AVL interface to register block, note that READ waitstate = 1, so this should be in always_ff
/*always_ff @(posedge CLK) begin
if(RESET)
	begin
		int i;
		for (i=0;i<601;i++)
		begin
			LOCAL_REG[i]=32'h0;
			end
end*/


/*if(AVL_CS)
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
end*/
//handle drawing (may either be combinational or sequential - or both).




//color pallete



always_ff begin
	if(AVL_WRITE && AVL_CS && AVL_ADDR[11])
		begin
			LOCAL_REG [AVL_ADDR[2:0]] <= AVL_WRITEDATA;
		end
	else if (RESET)
		begin
			LOCAL_REG [AVL_ADDR[2:0]] <= 32'b0;
		end
end


		
always_comb
	begin
		Col=DrawX[9:3];
		Row=DrawY[9:4];
		
		//rdaddr=(Col+Row*80)/2;
		
		Curr_char=(Col+Row*80);
		
		unique case (Curr_char[0])
			1'b0:
					char = reg_data [15:0];
			1'b1:
					char = reg_data [31:16];
			default: char = reg_data [15:0]; //never reach
		endcase
		
		
	
		//reg_data = LOCAL_REG[Curr_reg];
		
		/*case(Curr_char[1:0])
			2'b00:
					char = reg_data[7:0];
			2'b01: 
					char = reg_data[15:8];
			2'b10:
					char = reg_data[23:16];
			2'b11:
					char = reg_data[31:24];
			default: char= reg_data[7:0];
		endcase*/
		
		font_addr=16*char[6:0] + DrawY[3:0];
		
		pixel = 7 - DrawX[2:0];
		
		fgcol = LOCAL_REG[char [14:11]];
		
		bgcol = LOCAL_REG[char [10:7]];
		
		//color_reg_data = LOCAL_REG[`CTRL_REG];
	end
	
//always_comb begin
	
	//bitn = reg_data[7-(DrawX-(DrawX/8)*8)];

	
	
	
	//fgcol = LOCAL_REG[char [14:11]];
		
	//bgcol = LOCAL_REG[char [10:7]];
	//end
	
	
	
	
	always_ff @(posedge pixelclock)
begin
		if(blank_bff)
		begin
				if(bits[pixel]==(char[15] & 1'b1))
				begin
						red <= fgcol[11:8];
						green <= fgcol[7:4];
						blue <= fgcol[3:0];
				end
				else
				begin
						red <= bgcol[11:8];
						green <= bgcol[7:4];
						blue <= bgcol[3:0];
				end
		end
		else
		begin
				red <= 8'h00;
				green <= 8'h00;
				blue <= 8'h00;
		end
	end
	
	
/*always_ff @(posedge pixelclock) begin

	if(blank_bff) begin
		
		if(((bitn == 1'b0) && (Curr_char[15] == 1'b0)) || ((bitn == 1'b1) && (Curr_char[15] == 1'b1))) begin
			if(Curr_char[0] == 1'b0)begin
				red <= LOCAL_REG[Curr_char[3:1]]  [12:9];
				green <= LOCAL_REG[Curr_char[3:1]] [8:5];
				blue <= LOCAL_REG[Curr_char[3:1]] [4:1];
			end
			else begin
				red <=LOCAL_REG[Curr_char[3:1]] [24:21];
				green <=  LOCAL_REG[Curr_char[3:1]] [20:17];
				blue <=  LOCAL_REG[Curr_char[3:1]] [16:13];
			end
		end
		
		
			
		else begin
			if(Curr_char[4] == 1'b0)begin
				red <= LOCAL_REG[Curr_char[7:5]]  [12:9];
				green <=LOCAL_REG[Curr_char[7:5]] [8:5];
				blue <= LOCAL_REG[Curr_char[7:5]] [4:1];
			end
			else begin
				red <= LOCAL_REG[Curr_char[7:5]] [24:21];
				green <=  LOCAL_REG[Curr_char[7:5]] [20:17];
				blue <=  LOCAL_REG[Curr_char[7:5]] [16:13];
			end
		end
	
	end
		
	else begin
		red <= 4'h0;
		green <= 4'h0;
		blue <= 4'h0;
	end

end*/
	 
	 		
		
endmodule

