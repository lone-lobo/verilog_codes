module test_bench_vedic_8x8;
  reg [7:0]mul_1;
  reg [7:0]mul_2;
  wire [15:0] product;
  
  initial begin
    mul_1 = 8'b0;
    mul_2 = 8'b0;
  end
  
  vedic_8x8 vmtb1(.mul_1(mul_1),.mul_2(mul_2),.product(product));
 
  initial begin                                                         
    $dumpfile("dump.vcd");                                               //comment these two lines if using a custom simulator tool 
    $dumpvars(1);
    #2 mul_1 = 8'b00010101;
    #2 mul_2 = 8'b01001011;
    #2 mul_1 = 8'b10001101;
    #2 mul_2 = 8'b11001000;
    #2 mul_1 = 8'b10100000;
    #2 mul_1 = 8'b00101101;
    #2 mul_2 = 8'b01110101;
    #2 mul_2 = 8'b11111111;
    #2 mul_1 = 8'b11111111;
    #2 $finish;
  end
endmodule
