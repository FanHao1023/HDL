module One_shot (btn,clk,_Y,Y);
input btn,clk;
output Y,_Y;
reg [2:0] ns,cs;
reg Y;

always@(posedge clk)
  cs<=ns;
always@(btn or cs)
 case(cs)
  3'd0:ns<=btn?3'd0:3'd1;
  3'd1:ns<=btn?3'd0:3'd2;
  3'd2:ns<=btn?3'd0:3'd3;
  3'd3:ns<=3'd4;
  3'd4:ns<=btn?3'd0:3'd4;
 endcase

 assign _Y=(cs==3'd3)?1'b1:1'b0;
 
 always@(negedge clk)
   Y<=_Y;
	
endmodule