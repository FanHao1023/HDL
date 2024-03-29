module Divider (Ain,Bin,clk,start,Q,R,complete);
input [7:0] Ain,Bin;
input clk,start;
output [7:0] Q,R;
output reg complete;
reg [7:0] cQ,cA,cB;
reg [2:0] cD;
wire [7:0] nQ,nA,nB,SB;
wire [2:0] nD,PB;
wire ZB,gt,clkg;

PENC8 P0(Bin,PB,ZB);
assign SB = Bin <<(~PB);
assign clkg = (ZB)?1'b0:(start)?((&cD[2:0])?1'b0:1'b1):1'b1;
assign gt = (cA>=cB)? 1'b1:1'b0;
assign nA = (start)? ((gt)?(cA-cB):cA):(Bin==8'd1)?8'd0:Ain;
assign nB = (start)? {1'b0,cB[7:1]}:SB;
assign nQ = (start)? {cQ[6:0],gt}:(Bin==8'd1)?Ain:8'd0;
assign nD = (start)?(cD-3'd1):(~PB);
assign Q = cQ;
assign R = cA;

always @(posedge clk or negedge clkg)
 if(clkg== 1'b0)
  complete <= 1'b1;
 else
 begin
  cQ<=nQ;
  cA<=nA;
  cB<=nB;
  cD<=nD;
  complete <= 1'b0;
 end

endmodule