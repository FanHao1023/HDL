module Loopij_0_7(clk,reset,w_en,i,j);
input clk, reset,w_en;
output [3:0] i,j;
wire eni,enk,en;

assign en= w_en?((j==4'd6)&&(i==4'd7))?1'b0:1'b1:1'b0;

loop_1 LU_j(clk,reset,4'd6,4'd0,en,eni,j);
loop_1 LU_i(clk,reset,4'd7,4'd0,eni,enk,i);

endmodule
