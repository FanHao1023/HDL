module FADD_1(A,B,X);
input [31:0] A,B;
output [31:0] X;
wire As,Bs,Xs,s,cout,hb,As1,Bs1;
wire [7:0] Ae,Be,Xe,d,Ae1,Be1;
wire [22:0] Af,Bf,Xf,Af1,Bf1;
wire [25:0] _Af,_Bf,Afs,Bfs;
wire[24:0] Xfs,_Xf;
wire [31:0] _A,_B;
wire z;

assign {As,Ae,Af} = A;
assign {Bs,Be,Bf} = B;

assign _A=(Ae>Be)?A:(Ae==Be)?(Af>Bf)?A:B:B;
assign _B=(_A==A)?B:A;
assign {As1,Ae1,Af1} = _A;
assign {Bs1,Be1,Bf1} = _B;  
assign _Af = {1'b0,1'b0,1'b1,Af1};
assign d = Ae1-Be1;
assign _Bf = {1'b0,1'b0,1'b1,Bf1}>> d;
assign Afs=(As1)? (~_Af +1): _Af;
assign Bfs=(Bs1)? (~_Bf +1): _Bf;
assign {s,Xfs} = Afs+Bfs;
assign _Xf=(s)? ~Xfs+1: Xfs;
Normalizer U0(_Xf, Ae1, Xe, Xf,z);
assign Xs=z?1'b0:s;
assign X = {Xs,Xe,Xf};

endmodule