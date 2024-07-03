module test_bench();
   /*anything that you set in the initial begin...end block should be declared as reg.  Here A, B, C stand as the switch operation.*/
   reg A, B, Carry_in;      
   /* the outputs of instantiated module in the testbench are defined as wire*/
    wire SUM_1;
    wire Carry_out_1;
    wire SUM_2;
    wire Carry_out_2;

   /* Instantiate Circuit Here */
    full_adder_1bit           uut1 (.A(A), .B(B), .Carry_in(Carry_in), .SUM(SUM_1), .Carry_out(Carry_out_1)); 
    full_adder_1bit_LS_series  uut2 (.A(A), .B(B), .Carry_in(Carry_in), .SUM(SUM_2), .Carry_out(Carry_out_2));
    

   /* Testbench Logic */

   initial begin
      $monitor("(%t): A:%b B:%b Carry_in:%b SUM_1:%b Carry_out_1:%b SUM_2:%b Carry_out_2:%b",$time, A, B, Carry_in, SUM_1, Carry_out_1, SUM_1,Carry_out_2);
      /* here each 1000 unit timescale the value of A, B, Carry_in are chenged. It seems that we change the switches position*/       
      A = 0; B = 0; Carry_in = 0;
      #1000;      
      A = 0; B = 0; Carry_in = 1;
      #1000;   
      A = 0; B = 1; Carry_in = 0;
      #1000; 
      A = 0; B = 1; Carry_in = 1;
      #1000;
      A = 1; B = 0; Carry_in = 0;
      #1000;
      A = 1; B = 0; Carry_in = 1;
      #1000;
      A = 1; B = 1; Carry_in = 0;
      #1000;
      A = 1; B = 1; Carry_in = 1;
      #1000;
      $finish;                                     
   end
      
endmodule // test_bench