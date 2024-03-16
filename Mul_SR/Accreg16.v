module Accreg16(Din,en,reset,clk,Dout);
input[15:0] Din;
input en,reset,clk;
output[15:0] Dout;
reg[15:0] Dout;
wire[15:0] nDout,A;

assign A=(en)?Din:16'd0;
assign nDout=(reset)?Dout+A:16'd0;

always @(posedge clk)
  Dout<=nDout;

endmodule