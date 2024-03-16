module Mul_SR(A,B,clk,load,M,complete);
input[7:0] A,B;
input clk,load;
output[15:0] M;
output reg complete;
wire[15:0] _B;
wire[7:0] _A;
wire _clk;

assign _clk=(~complete)&clk;

SLreg16 u0(B,load,clk,_B);
SRreg8 u1(A,load,clk,_A);

Accreg16 u2(_B,_A[0],load,_clk,M);

always @(posedge clk)
  complete= (~|_A);

endmodule