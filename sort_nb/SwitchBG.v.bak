module SwitchBG(A,B,Aout,Bout,flag);
input [7:0] A,B;
output [7:0] Aout,Bout;
output flag;

assign flag= (A>B)?1'b1:1'b0;
assign Aout=(flag)?B:A;
assign Bout=(flag)?A:B;

endmodule