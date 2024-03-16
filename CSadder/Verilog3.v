module ADD8(a,b,cin,s,cout,ov);

input [7:0] a,b;
input cin;
output [7:0] s;
output cout,ov;
wire c,ov0;

ADD4 u0(a[3:0],b[3:0],cin,s[3:0],c,ov0);
ADD4 u1(a[7:4],b[7:4],c,s[7:4],cout,ov);

endmodule
