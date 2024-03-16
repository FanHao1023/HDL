module CWADD (btm,reset,Out0,Out1,Out2);
input btm,reset;
output [6:0] Out0,Out1,Out2;
wire [3:0] bcd0,bcd1,bcd2;
reg [7:0] Q;


always@(posedge btm or negedge reset)
 if(reset==1'b0)
   Q<=8'b0;
 else
   Q<=Q+1'b1;
BtoBCD u1(Q,bcd2,bcd1,bcd0);
_7Seg u2(bcd0,Out0);
_7Seg u3(bcd1,Out1);
_7Seg u4(bcd2,Out2);


endmodule