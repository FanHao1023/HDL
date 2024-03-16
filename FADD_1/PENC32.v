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


module PENC16 (A,Y,z);
input[15:0] A;
output[3:0] Y;
output z;
wire [2:0] Y0,Y1;
wire z0,z1;

PENC8 u0(A[7:0],Y0,z0);
PENC8 u1(A[15:8],Y1,z1);
assign Y=z1?{1'b0,Y0}:{1'b1,Y1};
assign z=z0&z1;

endmodule


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


module PENC4 (A,Y,z);
input[3:0] A;
output[1:0] Y;
output z;

assign z=~|A;
assign Y[0]=A[3]|A[1]&~A[2];
assign Y[1]=A[2]|A[3];

endmodule