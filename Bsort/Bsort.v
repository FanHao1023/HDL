module Bsort (clk,reset,sort,Din,qin,i,j,Aindex,Bindex,Aout,Bout,DinA,DinB,complete,D0,D1,D2,D3,D4,D5,D6,D7);
input clk,reset,qin,sort;
input [7:0] Din;
output [3:0] i,j;
output complete;
output [3:0] Aindex,Bindex;
output [7:0] Aout,Bout,DinA,DinB,D0,D1,D2,D3,D4,D5,D6,D7;
wire w_en,flag;
wire [3:0] bound;
reg ncomplete,_complete;


assign w_en=sort ;
Loopij_0_7 u0(clk,reset,w_en,i,j);
assign bound=(i==4'd7&&j==4'd6)?1'b1:1'b0;
assign Aindex=j;
assign Bindex=j+1;

reg2r2w u1(clk,qin,DinA,DinB,Aindex[2:0],Bindex[2:0],w_en,Din,Aout,Bout,D0,D1,D2,D3,D4,D5,D6,D7);
SwapBG u2(Aout,Bout,DinA,DinB,flag);

always @(negedge clk)
  ncomplete <= (flag==1'b1)?1'b1:(j==4'b0)?1'b0:ncomplete;
  
always @(posedge clk)
 if(reset)
  begin
   _complete<=1'b0;
  end
 else
  begin
   _complete<=(_complete)?_complete:(j==4'd6)?~ncomplete:1'b0;
  end
  
assign complete=bound|_complete;

  
endmodule