module mux(a,b,s,c);
input a,b,s;
output c;

assign c=(s==1'b0)?a:b;

endmodule

