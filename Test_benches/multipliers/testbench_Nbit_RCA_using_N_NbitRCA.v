module tb_N_bit_adder;
   reg [3:0] input1;
   reg [3:0] input2;
   reg carry_in;
   wire [3:0] answer;
   wire carry_out;

 N_bit_adder nbit_rca (
  input1, 
  input2,
  carry_in,
  answer,
  carry_out
 );

 initial begin
  $dumpfile("dump.vcd");                                               //comment these two lines if using a custom simulator tool 
  $dumpvars(1);
  input1 = 4'b1010;
  input2 = 4'b0110;
  carry_in = 1'b0;
  #2 input1 = 4'b1000;
  #2 input2 = 4'b0000;
  #2 input1 = 4'b0100;
  #2 input2 = 4'b1111;
  #2 input1 = 4'b1101;
  #1 carry_in = 1'b1;
  #2 input2 = 4'b0101;
  #2 input1 = 4'b0111;
  #1 carry_in = 1'b0;
  #2 input2 = 4'b1100;
  #2 $finish;
 end
      
endmodule
