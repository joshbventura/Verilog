module full_adder_1bit(A, B, Carry_in, SUM, Carry_out);
  input A;
  input B;
  input Carry_in;
  output SUM;
  output Carry_out;

  wire x;
  wire y;
  wire z;


  xor(x, A, B);
  and(y, x, Carry_in);
  and(z, A, B);
  xor(SUM, x, Carry_in);
  or(Carry_out, y, z);

endmodule
