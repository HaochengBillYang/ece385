module control (input  logic Clk, Reset, Execute, //Reset is Clear,Reset A, Load B
input logic [7:0] Din, 
output logic [6:0] HEX0, 
HEX1, 
HEX2, 
HEX3,
HEX4, 
HEX5,
output logic [7:0] Aval, Bval, 
output logic Xval);

logic LDA, LDX, Shift_En, A_Shift_Out, X_Shift_Out, B_Shift_out, X_useless, SUB, X_Data;


assign Xval = X_Data;


logic [7:0] A_Data;
logic [8:0] Adder_Sum;
logic [8:0] MUX_out;

//states
enum logic [4:0] {A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S}   curr_state, next_state; 
// A is HOLD, BDFHJLN is ADD, P is SUB, rest are all SHIFT

always_ff @ (posedge Clk)  
begin
if (Reset) // Reset Trigger
curr_state <= A;
else 
curr_state <= next_state;
end
always_comb
begin
next_state  = curr_state;	// State Transition Logic
case (curr_state) 
A :    if (Execute)
next_state = B;
B :    next_state = C;
C :    next_state = D;
D :    next_state = E;
E :    next_state = F;
F :    next_state = G;
G :    next_state = H;
H :    next_state = I;
I :    next_state = J;
J :    next_state = K;
K :    next_state = L;
L :    next_state = M;
M :    next_state = N;
N :    next_state = O;
O :    next_state = P;
P :    next_state = Q;
Q :    next_state = R;
R :    if (~Execute) 
next_state = A;

endcase
case (curr_state) 
A: 
begin
LDA = 1'b0;
LDX = 1'b0;
SUB = 1'b0;
Shift_En = 1'b0;
end

B: 
begin
if(Bval[0] == 1'b1)
begin
LDA = 1'b1;
LDX = 1'b1;
end
else
begin
LDA = 1'b0;
LDX = 1'b0;
end
SUB = 1'b0;
Shift_En = 1'b0;
end
D: 
begin
if(Bval[0] == 1'b1)
begin
LDA = 1'b1;
LDX = 1'b1;
end
else
begin
LDA = 1'b0;
LDX = 1'b0;
end
SUB = 1'b0;
Shift_En = 1'b0;
end
F: 
begin
if(Bval[0] == 1'b1)
begin
LDA = 1'b1;
LDX = 1'b1;
end
else
begin
LDA = 1'b0;
LDX = 1'b0;
end
SUB = 1'b0;
Shift_En = 1'b0;
end
H:
begin
if(Bval[0] == 1'b1)
begin
LDA = 1'b1;
LDX = 1'b1;
end
else
begin
LDA = 1'b0;
LDX = 1'b0;
end
SUB = 1'b0;
Shift_En = 1'b0;
end
J: 
begin
if(Bval[0] == 1'b1)
begin
LDA = 1'b1;
LDX = 1'b1;
end
else
begin
LDA = 1'b0;
LDX = 1'b0;
end
SUB = 1'b0;
Shift_En = 1'b0;
end
L:
begin
Shift_En = 1'b0;
SUB = 1'b0;
if(Bval[0] == 1'b1)
begin
LDA = 1'b1;
LDX = 1'b1;
end
else
begin
LDA = 1'b0;
LDX = 1'b0;
end
end
N:
begin
if(Bval[0] == 1'b1)
begin
LDA = 1'b1;
LDX = 1'b1;
end
else
begin
LDA = 1'b0;
LDX = 1'b0;
end
SUB = 1'b0;
Shift_En = 1'b0;
end

P:
begin
if(Bval[0] == 1'b1)
begin
LDA = 1'b1;
LDX = 1'b1;
end
else
begin
LDA = 1'b0;
LDX = 1'b0;
end
Shift_En = 1'b0;
SUB = 1'b1; 	//SUBTRACTION STATE
end

R:
begin
Shift_En = 1'b0;
SUB = 1'b0;
LDA = 1'b0;
LDX = 1'b0;
end

default:
begin 
LDA = 1'b0;
LDX = 1'b0;
SUB = 1'b0;
Shift_En = 1'b1; //SHIFT STATE
end
endcase
end

REG RX(.Clk, .Reset(Reset), .Shift_In(X_Data), .Load(LDX), 
.Shift_En, .D(Adder_Sum[8]), .Shift_Out(X_Shift_Out), .Data_Out(X_Data));

reg_8 RA(.Clk, .Reset(Reset), .Shift_In(X_Shift_Out), .Load(LDA), 
.Shift_En, .D(Adder_Sum[7:0]), .Shift_Out(A_Shift_Out), .Data_Out(A_Data));

reg_8 RB(.Clk, .Reset(1'b0), .Shift_In(A_Shift_Out), .Load(Reset), 
.Shift_En, .D(Din), .Shift_Out(B_Shift_out), .Data_Out(Bval));

multiplexer MUX(.sub(SUB), .S0(Din), .Sout(MUX_out));

ADDER9 ADDER(.S(MUX_out), .A({A_Data[7], A_Data}), .cin(SUB), .out(Adder_Sum), .X(X_useless));

assign Aval = A_Data;

HexDriver display[5:0](
.In0({Aval[7:4], Aval[3:0], Bval[7:4], Bval[3:0], Din[7:4], Din[3:0]}),
.Out0({HEX5, HEX4, HEX3, HEX2, HEX1, HEX0})
);

endmodule