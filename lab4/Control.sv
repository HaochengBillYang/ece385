//Two-always example for state machine

module control (input  logic Clk, Reset, Execute,
                output logic Shift_En, SUB, CLRA, LD);

    // Declare signals curr_state, next_state of type enum
	 
    enum logic [3:0] {A,B,C,D,E,F,G,H,I,J}   curr_state, next_state; 

	//updates flip flop, current state is the only one
    always_ff @ (posedge Clk)  
    begin
        if (Reset)
            curr_state <= A;
        else 
            curr_state <= next_state;
    end

    // Assign outputs based on state
	always_comb
    begin
        
		  next_state  = curr_state;	//required because I haven't enumerated all possibilities below
        unique case (curr_state) 

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
            J:    if (~Execute) 
                       next_state = A;
							  
        endcase
   
		  // Assign outputs based on ‘state’
        case (curr_state) 
	   	   A: // Do nothing
	         begin
                Shift_En = 1'b0;
					 LD = 1'b0;
					 SUB = 1'b0;
		      end
				I: // Clear A
	         begin
                Shift_En = 1'b1;
					 LD = 1'b1;
					 SUB = 1'b1;
				
		      end
	   	   J: // SUB and LD
		      begin
                Shift_En = 1'b0;
					 LD = 1'b0;
					 SUB = 1'b0;
		      end

				
	   	   default:  // SHIFT
		      begin 
                Shift_En = 1'b1;
					 LD = 1'b1;
					 SUB = 1'b0;
		      end
        endcase
    end

endmodule
