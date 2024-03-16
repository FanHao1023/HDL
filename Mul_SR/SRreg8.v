module SRreg8(Din,load,clk,Dout);
input[7:0] Din;
input load,clk;
output[7:0] Dout;
reg[7:0] Dout;
wire[7:0] nDout;

always @(posedge clk)
   Dout<=nDout;

assign nDout=(load)?{1'b0,Dout[7:1]}:Din;

endmodule