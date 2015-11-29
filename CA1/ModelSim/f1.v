module f1_and_or(O,a,b,c,d);
  input a,b,c,d;
  wire a_not,b_not,c_not,i1,i2,i3,i4;
  output O;
  not #(0.5) g1(a_not,a);
  not #(0.5) g2(b_not,b);
  not #(0.5) g3(c_not,c);
  and #(0.7) g4(i1,a,c_not,d);
  and #(0.7) g5(i2,a_not,b_not,d);
  and #(0.7) g6(i3,a_not,c);
  and #(0.7) g7(i4,b,c);
  or #(0.9) g8(O,i1,i2,i3,i4);
endmodule

module f1_nand(O,a,b,c,d);
  input a,b,c,d;
  wire a_not,b_not,c_not,i1,i2,i3,i4;
  output O;
  nand #(0.6) g1(a_not,a,a);
  nand #(0.6) g2(b_not,b,b);
  nand #(0.6) g3(c_not,c,c);
  nand #(0.6) g4(i1,a,c_not,d);
  nand #(0.6) g5(i2,a_not,b_not,d);
  nand #(0.6) g6(i3,a_not,c);
  nand #(0.6) g7(i4,b,c);
  nand #(0.6) g8(O,i1,i2,i3,i4);
endmodule

module f1_nor(O,a,b,c,d);
  input a,b,c,d;
  output O;
  wire i1,i2,i3,a_not,b_not,c_not;
  nor #(0.7) g1(a_not,a,a);
  nor #(0.7) g2(b_not,b,b);
  nor #(0.7) g3(c_not,c,c);
  nor #(0.7) g4(i1,a_not,b,c_not);
  nor #(0.7) g5(i2,c,d);
  nor #(0.7) g6(i3,a,b_not,c);
  nor #(0.7) g7(O,i1,i2,i3);
endmodule

module test_f1;
  reg a,b,c,d;
  wire O_and_or,O_nand,O_nor;
  f1_nor test_f1_nor(O_nor,a,b,c,d);
  f1_nand test_f1_nand(O_nand,a,b,c,d);
  f1_and_or test_f1_and_or(O_and_or,a,b,c,d);
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