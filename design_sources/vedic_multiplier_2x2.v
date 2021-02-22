module vedic_2x2(mul_1,mul_2,product,clk,reset);
input [1:0] mul_1;
input [1:0] mul_2;
input clk;
input reset;
                                                                                        // multiplier implemented as sequential circuit without half adder instantiation
  
output reg [4:0] product;
  always@(posedge clk or reset or mul_1 or mul_2) begin
    if( reset == 1'b1) begin
      product = 4'b0000;
      end
    else begin
      $monitor("main->at %t %d %d %d ",$time,mul_1,mul_2,product);
      //$display("po->%d %d %d %d",mul_1[1],mul_1[0],mul_2[1],mul_2[0]);
      assign product[0] = mul_1[0] & mul_2[0];
      //$display("%b",product[0]);
      assign  product[1] = mul_2[0] & mul_1[1] ^ mul_2[1] & mul_1[0];
      assign  product[2] = mul_2[1] & mul_1[1] ^ mul_2[0] & mul_1[1] & mul_2[1] & mul_1[0];
      assign product[3] = mul_2[1] & mul_1[1] & mul_2[0] & mul_1[1] & mul_2[1] & mul_1[0];
      //assign c_out = mul_2[1] & mul_1[1];
    end
  end
endmodule
