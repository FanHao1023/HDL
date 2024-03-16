module PENC4 (A,Y,z);
input[3:0] A;
output[1:0] Y;
output z;

assign z=~|A;
assign Y[0]=A[3]|A[1]&~A[2];
assign Y[1]=A[2]|A[3];

endmodule