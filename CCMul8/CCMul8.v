module CCMul8(A,B,M);
input[7:0] A,B;
output[15:0] M;
wire[7:0] m0,m1,m2,m3;
wire[15:0] sa,sb;
wire c0,c1,c2;

CCMul4 u0(A[3:0],B[3:0],m0);
CCMul4 u1(A[7:4],B[3:0],m1);
CCMul4 u2(A[3:0],B[7:4],m2);
CCMul4 u3(A[7:4],B[7:4],m3);
CSADD16 u4({8'd0,m0},{4'd0,m1,4'd0},1'b0,sa,c0);
CSADD16 u5({4'd0,m2,4'd0},{m3,8'd0},1'b0,sb,c1);
CSADD16 u6(sa,sb,1'b0,M,c2);

endmodule


















