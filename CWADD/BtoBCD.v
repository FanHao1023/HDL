module BtoBCD(A,bcd2,bcd1,bcd0);
input [7:0] A;
output [3:0] bcd0,bcd1,bcd2; 
wire [7:0] S1,S2,S3,S4_10,S5,_S2,_S3,_S4,_S5;
wire [3:0] S,S4_2,S51,_S51,_S;
wire c1,c2,c3,c4,c5,c51;

adjust BB0(A[3:0],_S,c1);
assign S=c1?_S:A[3:0];
assign S1={3'b000,c1,S};
BCDADD2 BB1(S1,8'h16,1'b0,_S2,c2);
assign S2=(A[4])? _S2:S1;
BCDADD2 BB2(S2,8'h32,1'b0,_S3,c3);
assign S3=(A[5])? _S3:S2;
BCDADD2 BB3(S3,8'h64,1'b0,_S4,c4);
assign S4_10=(A[6])? _S4:S3;
assign S4_2 = (A[6])?{3'd0,c4}:4'd0;
BCDADD2 BB4(S4_10,8'h28,1'b0,_S5,c5);
BCDADD1 BB5(S4_2,1'h1,c5,_S51,c51);
assign bcd0=(A[7])?_S5[3:0]:S4_10[3:0];
assign bcd1=(A[7])?_S5[7:4]:S4_10[7:4];
assign bcd2=(A[7])?_S51:S4_2;

endmodule
