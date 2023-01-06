module DECODER_(
					input logic [2:0] DECODER_In,
					input logic LD_REG,
					output logic DECODER_Out[8]);

always_comb
		begin 
			
			if(LD_REG)
			begin
			
				case(DECODER_In)
					//0
					3'b000: begin
									DECODER_Out[0] = 1'b1;
									DECODER_Out[1] = 1'b0;
									DECODER_Out[2] = 1'b0;
									DECODER_Out[3] = 1'b0;
									DECODER_Out[4] = 1'b0;
									DECODER_Out[5] = 1'b0;
									DECODER_Out[6] = 1'b0;
									DECODER_Out[7] = 1'b0;
								end
					//1
					3'b001: begin
									DECODER_Out[0] = 1'b0;
									DECODER_Out[1] = 1'b1;
									DECODER_Out[2] = 1'b0;
									DECODER_Out[3] = 1'b0;
									DECODER_Out[4] = 1'b0;
									DECODER_Out[5] = 1'b0;
									DECODER_Out[6] = 1'b0;
									DECODER_Out[7] = 1'b0;
								end
				   //2		
					3'b010: begin
									DECODER_Out[0] = 1'b0;
									DECODER_Out[1] = 1'b0;
									DECODER_Out[2] = 1'b1;
									DECODER_Out[3] = 1'b0;
									DECODER_Out[4] = 1'b0;
									DECODER_Out[5] = 1'b0;
									DECODER_Out[6] = 1'b0;
									DECODER_Out[7] = 1'b0;
								end
					//3		
					3'b011: begin
									DECODER_Out[0] = 1'b0;
									DECODER_Out[1] = 1'b0;
									DECODER_Out[2] = 1'b0;
									DECODER_Out[3] = 1'b1;
									DECODER_Out[4] = 1'b0;
									DECODER_Out[5] = 1'b0;
									DECODER_Out[6] = 1'b0;
									DECODER_Out[7] = 1'b0;
								end 
					//4		
					3'b100: begin
									DECODER_Out[0] = 1'b0;
									DECODER_Out[1] = 1'b0;
									DECODER_Out[2] = 1'b0;
									DECODER_Out[3] = 1'b0;
									DECODER_Out[4] = 1'b1;
									DECODER_Out[5] = 1'b0;
									DECODER_Out[6] = 1'b0;
									DECODER_Out[7] = 1'b0;
								end 
					//5		
					3'b101: begin
									DECODER_Out[0] = 1'b0;
									DECODER_Out[1] = 1'b0;
									DECODER_Out[2] = 1'b0;
									DECODER_Out[3] = 1'b0;
									DECODER_Out[4] = 1'b0;
									DECODER_Out[5] = 1'b1;
									DECODER_Out[6] = 1'b0;
									DECODER_Out[7] = 1'b0;
								end
					//6	
					3'b110: begin
									DECODER_Out[0] = 1'b0;
									DECODER_Out[1] = 1'b0;
									DECODER_Out[2] = 1'b0;
									DECODER_Out[3] = 1'b0;
									DECODER_Out[4] = 1'b0;
									DECODER_Out[5] = 1'b0;
									DECODER_Out[6] = 1'b1;
									DECODER_Out[7] = 1'b0;
								end 
					//7
					3'b111: begin
									DECODER_Out[0] = 1'b0;
									DECODER_Out[1] = 1'b0;
									DECODER_Out[2] = 1'b0;
									DECODER_Out[3] = 1'b0;
									DECODER_Out[4] = 1'b0;
									DECODER_Out[5] = 1'b0;
									DECODER_Out[6] = 1'b0;
									DECODER_Out[7] = 1'b1;
								end 
								
				endcase
			end
			
			else
				begin 
									DECODER_Out[0] = 1'b0;
									DECODER_Out[1] = 1'b0;
									DECODER_Out[2] = 1'b0;
									DECODER_Out[3] = 1'b0;
									DECODER_Out[4] = 1'b0;
									DECODER_Out[5] = 1'b0;
									DECODER_Out[6] = 1'b0;
									DECODER_Out[7] = 1'b0;
				end
		end

endmodule	
		  



