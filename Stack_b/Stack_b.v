module Stack_b(Din,clk,reset,push_btn,pop_btn,Dout,empty,full,Top);
input [7:0] Din;
input clk,push_btn,pop_btn,reset;
output reg[7:0] Dout;
output empty,full;
output reg[3:0] Top;
reg [7:0] Buf[7:0];
wire push,pop;

One_shot u0(push_btn,clk,push);
One_shot u1(pop_btn,clk,pop);

always @(negedge clk)
  if( ~reset)
    Top = 4'b1000;
  else
    if(push)
      begin
      Top = Top-1;
      Buf[Top[2:0]]=Din;
		Dout=Buf[Top[2:0]];
      end
    else
      begin
      Top =(pop&~empty)? Top+1: Top;
      Dout= Buf[Top[2:0]];
    end
	 
assign full = ~(|Top);
assign empty = Top[3];

endmodule