module stack_nb (Din,clk,reset,push_btn,pop_btn,Dout,empty,full,Top);
input [7:0] Din;
input clk,push_btn,pop_btn,reset;
output [7:0] Dout;
output empty,full;
output reg[3:0] Top;
reg [7:0] Buf[7:0];
wire [3:0] _Top,nTop;
wire push,pop;

One_shot u0 (push_btn,clk,push);
One_shot u1 (pop_btn,clk,pop);

always @(negedge clk)
 if( ~reset)
  Top <= 4'b1000;
 else
  begin
   Top <= (push)? _Top:((pop)? nTop: Top);
   if(push)
    Buf[_Top[2:0]] <= Din;
  end
  
assign _Top = (Top==0)?4'd0:Top-1;
assign nTop = (Top >= 4'd8)? 4'd8:Top+1;
assign full = ~(|Top);
assign empty = Top[3];
assign Dout = Buf[Top[2:0]];

endmodule
