module Latch8(Din,clk,LE,Dout);
input [7:0] Din;
input clk,LE;
output [7:0] Dout;
reg [7:0] Dout;
wire le;

assign le= clk & LE;

always @(posedge le)
  Dout <= Din;
  
endmodule
