module stack(Din,clk,reset,push_btn,pop_btn,LED1,LED2,empty,full);
input [7:0] Din;
input clk,push_btn,pop_btn,reset;
output [6:0] LED1,LED2;
wire [7:0] Dout;
output empty,full;
reg wen;
reg[3:0] Top;
wire [3:0] _Top,nTop;
wire push,pop;

One_shot u0(push_btn,clk,push);
One_shot u1(pop_btn,clk,pop);

always @(negedge clk)
  if( ~reset)
   Top <= 4'b1000;
  else
   Top <= (push)? _Top:((pop)? nTop: Top);
	
assign _Top = (Top==0)?4'd0:Top-1;
assign nTop = (Top >= 4'd8)? 4'd8:Top+1;
assign full = ~(|Top);
assign empty = Top[3]; 

always @(negedge clk)
  wen <= (push)?((full)?1'b0 : 1'b1 ):1'b0;
  
Reg8_1W1R U2(Din,clk, wen,Top[2:0],Dout);
_7Seg u3(Dout[3:0],LED1);
_7Seg u4(Dout[7:4],LED2);
  
endmodule