module MulF_Reg (clk,reset,shCount,LR,RS,UpDown,Din,Q);
input clk,reset,LR,RS,UpDown,shCount;
input[7:0] Din;
output reg [7:0] Q;
wire [7:0] nQ,nQ0,SL,SR,nCount,RL,RR,shD,RD,SD;

always@(posedge clk)
  Q<=nQ;

assign nQ=(reset)?nQ0:Din;
assign nQ0=(shCount)?shD:nCount;
assign nCount=(UpDown)?Q+1:Q-1;
assign shD=(RS)?RD:SD;
assign RD=(LR)?RL:RR;
assign SD=(LR)?SL:SR;

assign SL={Q[6:0],1'b0};
assign SR={1'b0,Q[7:1]};
assign RL={Q[6:0],Q[7]};
assign RR={Q[0],Q[7:1]};

endmodule

