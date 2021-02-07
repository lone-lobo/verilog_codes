module test_traffic_controller;
  reg res_n;
  reg clk;
  reg en;
  wire [3:0]o;
  wire [1:0]next_state;
  
  //initialization of test bench signals
  initial
    begin
      res_n <= 1'b1;
      en <= 1'b0;
      clk <= 1'b0;
    end
  
  //generate periodic clock signal
  always #1 clk <= ~clk;
  
  //module instantiation
  traffic_controller fsm_1(.res_n(res_n),.next_state(next_state),.clk(clk),.en(en),.o(o));
  
  initial begin
  $dumpfile("dump.vcd");                                                                    //dump variables for waveform generation if -> <eda playground>
  $dumpvars(1);                                                                             //else -> comment the two lines 
  #1 en <= 1'b0;    
  #5 res_n <= 1'b0;
  #1 en <= 1'b1;
  #1 res_n <= 1'b1;
  #35 en <= 1'b0;
  #10 res_n <= 1'b0;
  #10  $finish;
  end
  
endmodule
