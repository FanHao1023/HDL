module Normalizer (Xin,Ein,E,F,z);
input [24:0] Xin;
input [7:0] Ein;
output [7:0] E;
output [22:0] F;
output z;
wire [4:0] Y,Ed;
wire hb;
wire [23:0] _F,_E;

PENC32 u0({7'd0,Xin},Y,z);
assign Ed=5'd23-Y;
assign E=z?23'd0:_E;
assign F=z?23'd0:_F;
assign _E=Xin[24]?(Ein+8'd1):(Ein-{3'd0,Ed});
assign {hb,_F}=Xin[24]?({1'b1,Xin[24:1]}):(Xin<<Ed);

endmodule