module FSM (input logic clk, reset, a, b, output logic Lc, Lb, La, Ra, Rb, Rc);

/*  
  input logic  clk;
   input logic  reset;
   input logic 	a;
   input logic b;
*/
   
 /*
   output logic Lc;
   output logic Lb;
   output logic La;
   output logic Ra;
   output logic Rb;
   output logic Rc;
   */

   typedef enum 	logic [3:0] {S0, S1, S2, S3, S4, S5, S6, S7} statetype;
   statetype [3:0] state, nextstate;
   
   // state register
   always_ff @(posedge clk, posedge reset)
     if (reset) state <= S0;
     else       state <= nextstate;
   
   // a = left, b = right
   // next state logic
   always_comb
     case (state)
       S0: begin
	  Lc <= 1'b0;
	  Lb <= 1'b0;
	  La <= 1'b0;
	  Ra <= 1'b0;
	  Rb <= 1'b0;
	  Rc <= 1'b0;
	  if (a==1'b1 && b==1'b0) nextstate <= S1;
	  else if (a==1'b0 && b==1'b1) nextstate <= S4;
	  else if (a==1'b1 && b==1'b1) nextstate <= S7;
	  else   nextstate <= S0;
       end
	   
       S1: begin
	  Lc <= 1'b0;
	  Lb <= 1'b0;
	  La <= 1'b1;
	  Ra <= 1'b0;
	  Rb <= 1'b0;
	  Rc <= 1'b0;	  	  
	  nextstate <= S2;
       end
	   
       S2: begin
	  Lc <= 1'b0;
	  Lb <= 1'b1;
	  La <= 1'b1;
	  Ra <= 1'b0;
	  Rb <= 1'b0;
	  Rc <= 1'b0;	  	  
	  nextstate <= S3;
       end
	   
	   S3: begin
	  Lc <= 1'b1;
	  Lb <= 1'b1;
	  La <= 1'b1;
	  Ra <= 1'b0;
	  Rb <= 1'b0;
	  Rc <= 1'b0;	  	  
	  nextstate <= S0;
       end
	   
	   S4: begin
	  Lc <= 1'b0;
	  Lb <= 1'b0;
	  La <= 1'b0;
	  Ra <= 1'b1;
	  Rb <= 1'b0;
	  Rc <= 1'b0;	  	  
	  nextstate <= S5;
       end
	   
	   S5: begin
	  Lc <= 1'b0;
	  Lb <= 1'b0;
	  La <= 1'b0;
	  Ra <= 1'b1;
	  Rb <= 1'b1;
	  Rc <= 1'b0;	  	  
	  nextstate <= S6;
       end
	   
	   S6: begin
	  Lc <= 1'b0;
	  Lb <= 1'b0;
	  La <= 1'b0;
	  Ra <= 1'b1;
	  Rb <= 1'b1;
	  Rc <= 1'b1;	  	  
	  nextstate <= S0;
       end
	   
	   S7: begin
	  Lc <= 1'b1;
	  Lb <= 1'b1;
	  La <= 1'b1;
	  Ra <= 1'b1;
	  Rb <= 1'b1;
	  Rc <= 1'b1;	  	  
	  nextstate <= S0;
       end
	
	   
       default: begin
	  Lc <= 1'b0;
	  Lb <= 1'b0;
	  La <= 1'b0;
	  Ra <= 1'b0;
	  Rb <= 1'b0;
	  Rc <= 1'b0;	  	  
	  nextstate <= S0;
       end
     endcase
   
endmodule
