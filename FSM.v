module FSM(

		input                                                      Up_Max,
		input                                                      Down_Max,
		input                                                      Activate,
		input                                                      CLK,
		input                                                      RST,
		output             reg                                     Up_Motor,
		output             reg                                     Down_Motor

);



reg                            Current_State;
reg                            Next_State;



localparam          Idle = 2'b00,
                    Mv_Up = 2'b01,
				    Mv_Down = 2'b10;



always @ (*) 
 begin  
   
    case(Current_State)
	  
	  
	  
	        Idle : begin
			       Up_Motor = 1'b0;
				   Down_Motor = 1'b0;
				   
				   if (Activate && Down_Max && !Up_Max)
				    Next_State = Mv_Up;
					
				   else if (Activate && Up_Max && !Down_Max) 
                    Next_State = Mv_Down;
				
                   else 
                    Next_State = Idle;
                  
                   end





            Mv_Up : begin
                    Up_Motor = 1'b1;
                    Down_Motor = 1'b0;

                    if (Down_Max)
                     Next_State = Mv_Up;
 
                    else 
                     Next_State = Idle;
           
                    end
					
										
					
					
					
			Mv_Down : begin
                      Up_Motor = 1'b0;
                      Down_Motor = 1'b1;

                      
					   if (Up_Max)
                       Next_State = Mv_Down;
 
                      else 
                       Next_State = Idle;
           
                      end		
					
            default  : begin
                       Next_State = Idle;
                       end			     					
	  
    endcase
 end	
 
 
 


always @ (posedge CLK or negedge RST) 
  begin
   
    if (!RST)
	 Current_State <= Idle;
	else
     Current_State <= Next_State;
  end	 
 	
  
  
  
endmodule  
