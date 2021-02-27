module test_bench_vedic_4x4;
  reg [3:0]mul_1;
  reg [3:0]mul_2;
  wire [7:0] product;
  
  initial begin
    mul_1 = 4'b0000;
    mul_2 = 4'b0000;
  end
  
  vedic_4x4 vmtb1(.mul_1(mul_1),.mul_2(mul_2),.product(product));
 
  initial begin                                                         
    $dumpfile("dump.vcd");                                               //comment these two lines if using a custom simulator tool 
    $dumpvars(1);
    #2 mul_1 = 4'b0001;
    #2 mul_2 = 4'b0100;
    #2 mul_1 = 4'b1000;
    #2 mul_2 = 4'b1100;
    #2 mul_1 = 4'b1010;
    #2 mul_1 = 4'b0011;
    #2 mul_2 = 4'b0111;
    #2 mul_2 = 4'b1111;
    #2 mul_1 = 4'b1111;
    #2 $finish;
  end
endmodule
