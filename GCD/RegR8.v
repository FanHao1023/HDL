module RegR8(load, clk, DIVN_, DIVN);
input load,clk;
input [7:0]DIVN_;
output reg[7:0]DIVN;
wire [7:0]d;

always@(negedge clk)
  DIVN<=(load)?DIVN_:{1'b0,DIVN[7:1]}; 
  
endmodule 