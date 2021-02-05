module traffic_controller(res_n,cur_state,next_state,clk,en,o);
  input clk;
  input [1:0]cur_state;
  input res_n;
  input en;
  output reg [1:0]next_state= 2'b00;
  output reg [3:0]o;
  parameter s_0 = 2'b00;
  parameter s_1 = 2'b01;
  parameter s_2 = 2'b10;
  parameter s_3 = 2'b11;
  //next_state <= cur_state;
  always @(posedge clk or negedge res_n or en ) begin
    if(res_n == 1'b0) o=4'b1111;
    else begin
      //next_state <= cur_state;
      if(res_n == 1'b1 && en == 1'b1) begin
        //next_state <= cur_state;
        case(next_state)
          s_0:begin
            o=4'b1000;
            #5 next_state = s_1;
          end
          s_1: begin
            o = 4'b0100;
             next_state = s_2;
          end
          s_2: begin
            o = 4'b0010;
             #4 next_state = s_0;
          end
          s_3: o = 4'b1111;
          default: o = 4'b1111;
    endcase
    end
      else o = 4'b1111;
    end  
  end
endmodule
