module half_add(input a, b , output s, c_out);
  assign s = a ^ b;
  assign c_out = a & b;
endmodule

module full_add(input a,b,c_in,output s,c_out);
  wire temp_1,temp_2,temp_3;
  half_add ha_1(a,b,temp_1,temp_2);
  half_add ha_2(temp_1,c_in,s,temp_3);
  assign c_out = temp_2 | temp_3;
endmodule

module vedic_2x2(mul_1,mul_2,product);
  input [1:0]mul_1;
  input [1:0]mul_2;
  output  [3:0] product;
  wire [3:0] temp;
  
  half_add ha_1 (temp[0],temp[1],product[1],temp[2]);
  half_add ha_2 (temp[2],temp[3],product[2],product[3]);
  
  assign product[0] = mul_1[0] & mul_2[0];
  assign temp[0] = mul_1[0] & mul_2[1];
  assign temp[1] = mul_1[1] & mul_2[0];
  assign temp[3] = mul_1[1] & mul_2[1];
endmodule

module add_4bit(add_1,add_2,summed_up,carry_out);                                            
  parameter N=4;
  input [N-1:0] add_1,add_2;
  output [N-1:0] summed_up;
  output  carry_out;
  wire [N-1:0] intra_carry;
  genvar i;
  generate 
    for(i=0;i<N;i=i+1)
      begin: generate_N_bit_Adder
        if(i==0) half_add f(add_1[0],add_2[0],summed_up[0],intra_carry[0]);
        else full_add f(add_1[i],add_2[i],intra_carry[i-1],summed_up[i],intra_carry[i]);
      end
    assign carry_out = intra_carry[N-1];
  endgenerate
endmodule


module vedic_4x4(mul_1,mul_2,product);
  input [3:0]mul_1;
  input [3:0]mul_2;
  output [7:0]product;
  wire carry_out;
  wire [3:0]q[7:0];	
  wire carry_intra[3:0];
  //wire [5:0]temp[4:0];
  wire carry_or[1:0];
  
  vedic_2x2 vm_1(mul_1[1:0],mul_2[1:0],q[0]);
  vedic_2x2 vm_2(mul_1[3:2],mul_2[1:0],q[1]);
  vedic_2x2 vm_3(mul_1[1:0],mul_2[3:2],q[2]);
  vedic_2x2 vm_4(mul_1[3:2],mul_2[3:2],q[3]);
  
  add_4bit b4a(q[1],q[2],q[4],carry_or[0]);
  add_4bit b4b(q[4],q[5],q[6],carry_or[1]);
  add_4bit b4c(q[3],q[7],product[7:4],carry_out);
  //add_6bit b6a(temp[0],temp[1],temp[3]);
  //add_6bit b6b(temp[2],temp[3],temp[4]);
  

  assign q[5] ={2'b00,q[0][3:2]};
  assign q[7] = {1'b0,carry_or[0] | carry_or[1],q[6][3:2]};
  //assign temp[0] ={2'b00,q[2]};
  //assign temp[1] ={q[3],2'b00};
  //assign temp[2]={2'b00,q[4]};
  assign product[1:0]=q[0][1:0];
  assign product[3:2]=q[6][1:0];
  
endmodule

module add_8bit(add_1,add_2,summed_up,carry_out);                                            //add two 4 bit numbers
  parameter N=8;
  input [N-1:0] add_1,add_2;
  output [N-1:0] summed_up;
  output  carry_out;
  wire [N-1:0] intra_carry;
  genvar i;
  generate 
    for(i=0;i<N;i=i+1)
      begin: generate_N_bit_Adder
        if(i==0) half_add f(add_1[0],add_2[0],summed_up[0],intra_carry[0]);
        else full_add f(add_1[i],add_2[i],intra_carry[i-1],summed_up[i],intra_carry[i]);
      end
    assign carry_out = intra_carry[N-1];
  endgenerate
endmodule

module vedic_8x8(mul_1,mul_2,product,carry_out);
  input [7:0]mul_1;
  input [7:0]mul_2;
  output [15:0]product;
  output carry_out;
  wire [7:0]q[7:0];	
  
  wire carry_or[1:0];
  
  vedic_4x4 vm_1(mul_1[3:0],mul_2[3:0],q[0]);
  vedic_4x4 vm_2(mul_1[7:4],mul_2[3:0],q[1]);
  vedic_4x4 vm_3(mul_1[3:0],mul_2[7:4],q[2]);
  vedic_4x4 vm_4(mul_1[7:4],mul_2[7:4],q[3]);
  
  add_8bit b8a(q[1],q[2],q[4],carry_or[0]);                                           //2 8BTI RCA'S ARE INSTANTIATED IN PLACE OF 2 12BIT RCA'S
  add_8bit b8b(q[4],q[5],q[6],carry_or[1]);
  add_8bit b8c(q[3],q[7],product[15:8],carry_out);

  assign q[5] ={4'b0,q[0][7:4]};
  assign q[7] = {1'b0,carry_or[0] | carry_or[1],q[6][7:4]};

  assign product[3:0]=q[0][3:0];
  assign product[7:4]=q[6][3:0];
  
endmodule
