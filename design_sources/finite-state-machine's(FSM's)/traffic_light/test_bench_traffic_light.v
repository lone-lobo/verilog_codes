module test_traffic_controller;
  reg [1:0]cur_state;
  reg res_n;
  reg clk;
  reg en;
  wire [3:0]o;
  wire [1:0]next_state;
  initial
    begin
      cur_state <= 2'b00;
      res_n <= 1'b1;
      en <= 1'b0;
      clk <= 1'b0;
    end
  always #1 clk <= ~clk;
  //d_ff d_ff_1(.q(q),.reset_n(reset_n),.clk(clk),.en(en),.o(o));
  traffic_controller fsm_1(.res_n(res_n),.cur_state(cur_state),.next_state(next_state),.clk(clk),.en(en),.o(o));
  initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
  #1 en<=1'b0;    
     cur_state <= 2'b00;
  #5 res_n <= 1'b0;
  #1 en <= 1'b1;
  #1 res_n <= 1'b1;
  //#5 q<=1'b0;
  #15 cur_state <= 2'b01;
  //#10 cur_state <= 2'b10;
  //#6  cur_state <= 2'b00;
  #40  $finish;
  end
endmodule
