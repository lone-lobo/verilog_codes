module half_adder(input x1, input x2, output y1, output y2);
assign y1 = x1^x2;
assign y2= x1&x2;
endmodule

module full_adder(input alpha, input beta, input gamma, output full_sum, output full_carry);
assign full_sum = (alpha^beta)^gamma;
assign full_carry = (alpha&beta) | (gamma&(alpha^beta)); 
endmodule

module wallace_tree(
input [3:0] a,
input [3:0] b,
output [7:0] prod
);

wire s11,s12,s13,s14,s15,s22,s23,s24,s25,s26,s32,s34,s35,s36,s37;
wire c11,c12,c13,c14,c15,c22,c23,c24,c25,c26,c32,c34,c35,c36,c37;
wire [3:0] p0;
wire [3:0] p1;
wire [3:0] p2;
wire [3:0] p3;

assign p0[0] = a[0]&b[0];
assign p0[1] = a[1]&b[0];
assign p0[2] = a[2]&b[0];
assign p0[3] = a[3]&b[0];

assign p1[0] = a[0]&b[1];
assign p1[1] = a[1]&b[1];
assign p1[2] = a[2]&b[1];
assign p1[3] = a[3]&b[1];

assign p2[0] = a[0]&b[2];
assign p2[1] = a[1]&b[2];
assign p2[2] = a[2]&b[2];
assign p2[3] = a[3]&b[2];

assign p3[0] = a[0]&b[3];
assign p3[1] = a[1]&b[3];
assign p3[2] = a[2]&b[3];
assign p3[3] = a[3]&b[3];

assign prod[0] = p0[0];
assign prod[1] = s11;
assign prod[2] = s22;
assign prod[3] = s32;
assign prod[4] = s34;
assign prod[5] = s35;
assign prod[6] = s36;
assign prod[7] = s37;

half_adder ha11(p0[1],p1[0],s11,c11);
full_adder fa12(p0[2],p1[1],p2[0],s12,c12);
full_adder fa13(p0[3],p1[2],p2[1],s13,c13);
full_adder fa14(p1[3],p2[2],p3[1],s14,c14);
half_adder ha15(p2[3],p3[2],s15,c15);


half_adder ha22(c11,s12,s22,c22);
full_adder fa23(p3[0],c12,s13,s23,c23);
full_adder fa24(c13,c32,s14,s24,c24);
full_adder fa25(c14,c24,s15,s25,c25);
full_adder fa26(c15,c25,p3[3],s26,c26);


half_adder ha32(c22,s23,s32,c32);
half_adder ha34(c23,s24,s34,c34);
half_adder ha35(c34,s25,s35,c35);
half_adder ha36(c35,s26,s36,c36);
half_adder ha37(c36,c26,s37,c37); 

endmodule
