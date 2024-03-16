module FADD(A,B,X);
input [31:0] A,B;
output [31:0] X;
wire As,Bs,Xs,cout,hb;
wire [7:0] Ae,Be,Xe,d;
wire [22:0] Af,Bf,Xf,_Xf;
wire [24:0] _Bf;

assign {As,Ae,Af}=A,
       {Bs,Be,Bf}=B;
assign Xs=As;
assign d=Ae-Be;
assign _Bf={1'b0,1'b1,Bf}>>d;
assign {cout,hb,_Xf}={1'b0,1'b1,Af}+_Bf;
assign Xe=Ae+{7'd0,cout};
assign Xf=(cout)?{hb,_Xf[22:1]}:_Xf;
assign X={Xs,Xe,Xf};

endmodule 