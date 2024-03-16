module FADD_0 (D,btm,Out0,Out1,Out2,Out3,Out4,Out5);
input [7:0] D;
input btm;
output [6:0] Out0,Out1,Out2,Out3,Out4,Out5;
wire [31:0] A,B,X;
wire [7:0] Q0;

In_Queue u0(D,btm,A,B,Q0);
FADD u1(A,B,X);
_7Seg u2(Q0[7:4],Out0);
_7Seg u3(Q0[3:0],Out1);
_7Seg u4(X[31:28],Out2);
_7Seg u5(X[27:24],Out3);
_7Seg u6(X[23:20],Out4);
_7Seg u7(X[19:16],Out5);

endmodule