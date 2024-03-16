module loop_1 (clk,rst,UB,LB,en,eni,i);
input clk,rst,en;
input [3:0] UB,LB;
output reg [3:0] i;
output reg eni;
wire cmpUB;
reg [3:0] i_temp;

always@(posedge clk or negedge en)
 if(en == 1'b0)
  begin
  i<=i;
  eni=1'b0;
  end
 else
  begin
  i <= i_temp;
  eni <= cmpUB;
  end
  
always@(rst or en or LB or UB or i)
 begin
  if(rst)
   i_temp <= LB;
  else
   if(en)
    if( i >= UB)
     i_temp <=LB;
    else
     i_temp <= i + 4'b1;
   else
    i_temp <= i;
 end
 
assign cmpUB = ((i_temp >= UB)? 1'b1: 1'b0)&en;

endmodule 