module Reg8_2W2R(Ain,Bin,clk,wen,Aindex,Bindex,Aout,Bout);
parameter Dwidth=8,Awidth=3;
input [Awidth-1:0] Aindex,Bindex;
input clk,wen;
input [Dwidth-1:0] Ain,Bin;
output [Dwidth-1:0] Aout,Bout;
wire [Dwidth-1:0] R[7:0],Din[7:0];
wire [Dwidth-1:0] LE,LEA,LEB;

DEC3to8 U0(Aindex,wen,LEA);
DEC3to8 U1(Bindex,wen,LEB);

assign LE[0]=LEA[0]|LEB[0];
assign LE[1]=LEA[1]|LEB[1];
assign LE[2]=LEA[2]|LEB[2];
assign LE[3]=LEA[3]|LEB[3];
assign LE[4]=LEA[4]|LEB[4];
assign LE[5]=LEA[5]|LEB[5];
assign LE[6]=LEA[6]|LEB[6];
assign LE[7]=LEA[7]|LEB[7];

assign Din[0]=LEA[0]?Ain:Bin;
assign Din[1]=LEA[1]?Ain:Bin;
assign Din[2]=LEA[2]?Ain:Bin;
assign Din[3]=LEA[3]?Ain:Bin;
assign Din[4]=LEA[4]?Ain:Bin;
assign Din[5]=LEA[5]?Ain:Bin;
assign Din[6]=LEA[6]?Ain:Bin;
assign Din[7]=LEA[7]?Ain:Bin;


Latch8 UR0(Din[0],clk,LE[0],R[0]);
Latch8 UR1(Din[1],clk,LE[1],R[1]);
Latch8 UR2(Din[2],clk,LE[2],R[2]);
Latch8 UR3(Din[3],clk,LE[3],R[3]);
Latch8 UR4(Din[4],clk,LE[4],R[4]);
Latch8 UR5(Din[5],clk,LE[5],R[5]);
Latch8 UR6(Din[6],clk,LE[6],R[6]);
Latch8 UR7(Din[7],clk,LE[7],R[7]);

MUX8to1_8 U2(R[0],R[1],R[2],R[3],R[4],R[5],R[6],R[7],Aindex,Aout);
MUX8to1_8 U3(R[0],R[1],R[2],R[3],R[4],R[5],R[6],R[7],Bindex,Bout);

endmodule

