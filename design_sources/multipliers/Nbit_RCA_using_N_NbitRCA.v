module N2_bit_adder(input1,input2,c_in,answer,c_out);
  parameter N=2;                                                                    // IF CHANGE IN N PARAMETER HERE CHANGE THE NUMBER OF THIS MODULE INSTANTIATIONS 
  input [N-1:0] input1,input2;                                                      // IN THE MAIN MODULE TO ACCOMODATE THE LOGIC STABILITY
  input c_in;
  output [N-1:0] answer;
  output c_out;
  wire [N-1:0] carry;
  genvar i;
  generate 
  for(i=0;i<N;i=i+1)
     begin: generate_2_bit_Adder
   if(i==0) 
     full_adder fa(input1[0],input2[0],c_in,answer[0],carry[0]);                           //full adder with initial carry_in from test_bench
       else
      full_adder fa(input1[i],input2[i],carry[i-1],answer[i],carry[i]);
     end
  assign c_out = carry[N-1];
   endgenerate
endmodule 

module N_bit_adder(input1,input2,carry_in,answer,carry_out);
  parameter N=4;                                                        //CHANGE THE N PARAMETER ACCORDING TO NEED
  input [N-1:0] input1,input2;
  input carry_in;
  output [N-1:0] answer;
  output wire  carry_out;
  N2_bit_adder b1(input1[1:0],input2[1:0],carry_in,answer[1:0],c_out1);                    //NUMBER OF INSTIANTIATIONS MAY VARY FOR EVERY DESIGN
  N2_bit_adder b2(input1[3:2],input2[3:2],c_out1,answer[3:2],carry_out);                   
endmodule

