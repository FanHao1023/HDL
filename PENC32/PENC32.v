module PENC32 (A,Y,z);
input[31:0] A;
output[4:0] Y;
output z;
wire [3:0] Y0,Y1;
wire z0,z1;

PENC16 u0(A[15:0],Y0,z0);
PENC16 u1(A[31:16],Y1,z1);
assign Y=z1?{1'b0,Y0}:{1'b1,Y1};
assign z=z0&z1;

endmodule