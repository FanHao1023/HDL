module In_Queue(D,clk,A,B,Q0);
input clk;
input [7:0] D;
output [31:0] A,B;
output [7:0] Q0;
reg [7:0] Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;

assign A={Q3,Q2,Q1,Q0};
assign B={Q7,Q6,Q5,Q4};
always @(posedge clk)
begin
Q0<=D;
Q1<=Q0;
Q2<=Q1;
Q3<=Q2;
Q4<=Q3;
Q5<=Q4;
Q6<=Q5;
Q7<=Q6;
end
endmodule