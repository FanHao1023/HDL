module adder(s,a,b,cin,cout);

input [3:0] a,b;
input cin;
output [3:0] s;
output cout;
wire [3:0] p,g;
wire [2:0] c;

assign p[0]=a[0]^b[0],
       p[1]=a[1]^b[1],
		 p[2]=a[2]^b[2],
		 p[3]=a[3]^b[3];

assign g[0]=a[0]&b[0],
       g[1]=a[1]&b[1],
		 g[2]=a[2]&b[2],
		 g[3]=a[3]&b[3];

assign c[0]=g[0]|(p[0]&cin),
       c[1]=g[1]|(p[1]&g[0])|(p[1]&p[0]&cin),
		 c[2]=g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&cin),
		 cout=g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&cin);
		 
assign s[0]=p[0]^cin,
       s[1]=p[1]^c[0],
		 s[2]=p[2]^c[1],
		 s[3]=p[3]^c[2];
		 
endmodule