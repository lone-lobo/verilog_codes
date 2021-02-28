module test_bench_vedic_32x32;
  reg [31:0]mul_1;
  reg [31:0]mul_2;
  wire [63:0] product;
  
  initial begin
    mul_1 = 31'b0;
    mul_2 = 31'b0;
  end
  
  vedic_32x32 vmtb1(.mul_1(mul_1),.mul_2(mul_2),.product(product));
 
  initial begin                                                         
    $dumpfile("dump.vcd");                                               //comment these two lines if using a custom simulator tool 
    $dumpvars(1);
    #2 mul_1 = 32'hA01234B0;
    #2 mul_2 = 32'hB055B055;
    #2 mul_1 = 32'h85858888;
    #2 mul_2 = 32'hDEAB89F6;
    #2 mul_1 = 32'h5A5A5A5A;
    #2 mul_2 = 32'hAABBCCDD;
    #2 mul_1 = 32'h11223344;
    #2 mul_2 = 32'h01111000;
    #2 mul_2 = 32'hFFFFFFFF;
    #2 mul_1 = 32'hFFFFFFFF;
    #2 $finish;
  end
endmodule
