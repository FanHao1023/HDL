module CSADD16(a,b,cin,s,cout);

input [15:0] a,b;
input cin;
output [15:0] s;
output cout;
wire [15:8] s10,s11;
wire c0,c1,c2;

ADD8 u0(a[7:0],b[7:0],cin,s[7:0],c0);
ADD8 u10(a[15:8],b[15:8],1'b0,s10[15:8],c1);
ADD8 u11(a[15:8],b[15:8],1'b1,s11[15:8],c2);
assign cout=c0?c2:c1;
assign s[15:8]=c0?s11:s10;

endmodule

