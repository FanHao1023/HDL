module Divider(DIVD_in, DIVN_in, clk_in, load, Q,R,Div_complete);
input [7:0] DIVD_in, DIVN_in;
input clk_in, load;
output [7:0] Q, R;
output Div_complete;
reg [2:0] count;
reg [7:0] DIVD;
wire [2:0] d, bn;
wire z, clk, sin;
wire [7:0] DIVN_, DIVN, DIVD_;

PENC8 U0(DIVN_in, bn, z);
assign d = 3'd7 - bn;
assign DIVN_ = DIVN_in << d;
assign clk = clk_in & ((|count) | load);
RegR8 U1(load, clk, DIVN_, DIVN);
shift8 U2(clk, sin, load, Q);
always @(negedge clk)
 begin
  count <= (load)? d+3'd1: count-3'd1;
  DIVD <= (load)? DIVD_in : DIVD_;
 end
 
assign sin = (DIVD >= DIVN)? 1'b1:1'b0;
assign DIVD_ = (sin)? (DIVD-DIVN) : DIVD;
assign R = DIVD;
assign Div_complete=(count==3'd0)?1'b1:1'b0;

endmodule 