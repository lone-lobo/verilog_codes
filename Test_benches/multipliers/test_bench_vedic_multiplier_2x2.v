module test_bench_vedic_2x2;
  reg [1:0]mul_1;
  reg [1:0]mul_2;
  reg clk;
  reg reset;
  wire [4:0] product;
  
  initial begin
    mul_1 <= 2'b00;                                                                     // AVOID USING NON BLOCKING STATEMENTS IN COMBINATIONAL CIRCUITS
    mul_2 <= 2'b00;
    clk <= 1'b1;
  end
  always #1 clk <= ~clk;                                                                //clock makes the combinational circuit to sequential 
  
  vedic_2x2 vm1(.mul_1(mul_1),.mul_2(mul_2),.product(product),.clk(clk),.reset(reset));
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    #2 reset <= 1'b1;
    #2 reset <= 1'b0;
    #2 mul_1 <= 2'b01;
    #2 mul_2 <= 2'b01;
    #2 mul_1 <= 2'b10;
    #2 mul_2 <= 2'b10;
    #2 mul_1 <= 2'b00;
    #2 mul_1 <= 2'b11;
    #2 mul_2 <= 2'b11;
    #2 mul_2 <= 2'b00;
    #2 reset <= 1'b1;
    #2 $finish;
  end
endmodule
