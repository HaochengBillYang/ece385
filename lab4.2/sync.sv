module sync (
input  logic Clk, d, 
output logic q
);
always_ff @ (posedge Clk)
begin
q <= d;
end
endmodule
