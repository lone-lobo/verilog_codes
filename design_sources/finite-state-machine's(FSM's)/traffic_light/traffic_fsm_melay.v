module traffic_controller_melay(res_n,in,clk,en,o);
  input clk;
  input res_n;
  input [1:0]in ;
  reg [1:0]cur_state ;
  input en;
  reg [1:0]next_state;
  output reg [3:0]o;
  parameter s_0 = 2'b00;
  parameter s_1 = 2'b01;
  parameter s_2 = 2'b10;
  parameter s_3 = 2'b11;
  always @(posedge clk  or en or cur_state or next_state or in) begin
    if(res_n == 1'b0) cur_state <= s_0;
    else cur_state <= next_state;
  end
  always @(cur_state or in)
      if(res_n == 1'b1 && en == 1'b1) begin
        case(cur_state)
          s_0:begin
          //  #10 o<=4'b1000;
            if(in == s_0)begin
               o = 4'b1000;
              #10 next_state = 2'b01;
            end
            else if(in == s_1) begin
               o=4'b0100;
              #2 next_state = s_2;
            end
            else if(in == s_2) begin
              o <= 4'b010;
              #8 next_state <= s_0;
            end
            else begin
               o = 4'b1000;
              next_state = s_0;
            end
          end
          s_1: begin
          //  #2 o <= 4'b0100;
            if(in == s_1)begin
             o <= 4'b0100;
            #2 next_state <= s_2;
            end
            else if(in == s_2) begin
              o <= 4'b0010;
              #8 next_state <= s_3;
            end
            else if(in == s_3) begin
              o <= 4'b1000;
              next_state <= s_0;
            end
            else  begin
              o= 4'b1000;
              #10 next_state = s_1;
            end
          end
          s_2: begin
            //#8 o <= 4'b0010;           
            if(in == s_2)begin
              o <= 4'b1000;
              #8 next_state <= s_0;
            end
            else if(in == s_0) begin
              o <= 4'b1000;
              #10 next_state <= s_1;
            end
            else if(in == s_1) begin
              o <= 4'b0100;
              #2 next_state <= s_2;
            end
            else   begin
               o =4'b1000;
               next_state = s_0;
            end
          end
          s_3: begin
            o <= 4'b1101;
            next_state <= s_0;
          end
          default:begin
            o <= 4'b0111;
            next_state <= s_0;
          end 
    endcase
    end
    else o <= 4'b1111;
endmodule
