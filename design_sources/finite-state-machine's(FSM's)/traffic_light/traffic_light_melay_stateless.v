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


always @(posedge clk or cur_state or in ) begin
    if(res_n == 1'b1 && en == 1'b1) begin 
      case(cur_state)
        s_0 : begin
          if( in == s_1) begin 
            o <= 4'b0100;
            next_state <= s_1;
          end
          //else if(in == s_2) o <= 4'b0010;
          else begin
            o <= 4'b0010;
            next_state <= s_2;
          end
        end
        s_1: begin
          if (in == s_0) begin
            o <= 4'b1000;
            next_state <= s_0;
          end
          
          //else if (in == s_2) o<=4'b0010;
          else begin
            o <=4'b0010;
            next_state <= s_2;
          end
        end
        
        endmodule
