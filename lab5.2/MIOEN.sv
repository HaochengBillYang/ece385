module MIO(	input logic MIO_EN,
				input logic [15:0] MDR_In, BUS,
				output logic [15:0] MIO_out
				);
				always_comb
				begin
				unique case(MIO_EN)
				1'b0: MIO_out = BUS;
				1'b1: MIO_out = MDR_In;
				endcase
				end
				endmodule
				