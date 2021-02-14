module d_ff(                                                      //(q,reset,clk,en,o); 
  input q,reset_n,clk,en,
  output reg o
);
  
  
  always@(posedge clk, negedge reset_n, q, en)                    //active low reset triggered
    begin
      if (reset_n == 1'b0)  o <= 1'b0;
      else begin
        if(en == 1'b1 && reset_n == 1'b1)  o <= q;
        else o <= 1'b0;
      end
    end
endmodule
