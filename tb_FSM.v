`timescale 1us/1ns

module tb_FSM ();

reg        tb_Up_Max ;
reg        tb_Down_Max ;
reg        tb_Activate ;
reg        tb_CLK ;
reg        tb_RST;
wire       tb_Up_Motor;
wire       tb_Down_Motor;
  
  
  
////////////////// Clock Generator  ////////////////////


always #0.5 tb_CLK = !tb_CLK ;



/////////////////// DUT Instantation ///////////////////


FSM DUT_FSM (
.Up_Max(tb_Up_Max),
.Down_Max(tb_Down_Max),
.Activate(tb_Activate),
.CLK(tb_CLK),
.RST(tb_RST),
.Up_Motor(tb_Up_Motor),
.Down_Motor(tb_Down_Motor)
);




initial 
 begin
   
   $dumpfile("FSM.vcd") ;       
   $dumpvars; 
 

   tb_Activate = 1'b1;
   tb_Up_Max = 1'b0;
   tb_Down_Max = 1'b0;
   tb_CLK = 1'b0; 
 

 
 $display("Test Case 1: No Activation");
    #0.3
    tb_Activate = 1'b0;
    tb_Up_Max = 1'b1;
    tb_Down_Max = 1'b1;
	#0.7
	if(tb_Down_Motor && tb_Up_Motor != 1'b0)
		 $display ("Test Case Failed");
	else 
		 $display ("Test Case Passed");
		 
	


	
$display("Test Case 2: Open Door");
    #0.3
    tb_Activate = 1'b1;
    tb_Up_Max = 1'b0;
    tb_Down_Max = 1'b1;
	#0.7
	if(tb_Up_Motor != 1'b1)
		 $display ("Test Case Failed");
	else 
		 $display ("Test Case Passed");	     



		 
 $display("Test Case 3: Close Door");
    #0.3
	tb_Activate = 1'b1;
    tb_Up_Max = 1'b1;
    tb_Down_Max = 1'b0;
	#0.7
	if(tb_Down_Motor != 1'b1)
		 $display ("Test Case Failed");
	else 
		 $display ("Test Case Passed");
		 




$display("Test Case 4: Default");
    #0.3
	tb_Activate = 1'b1;
    tb_Up_Max = 1'b1;
    tb_Down_Max = 1'b1;
	#0.7
	if( tb_Down_Motor && tb_Up_Motor != 1'b0)
		 $display ("Test Case Failed");
	else 
		 $display ("Test Case Passed");	 
		 
		 		 
			 
	#1				 
   
   
   $finish;
   
 end


endmodule  