module Reg8_1R1W(Din,clk,wen,Addr,Dout);
parameter Dwidth=8,Awidth=3;
input [Awidth-1:0] Addr;
input clk,wen;
input [Dwidth-1:0] Din;
output [Dwidth-1:0] Dout;
wire [Dwidth-1:0] R[7:0];
wire [Dwidth-1:0] en;

Latch8 UR0(Din,clk,en[0],R[0]);
Latch8 UR1(Din,clk,en[1],R[1]);
Latch8 UR2(Din,clk,en[2],R[2]);
Latch8 UR3(Din,clk,en[3],R[3]);
Latch8 UR4(Din,clk,en[4],R[4]);
Latch8 UR5(Din,clk,en[5],R[5]);
Latch8 UR6(Din,clk,en[6],R[6]);
Latch8 UR7(Din,clk,en[7],R[7]);

DEC3to8 U0(Addr,wen,en);

MUX8to1_8 U1(R[0],R[1],R[2],R[3],R[4],R[5],R[6],R[7],Addr,Dout);

endmodule