module TLCTL(clk,reset,TL);
input clk,reset;
output reg [5:0] TL;
reg [3:0] cs,ns;

always@(posedge clk)
  cs<=ns;
always@(cs or reset)
  if(reset==1'b0)
    ns<=4'd8;
  else
    if(cs>=4'd7)
	   ns<=4'd0;
	 else 
	   ns<=cs+1'b1;
always@(cs)
  if(cs<=4'd3)
    TL<=6'b100001;
  else if(cs==4'd4)
    TL<=6'b010001;
  else if(cs<+4'd6)
    TL<=6'b001100;
  else if(cs==4'd7)
    TL<=6'b001010;
  else 
    TL<=6'b000000;
	 
endmodule