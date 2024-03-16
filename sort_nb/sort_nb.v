module sort_nb(reset,clk,i,j,complete,D0,D1,D2,D3,D4,D5,D6,D7);
input reset,clk;
output i,j;
wire [2:0] i,j;
output complete;
reg _complete, ncomplete;
output[7:0] D0,D1,D2,D3,D4,D5,D6,D7;
reg[7:0] A[7:0],t,Aj,Aj1;
wire [7:0] nAj,nAj1;
wire flag;

Loopij_0_7 u0(reset,clk,i,j);
SwitchBG u1(A[j],A[j+1],nAj,nAj1,flag);

assign complete=_complete;

always @(posedge clk)
  ncomplete <= (flag==1'b1)?1'b1:(j==4'b0)?1'b0:ncomplete;
  
assign D0= A[0];
assign D1= A[1];
assign D2= A[2];
assign D3= A[3];
assign D4= A[4];
assign D5= A[5];
assign D6= A[6];
assign D7= A[7];

always @(posedge clk)
 if(reset)
  begin
   A[0]<=8'd4;
   A[1]<=8'd5;
   A[2]<=8'd1;
   A[3]<=8'd3;
   A[4]<=8'd2;
   A[5]<=8'd6; 
   A[6]<=8'd8;
   A[7]<=8'd7;
   _complete<=1'b0;
  end
 else
  begin
   A[j]<=nAj;
   A[j+1]<=nAj1;
   _complete<= (_complete)?_complete:((j==4'd6)? ~ncomplete:1'b0);
  end
  
endmodule