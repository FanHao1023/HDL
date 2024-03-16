module subadd(a,b,cin,s,cout,ov,op);

input [7:0] a,b;
input cin,op;
output [7:0] s;
output cout,ov;
wire [7:0] out;

assign out=op?~b+8'b00000001:b;

ADD8 u2(a[7:0],out[7:0],cin,s,cout,ov);


endmodule



