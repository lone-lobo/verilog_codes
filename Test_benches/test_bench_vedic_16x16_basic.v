module test_bench_vedic_8x8;
  reg [15:0]mul_1;
  reg [15:0]mul_2;
  wire [31:0] product;
  
  initial begin
    mul_1 = 15'b0;
    mul_2 = 15'b0;
  end
  
  vedic_16x16 vmtb1(.mul_1(mul_1),.mul_2(mul_2),.product(product));
 
  initial begin                                                         
    $dumpfile("dump.vcd");                                               //comment these two lines if using a custom simulator tool 
    $dumpvars(1);
    #2 mul_1 = 16'hA0B0;
    #2 mul_2 = 16'hB055;
    #2 mul_1 = 16'h8888;
    #2 mul_2 = 16'hDEF6;
    #2 mul_1 = 16'h5A5A;
    #2 mul_2 = 16'hABCD;
    #2 mul_1 = 16'h1234;
    #2 mul_2 = 16'h0000;
    #2 mul_2 = 16'hFFFF;
    #2 mul_1 = 16'hFFFF;
    #2 $finish;
  end
endmodule
