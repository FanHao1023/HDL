module SLreg16(Din,load,clk,Dout);
input[7:0] Din;
input load,clk;
output[15:0] Dout;
reg[15:0] Dout;
wire[15:0] nDout;

always @(posedge clk)
  Dout<=nDout;

assign nDout=(load)?{Dout[14:0],1'b0}:{8'd0,Din};

endmodule