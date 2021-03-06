module f2_and_or(O,a,b,c,d);
  output O;
  input a,b,c,d;
  wire i1,i2,not_d;
  not #(0.5) g1(not_d,d);
  and #(0.7) g2(i1,a,b,d);
  and #(0.7) g3(i2,c,not_d);
  or #(0.9) g4(O,i1,i2);
endmodule

module f2_nand(O,a,b,c,d);
  output O;
  input a,b,c,d;
  wire i1,i2,not_d;
  nand #(0.6) g1(not_d,d,d);
  nand #(0.6) g2(i1,a,b,d);
  nand #(0.6) g3(i2,c,not_d);
  nand #(0.6) g4(O,i1,i2);
endmodule

module f2_nor(O,a,b,c,d);
  output O;
  input a,b,c,d;
  wire i1,i2,i3,not_d;
  nor #(0.7) g1(not_d,d,d);
  nor #(0.7) g2(i1,not_d,a);
  nor #(0.7) g3(i2,b,not_d);
  nor #(0.7) g4(i3,c,d);
  nor #(0.7) g5(O,i1,i2,i3);
endmodule

module test_f2;
  reg a,b,c,d;
  wire O_and_or,O_nand,O_nor;
  f2_nor test_f2_nor(O_nor,a,b,c,d);
  f2_nand test_f2_nand(O_nand,a,b,c,d);
  f2_and_or test_f2_and_or(O_and_or,a,b,c,d);
  initial 
    begin
      a = 0; b = 1; c = 1; d = 0;
      #5 b = 0; d = 1;
      #5 b = 1; a = 1;
      #5 b = 0; c = 0; d = 1;
      #5 b = 1; a = 0;     
      #5 b = 0; a = 1; d = 0; c = 1;
    end
  
endmodule
