module test_bench_vedic_2x2;
  reg [1:0]mul_1;
  reg [1:0]mul_2;
  wire [3:0] product;
  
  initial begin
    mul_1 = 2'b00;
    mul_2 = 2'b00;
  end
  
  vedic_2x2 vm1(.mul_1(mul_1),.mul_2(mul_2),.product(product));
 
  initial begin                                                         
    $dumpfile("dump.vcd");                                               //comment these two lines if using a custom simulator tool 
    $dumpvars(1);
    #2 mul_1 = 2'b01;
    #2 mul_2 = 2'b01;
    #2 mul_1 = 2'b10;
    #2 mul_2 = 2'b10;
    #2 mul_1 = 2'b00;
    #2 mul_1 = 2'b11;
    #2 mul_2 = 2'b11;
    #2 mul_2 = 2'b00;
    #2 $finish;
  end
endmodule
