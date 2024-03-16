module reg2r2w(clk,qin,DinA,DinB,AIndex,BIndex,w_en,data,Aout,Bout);
input clk,qin;
input w_en;
input[2:0] AIndex,BIndex;
input[7:0] DinA,DinB,data;
output[7:0] Aout,Bout;
wire[7:0] dout0,dout1,dout2,dout3,dout4,dout5,dout6,dout7;
wire[7:0] LEA,LEB;

DEC3to8 d0(AIndex,w_en,LEA);
DEC3to8 d1(BIndex,w_en,LEB);

reg_cell_Qin r0(clk,qin,LEA[0],LEB[0],DinA,DinB,data,dout0);
reg_cell_Qin r1(clk,qin,LEA[1],LEB[1],DinA,DinB,dout0,dout1);
reg_cell_Qin r2(clk,qin,LEA[2],LEB[2],DinA,DinB,dout1,dout2);
reg_cell_Qin r3(clk,qin,LEA[3],LEB[3],DinA,DinB,dout2,dout3);
reg_cell_Qin r4(clk,qin,LEA[4],LEB[4],DinA,DinB,dout3,dout4);
reg_cell_Qin r5(clk,qin,LEA[5],LEB[5],DinA,DinB,dout4,dout5);
reg_cell_Qin r6(clk,qin,LEA[6],LEB[6],DinA,DinB,dout5,dout6);
reg_cell_Qin r7(clk,qin,LEA[7],LEB[7],DinA,DinB,dout6,dout7);

out_sel oa(dout0,dout1,dout2,dout3,dout4,dout5,dout6,dout7,AIndex,Aout);
out_sel ob(dout0,dout1,dout2,dout3,dout4,dout5,dout6,dout7,BIndex,Bout);

endmodule 