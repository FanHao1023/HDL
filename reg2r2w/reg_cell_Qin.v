module reg_cell_Qin (clk,qin,leA,leB,DinA,DinB,Dq,Dout);
input [7:0] DinA,DinB,Dq;
input clk,leA,leB,qin;
output [7:0] Dout;
reg [7:0] Dout;
wire le;
wire [7:0] Din;

assign Din=(qin)?Dq:(leA)?DinA:DinB;
assign le= clk & (leA|leB|qin);

always @(posedge le)
  Dout <= Din;
  
endmodule
