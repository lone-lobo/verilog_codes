
module half_add(input a, b , output s, c_out);
  assign s = a ^ b;
  assign c_out = a & b;
endmodule


module vedic_2x2(mul_1,mul_2,product);
  input [1:0]mul_1;
  input [1:0]mul_2;
  output  [3:0] product;
  wire [3:0] temp;
  
  
  half_add ha_1 (temp[0],temp[1],product[1],temp[2]);
  
  half_add ha_2 (temp[2],temp[3],product[2],product[3]);
  
  
  assign product[0] = mul_1[0] & mul_2[0];
  assign temp[0] = mul_1[0] & mul_2[1];
  assign temp[1] = mul_1[1] & mul_2[0];
  assign temp[3] = mul_1[1] & mul_2[1];
  
  
endmodule
