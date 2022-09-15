module router ( 	input					R,
						input					[15:0] A_In,
						input 				[16:0] B_In,
						output logic		[16:0] Q_Out);
						
		// 17 bit parallel multiplexer implemeted using case statements
		always_comb
		begin
				unique case(R)
						1'b0	:	Q_Out[0] <= A_In[0];
						1'b1	:	Q_Out[0] <= B_In[0];
				endcase
		end
		
		always_comb
		begin
				unique case(R)
						1'b0	:	Q_Out[1] <= A_In[1];
						1'b1	:	Q_Out[1] <= B_In[1];
				endcase
		end
		
		always_comb
		begin
				unique case(R)
						1'b0	:	Q_Out[2] <= A_In[2];
						1'b1	:	Q_Out[2] <= B_In[2];
				endcase
		end
		
		always_comb
		begin
				unique case(R)
						1'b0	:	Q_Out[3] <= A_In[3];
						1'b1	:	Q_Out[3] <= B_In[3];
				endcase
		end
		always_comb
		begin
				unique case(R)
						1'b0	:	Q_Out[4] <= A_In[4];
						1'b1	:	Q_Out[4] <= B_In[4];
				endcase
		end
		
		always_comb
		begin
				unique case(R)
						1'b0	:	Q_Out[5] <= A_In[5];
						1'b1	:	Q_Out[5] <= B_In[5];
				endcase
		end
		
		always_comb
		begin
				unique case(R)
						1'b0	:	Q_Out[6] <= A_In[6];
						1'b1	:	Q_Out[6] <= B_In[6];
				endcase
		end
		
		always_comb
		begin
				unique case(R)
						1'b0	:	Q_Out[7] <= A_In[7];
						1'b1	:	Q_Out[7] <= B_In[7];
				endcase
		end
		always_comb
		begin
		// Routing for A'
				unique case(R)
						1'b0	:	Q_Out[8] <= A_In[8];
						1'b1	:	Q_Out[8] <= B_In[8];
				endcase
		end
		
		always_comb
		begin
				unique case(R)
						1'b0	:	Q_Out[9] <= A_In[9];
						1'b1	:	Q_Out[9] <= B_In[9];
				endcase
		end
		
		always_comb
		begin
				unique case(R)
						1'b0	:	Q_Out[10] <= A_In[10];
						1'b1	:	Q_Out[10] <= B_In[10];
				endcase
		end
		
		always_comb
		begin
				unique case(R)
						1'b0	:	Q_Out[11] <= A_In[11];
						1'b1	:	Q_Out[11] <= B_In[11];
				endcase
		end
		always_comb
		begin
				unique case(R)
						1'b0	:	Q_Out[12] <= A_In[12];
						1'b1	:	Q_Out[12] <= B_In[12];
				endcase
		end
		
		always_comb
		begin
				unique case(R)
						1'b0	:	Q_Out[13] <= A_In[13];
						1'b1	:	Q_Out[13] <= B_In[13];
				endcase
		end
		
		always_comb
		begin
				unique case(R)
						1'b0	:	Q_Out[14] <= A_In[14];
						1'b1	:	Q_Out[14] <= B_In[14];
				endcase
		end
		
		always_comb
		begin
				unique case(R)
						1'b0	:	Q_Out[15] <= A_In[15];
						1'b1	:	Q_Out[15] <= B_In[15];
				endcase
		end
		
		always_comb
		begin
				unique case(R)
						1'b0	:	Q_Out[16] <= 1'b0;
						1'b1	:	Q_Out[16] <= B_In[16];
				endcase
		end
		
endmodule