module adjust(a,c,cout);

input [3:0] a;
output [3:0] c;
output cout;

assign c[0]=a[0],
       c[1]=~a[1],
		 c[2]=~(a[1]^a[2]),
		 c[3]=(a[1]|a[2])^a[3],
		 cout=(a[1]|a[2])&a[3];

endmodule