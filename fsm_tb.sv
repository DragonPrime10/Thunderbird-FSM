`timescale 1ns / 1ps
module stimulus ();

   logic  clk;
   logic  a;
   logic  b;
   logic  reset;
   
   logic Lc;
   logic Lb;
   logic La;
   logic Ra;
   logic Rb;
   logic Rc;
   
   integer handle3;
   integer desc3;
   
   // Instantiate DUT
   FSM dut (clk, reset, a, b, Lc, Lb, La, Ra, Rb, Rc);   
   
   // Setup the clock to toggle every 1 time units 
   initial 
     begin	
	clk = 1'b1;
	forever #5 clk = ~clk;
     end

   initial
     begin
	// Gives output file name
	handle3 = $fopen("fsm.out");
	// Tells when to finish simulation
	#500 $finish;		
     end

   always 
     begin
	desc3 = handle3;
	#5 $fdisplay(desc3, "%b %b %b || %b %b %b %b %b%b", 
		     reset, a, b, Lc, Lb, La, Ra, Rb, Rc);
     end   
   
   initial 
     begin      
	#0   reset = 1'b1;
	#20  reset = 1'b0;	
	#0   a = 1'b0;
	#0  b = 1'b0;
	
	#10 a = 1'b1;
	#10 b = 1'b1;
	#10 a = 1'b0;
	#10 b = 1'b0;
	
     end

endmodule // FSM_tb

