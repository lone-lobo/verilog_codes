module traffic_controller_melay(res_n,in,clk,en,o);
  input clk;
  input res_n;
  input [1:0]in ;
  reg [1:0]cur_state ;
  input en;
  reg [1:0]next_state;
  reg [3:0] count = 0;
  output reg [3:0]o;
  parameter s_0 = 2'b00;
  parameter s_1 = 2'b01;
  parameter s_2 = 2'b10;
  parameter s_3 = 2'b11;
  always @(posedge clk  or en or cur_state or next_state or in or res_n or count)begin
    if(res_n == 1'b0) begin
      cur_state <= s_0;
      count <= 4'b0000;
    end
    else cur_state <= next_state;
  end
  always @(cur_state or in or count) begin
      if(res_n == 1'b1 && en == 1'b1) begin
        case(cur_state)
          s_0:begin
            $display("%t s0_cur->%b s0_next->%b",$time,cur_state,next_state);
             if(in == s_1) begin
               next_state = s_2;
               o=4'b0100;
            end
            else if(in == s_2) begin
              o = 4'b010;
               next_state = s_0;
            end
            else if(count == 4'b1010) begin
              count = 4'b0000;
              next_state = s_1;
            end
             else  begin
               o = 4'b1000;
               next_state = s_0;
               count = count+1;
               $display ("%t s_0->%0h",$time,count);
            end
          end
          s_1: begin
            $display("%t s1_cur->%b s1_next->%b",$time,cur_state,next_state);
           if(in == s_2) begin
              o = 4'b0010;
              next_state = s_3;
            end
            else if(in == s_0) begin
              o = 4'b1000;
              next_state = s_0;
            end
            else if(count==4'b0010) begin
              count = 4'b0000;
              next_state = s_2;
            end
             else begin
              o= 4'b1000;
              next_state = s_1;
              count = count+1;
               $display ("%t s_1->%0h",$time,count);
            end
          end
          s_2: begin
            $display("%t s2_cur->%b s2_next->%b",$time,cur_state,next_state);
           if(in == s_0) begin
              o = 4'b1000;
             next_state = s_1;
            end
            else if(in == s_1) begin
              o = 4'b0100;
              next_state = s_2;
            end
            else if(count==4'b1000) begin
              count = 4'b0000;
              next_state = s_0;
            end
             else  begin
               o =4'b1000;
                next_state = s_2;
               count = count+1;
               $display ("%t s_2->%0h",$time,count);
            end
          end
          default:begin
            o = 4'b0111;
            next_state = s_0;
          end 
    endcase
  end
    else o <= 4'b1111;
  end
endmodule
