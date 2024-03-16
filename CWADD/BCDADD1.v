module BCDADD1(a,b,cin,s,cout);

input [3:0] a,b;
input cin;
output [3:0] s;
output cout;
wire c1,c0;
wire [3:0] s0,s1;

ADD4 u0(a,b,cin,s0,c0);
adjust u1(s0,s1,c1);

assign cout=c0|c1;
assign s=cout?s1:s0;

endmodule