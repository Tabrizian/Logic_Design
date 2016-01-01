module sequence_detector(x,CLK,RST,y);
  input x,RST,CLK;
  output y;
  reg y;
  parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b11;
  reg [1:0] Prstate,Nxtstate;
  always @(posedge CLK or negedge RST)
    if(~RST) Prstate = S0;
    else Prstate = Nxtstate;
  always @ (Prstate or x)     //Determine next state
         case (Prstate)
            S0: if (x) Nxtstate = S1;
                  else Nxtstate = S0;
            S1: if (x) Nxtstate = S1;  
                  else Nxtstate = S2;
            S2: if (x) Nxtstate = S1;
                  else Nxtstate = S2;
         endcase
   always @ (Prstate or x)     //Evaluate output
         case (Prstate)
            S0: y = 0;
            S1: y = 0;
            S2: if (x) y = 1'b1; else y = 1'b0;
         endcase
endmodule

module test_seq_detector;
  reg x,CLK,RST;  //inputs for circuit
  wire y;    //output from circuit
  sequence_detector TC (x,CLK,RST,y);  // instantiate circuit
  initial
     begin
         RST = 0;
         CLK = 0;
      #5 RST = 1; 
         repeat (16)
      #5 CLK = ~CLK;
     end
  initial
     begin
          x = 0;
      #15 x = 1;
          repeat (8)
      #10 x = ~ x;       
     end

endmodule