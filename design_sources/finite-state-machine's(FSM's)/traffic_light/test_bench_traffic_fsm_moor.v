module test_traffic_controller;
  reg res_n;
  reg clk;
  reg en;
  reg [1:0]cur_state;
  wire [3:0]o;
 
  initial
    begin
      res_n <= 1'b1;
      cur_state <= 2'b00;
      en <= 1'b1;
      clk <= 1'b0;
    end
  always #1 clk <= ~clk;
  traffic_controller fsm_1(.res_n(res_n),.cur_state(cur_state),.clk(clk),.en(en),.o(o));
  initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
  #1 en<=1'b0;    
  #5 res_n <= 1'b1;
  #5  cur_state <= 2'b00;
  #1 en <= 1'b1;
  #1 res_n <= 1'b1;
  #40 cur_state <= 2'b10;
  #60 res_n <= 1'b0;
  #10  $finish;
  end
endmodule
