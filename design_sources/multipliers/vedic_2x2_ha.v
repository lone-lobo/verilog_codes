module vedic_2x2(mul_1,mul_2,o_product,clk,reset);
input [1:0] mul_1;
input [1:0] mul_2;
input clk;
input reset;
//input en;
  wire [4:0] product;
  output reg [4:0] o_product;
  wire temp_3;
  reg temp_1,temp_2,temp_4;
  
  
  half_add ha_1 (temp_1,temp_2,product[1],temp_3);                                //instantiate 2 half adders  along with proper input and outputs
  half_add ha_2 (temp_3,temp_4,product[2],product[3]);
  
  
  always@(posedge clk or reset or mul_1 or mul_2 or product) begin
    if( reset == 1'b1) begin
      o_product = 4'b0000;
      end
    else begin
      $monitor("main->at %t %d %d %d ",$time,mul_1,mul_2,o_product);
      //$display("po->%d %d %d %d",mul_1[1],mul_1[0],mul_2[1],mul_2[0]);
      assign o_product[0] = mul_1[0] & mul_2[0];
      //$display("%b",product[0]);
      //assign  product[1] = mul_2[0] & mul_1[1] ^ mul_2[1] & mul_1[0];
      //assign  product[2] = mul_2[1] & mul_1[1] ^ mul_2[0] & mul_1[1] & mul_2[1] & mul_1[0];
      //assign product[3] = mul_2[1] & mul_1[1] & mul_2[0] & mul_1[1] & mul_2[1] & mul_1[0];
      assign temp_1 = mul_2[0] & mul_1[1];
      assign temp_2 = mul_2[1] & mul_1[0];
      assign temp_4 = mul_1[1] & mul_2[1];
      assign o_product[1] = product[1];
      assign o_product[2] = product[2];
      assign o_product[3] = product[3];
    end
  end
endmodule


//half adder module

module half_add(input a, b , output s, c_out);
  assign s = a ^ b;
  assign c_out = a & b;
endmodule
