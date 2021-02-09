module test_traffic_controller;
  reg res_n;
  reg clk;
  reg en;
  //reg [1:0]cur_state;
  reg [1:0]in;
  wire [3:0]o;
 
  initial
    begin
      res_n <= 1'b1;
      in <= 2'b00;
      en <= 1'b1;
      clk <= 1'b0;
    end
  always #1 clk <= ~clk;
  traffic_controller_melay fsm_3(.res_n(res_n),.in(in),.clk(clk),.en(en),.o(o));
  initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
  #1 en=1'b1;    
  #10 res_n = 1'b1;
  #10  in = 2'b00;
  #2 en = 1'b1;
  #2 res_n = 1'b1;
  #18in = 2'b01;
  #20 in = 2'b10;
  #2 in = 2'b01;
  #20 in = 2'b00;
  #60 res_n = 1'b0;
  #10  $finish;
  end
endmodule
