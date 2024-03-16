module CCMul4(A,B,M);
input[3:0] A,B;
output[7:0] M;
wire[3:0] m0,m1,m2,m3;
wire[7:0] sa,sb;
wire c0,c1,c2;

assign m0=(B[0])?A:4'd0;
assign m1=(B[1])?A:4'd0;
assign m2=(B[2])?A:4'd0;
assign m3=(B[3])?A:4'd0;
ADD8 u0({4'd0,m0},{3'd0,m1,1'b0},1'b0,sa,c0);
ADD8 u1({2'd0,m2,2'd0},{1'b0,m3,3'd0},1'b0,sb,c0);
ADD8 u2(sa,sb,1'b0,M,c2);

endmodule
