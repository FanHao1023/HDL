module CSadder(a,b,cin,s,cout,ov);

input [31:0] a,b;
input cin;
output [31:0] s;
output cout,ov;
wire [15:8] s10,s11;
wire [23:16] s20,s21;
wire [31:24] s30,s31;
wire c0,c1,c2,c3,c4,c5,c6;
wire cout0,cout1;
wire ov0,ov1,ov2,ov3,ov4,ov5,ov6;


ADD8 u0(a[7:0],b[7:0],cin,s[7:0],c0,ov0);
ADD8 u10(a[15:8],b[15:8],1'b0,s10[15:8],c1,ov1);
ADD8 u11(a[15:8],b[15:8],1'b1,s11[15:8],c2,ov2);
assign cout0=(c0==1'b0)?c1:c2;
assign s[15:8]=(c0==1'b0)?s10[15:8]:s11[15:8];
ADD8 u20(a[23:16],b[23:16],1'b0,s20[23:16],c3,ov3);
ADD8 u21(a[23:16],b[23:16],1'b1,s21[23:16],c4,ov4);
assign cout1=(cout0==1'b0)?c3:c4;
assign s[23:16]=(cout0==1'b0)?s20[23:16]:s21[23:16];
ADD8 u30(a[31:24],b[31:24],1'b0,s30[31:24],c5,ov5);
ADD8 u31(a[31:24],b[31:24],1'b1,s31[31:24],c6,ov6);
assign cout=(cout1==1'b0)?c5:c6;
assign s[31:24]=(cout1==1'b0)?s30[31:24]:s31[31:24];
assign ov=ov6;

endmodule

