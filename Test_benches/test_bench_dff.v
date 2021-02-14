module test_d_ff;
  reg q;
  reg reset_n;
  reg clk;
  reg en;
  wire o;
  
  initial
    begin                                                                    //initialization of signals
      q <= 1'b0;
      reset_n <= 1'b1;
      en <= 1'b0;
      clk <= 1'b0;
    end
    
  always #5 clk <= ~clk;
  
  d_ff d_ff_1(.q(q),.reset_n(reset_n),.clk(clk),.en(en),.o(o));
  
  initial begin
  $dumpfile("dump.vcd");                                                      //comment this and below line if simulator isn't open sourced software
  $dumpvars(1);                                                               //i have used EDA PLAYGROUND to simulate the design
  #5 en <= 1'b0;
     q <= 1'b1;
  #5 reset_n <= 1'b0;
  #5 en <= 1'b1;
  #5 reset_n <= 1'b1;
  //#5 q <= 1'b0;
  #10 $finish;
  end
endmodule
