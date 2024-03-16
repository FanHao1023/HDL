module Loopij_0_7(reset,clk,i,j);
input clk, reset;
output [2:0] i,j;
reg [2:0] i,j;
wire [2:0] ni,nj;

always@(posedge clk)
 begin
  if(reset)
   begin
    i<=0;
    j<=0;
   end
  else
   begin
	 i<=ni;
	 j<=nj;
	end 
 end
 
assign ni=(i>=7)?i:(j>=6)?i+1:i;
assign nj=(j>=6)?(i>=7)?j:4'd0:j+1;

endmodule 