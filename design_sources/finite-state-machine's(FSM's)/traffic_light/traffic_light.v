module traffic_controller(res_n,next_state,clk,en,o);
  input clk;
  input res_n;
  input en;
  output reg [1:0]next_state=2'b00;                                 //initial state is set to s_0 
  output reg [3:0]o;
  parameter s_0 = 2'b00;                                            // define parameters
  parameter s_1 = 2'b01;
  parameter s_2 = 2'b10;
  parameter s_3 = 2'b11;
  always @(posedge clk or negedge res_n or en ) begin
    if(res_n == 1'b0) o <= 4'b1010;                                 // if asynchronous reset is low -> output is 0xA
    else begin
      if(res_n == 1'b1 && en == 1'b1) begin                         //if en is on and reset is off then iterate through states
        case(next_state)
          s_0:begin
            o <= 4'b1000;
            #10 next_state <= s_1;                                  // change the delay according to the problem description 
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
          default: o <= 4'b1110;                                    //if fsm enters unknown state  ->output is 0xE
    endcase
    end
      else o <= 4'b1111;                                            //if enable is low -> output is 0xF
    end  
  end
endmodule
