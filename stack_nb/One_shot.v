module One_shot (btn,clk,Y);
input btn,clk;
output Y;
reg [1:0] ns,cs;

always@(posedge clk)
  cs<=ns;
always@(btn or cs)
 case(cs)
  2'd0:ns<=btn?3'd0:3'd1;
  2'd1:ns<=3'd2;
  2'd2:ns<=btn?3'd0:3'd2;
 endcase

 assign Y=(cs==2'd1)?1'b1:1'b0;
	
endmodule