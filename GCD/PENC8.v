module PENC8 (A,Y,z);
input[7:0] A;
output[2:0] Y;
output z;
wire [1:0] Y0,Y1;
wire z0,z1;

PENC4 u0(A[3:0],Y0,z0);
PENC4 u1(A[7:4],Y1,z1);
assign Y=z1?{1'b0,Y0}:{1'b1,Y1};
assign z=z0&z1;

endmodule
