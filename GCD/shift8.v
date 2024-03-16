module shift8(clk,sin,clr,Q);
input sin,clk,clr;
output reg[7:0]Q;

always@(negedge clk)
  Q<=(clr)?8'd0:{Q[6:0],sin};
  
endmodule 