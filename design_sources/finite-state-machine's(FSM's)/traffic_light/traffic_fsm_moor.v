module traffic_controller(res_n,cur_state,clk,en,o);
  input clk;
  input res_n;
  input [1:0]cur_state;
  input en;
  reg [1:0]next_state;
  output reg [3:0]o;
  parameter s_0 = 2'b00;
  parameter s_1 = 2'b01;
  parameter s_2 = 2'b10;
  parameter s_3 = 2'b11;
  always @(posedge clk or negedge res_n or en or cur_state or next_state) begin
    if(res_n == 1'b0) next_state <= s_0;
    else next_state <= cur_state;
  end
  always @(next_state or posedge clk or cur_state)
      if(res_n == 1'b1 && en == 1'b1) begin
        case(next_state)
          s_0:begin
              o<=4'b1000;
              #10 next_state <= s_1;
          end
          s_1: begin
              o <= 4'b0100;
              #2 next_state <= s_2;
          end
          s_2: begin
              o <= 4'b0010;
              #8 next_state <= s_0;
          end
          s_3: o <= 4'b1101;
          default: o <= 4'b0111;
    endcase
    end
    else o <= 4'b1111;
endmodule
