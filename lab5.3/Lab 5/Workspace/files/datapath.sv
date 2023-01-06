module datapath(input logic Clk, Reset, 
					 input logic LD_REG, LD_PC, LD_MDR, LD_MAR, LD_IR, LD_BEN, LD_CC, LD_LED,
					 input logic GatePC, GateMDR, GateALU, GateMARMUX,
					 input logic [1:0] ALUK, PCMUX, ADDR2MUX,
					 input logic DRMUX, SR1MUX, SR2MUX, ADDR1MUX,
					 input logic MIO_EN,
					 input logic [15:0] MDR_In,
					 output logic [15:0] IR, PC, MAR, MDR,
					 output logic BEN,
					 output logic [9:0] LED,
					 //BELOW ARE DEBUGGING VARIABLES
					 output logic [15:0] MARMUXval, SR1MUX_Outval
					 );

					 
					 
	logic [2:0] DRMUX_Out, SR1MUX_Out;
	logic [15:0] ALU_A, ALU_B, ALU, ADDR_ADDER;
	logic [15:0] PC_1, PC_In, BUS;
	logic [15:0] SR2MUX_0;

	logic [15:0] localPC, localIR, localMAR, localMDR;
	logic [15:0] MARMUX;
	logic [15:0] M2M; //for taking value from mio mux to mdr
	
	
	//BELOW ARE DEBUGGING VARIABLES ASSIGNMENT
	assign MARMUXval = MARMUX;
	assign SR1MUX_Outval = SR1MUX_Out;
	
	
	//END DEBUGING ASSIGNMENT AREA
	
	
	
	DRMUX_			drmux			(.DRMUX,
										 .IR(localIR), 
										 .DRMUX_Out);
										 
										 
	SR1MUX_			sr1mux		(.SR1MUX, 
										 .IR(localIR), 
										 .SR1MUX_Out);		
										 
										
	REGFILE_			regfile		(.Clk, 
										 .DRMUX_Out, 
										 .SR1MUX_Out, 
										 .LD_REG, 
										 .IR(localIR), 
										 .BUS, 
										 .ALU_A, 
										 .SR2MUX_0);
										 
										 
	ALU_				alu			(.ALUK, 
										 .ALU_A, .ALU_B, 
										 .ALU);
										 
	
	PCMUX_ 			pcmux			(.PC_1, 
										 .BUS, .MARMUX, .PCMUX, 
										 .PC_In);	
										 
										 
	PC_ 				pc				(.Clk, 
										 .LD_PC, 
										 .PC_In, 
										 .PC(localPC), 
										 .Reset, 
										 .PC_1);
			

	MUX_21 			miomux		(.F_21(MIO_EN), 
										 .A_In(BUS), .B_In(MDR_In),
										 .MUX_21_OUT(M2M));
										 
			
										 
	MDR_ 				mdr			(.Clk, 
										 .LD_MDR, 
										 .MDR_In(M2M), //MDR_In need to change later on, for including MIO.EN, MDR_In should choose between BUS and data to CPU from MEM2IO, controled by MIO_EN
										 .MDR(localMDR)); 
										 
										 

										 
	MAR_ 				mar			(.Clk, 
										 .LD_MAR, 
										 .BUS, 
										 .MAR(localMAR));
										 
										 
	IR_				ir				(.Clk, 
										 .LD_IR, 
										 .BUS, 
										 .IR(localIR));
										 										 
										 
	BUS_ 				bus			(.PC(localPC), 
										 .MDR(localMDR), 
										 .ALU, 
										 .MARMUX, 
										 .GatePC, .GateALU, .GateMDR, .GateMARMUX,
										 .BUS);
										
										

										 
										 
	ADDR_ADDER_ 	addr_adder	(.ADDR2MUX, .ADDR1MUX, .SR2MUX, 
										 .PC(localPC), .IR(localIR), .SR2MUX_0, 
										 .ALU_A, .ALU_B, 
										 .MARMUX);
										 
	BEN_				ben		   (.Clk, .LD_BEN, .LD_CC, .Reset, .IR(localIR), .BUS, .BEN);

	
	//logic [15:0] PC_1, PC_In, BUS;
	// 2.22 Part 1 special setting:
	//logic [15:0] ADDR_ADDER, ALU;
	//assign ADDR_ADDER = 16'b0000000000000000;
	//assign ALU = 16'b0000000000000000;

		
	
	//PC_ pc(.Clk, .LD_PC, .PC_In, .PC, .Reset, .PC_1);
			  
	//MDR_ mdr(.Clk, .LD_MDR, .MDR_In, .MDR);
			  
	//MAR_ mar(.Clk, .LD_MAR, .BUS, .MAR);

	//IR_ ir(.Clk, .LD_IR, .BUS, .IR);

	//MIO_EN_ mio_en(.EN_MEM, .DIS_MEM, .MIO_EN, .MDR_In);
					  
	//BUS_ bus(.PC, .MDR, .ALU, .MARMUX, .GatePC, .GateALU, .GateMDR, .GateMARMUX,			.BUS);			

	//PCMUX_ pcmux(.PC_1, .BUS, .ADDR_ADDER,					  .PCMUX,					  .PC_In);	

					  
					  
					  
	always_comb begin
							MAR = localMAR;
							MDR = localMDR;
							IR  = localIR;
							PC  = localPC;
				end
				
				
				
	always_ff @(posedge Clk) begin
						 
						 if(LD_LED)
								LED <= IR[9:0];
						 else
								LED <= 10'b0;
				end

endmodule
