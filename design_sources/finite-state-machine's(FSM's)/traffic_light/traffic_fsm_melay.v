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
  always @(cur_state or in) begin
      if(res_n == 1'b1 && en == 1'b1) begin
        case(next_state)
          s_0:begin
            $display("%t s0_cur->%b s0_next->%b",$time,cur_state,next_state);
           // #10 o = 4'b1000;
            if (in == s_1) begin
               next_state = s_1;
               o=4'b0100;
            end
            else if(in == s_2) begin
              o = 4'b010;
              #2 next_state = s_2;
            end
            else begin
    //          if(count == 4'b1010) begin
     //         count = 4'b0000;
     //         cur_state = s_1;
     //       end
     //        else  begin
     //          o = 4'b1000;
     //          cur_state = s_0;
      //         count = count+1;
      //         $display ("%t s_0->%0h",$time,count);
      //      end
              while( count <= 10) begin
                o = 4'b1000;
                count = @(clk)count + 1;
                $display("%t %d %d",$time,count,o);
              end
              o = 4'b0100;
              count = 0;
               next_state = s_1;
              $display("%t s_0-> %b  %d",$time,cur_state,o);
          end
          end
          s_1: begin
            $display("%t s1_cur->%b s1_next->%b",$time,cur_state,next_state);
           if(in == s_2) begin
              o = 4'b0010;
               next_state = s_2;
            end
            else if(in == s_0) begin
              o = 4'b1000;
              next_state = s_0;
            end
            else begin
   //           if(count==4'b0010) begin
    //          count = 4'b0000;
     //         cur_state = s_2;
      //      end
      //       else begin
      //        o= 4'b1000;
      //        cur_state = s_1;
      //        count = count+1;
      //         $display ("%t s_1->%0h",$time,count);
      //     end
              while( count < 2) begin
                o = 4'b0100;
                count = @(posedge clk )count + 1;
                $display("%t %d %d",$time,count,o);
              end
              o = 4'b0010;
              count = 0;
               next_state = s_2;
              $display("%t s_1-> %b  %d",$time,cur_state,o);
            end
          end
          s_2: begin
            $display("%t s2_cur->%b s2_next->%b",$time,cur_state,next_state);
           if(in == s_0) begin
              o = 4'b1000;
             next_state = s_0;
            end
            else if(in == s_1) begin
              o = 4'b0100;
              next_state = s_1;
            end
            else begin
    //          if(count==4'b1000) begin
     //         count = 4'b0000;
     //         cur_state = s_0;
    //       end
    //         else  begin
     //          o =4'b1000;
      //          cur_state = s_2;
      //         count = count+1;
     //          $display ("%t s_2->%0h",$time,count);
     //       end
              while( count <  5) begin
                o = 4'b0100;
                count = @(posedge clk)count + 1;
                $display("%t %d %d",$time,count,o);
              end
              o = 4'b1000;
              count = 0;
              next_state = s_0;
              $display("%t s_2-> %b %d",$time,cur_state,o); 
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
