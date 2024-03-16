module GCD(A,B,start_BTN,reset,clk,Dout,GCD_complete);
input start_BTN,reset,clk;
input [7:0] A,B;
output [7:0] Dout;
output GCD_complete;
reg GCD_complete;
reg [2:0] cs,ns;
wire [7:0] R,Q;
reg [7:0] RA,RB;
wire Rz,start,DIV_complete;
reg DIV_start;
assign Dout = RB;
assign Rz= ~(|R);

One_shot U1(start_BTN, clk, start);

always @(negedge clk)
 if(start)
  begin
   RA<=A;
   RB<=B;
  end
 else
  begin
   if(cs==3)
    begin
     RA <= (DIV_complete)? RB:RA;
     RB <= (DIV_complete)? ((Rz)?RB:R):RB;
    end
   end
	
always @(negedge clk)
  cs<=ns;
always @(cs or start or reset or Rz or DIV_complete)
 if(reset==1'b0)
  ns <= 3'd0;
 else
  case(cs)
  3'd0: ns <= (start)?3'd1:3'd0;
  3'd1: ns <= 3'd2;
  3'd2: ns <= (DIV_complete)?3'd3:3'd2;
  3'd3: ns <= (Rz)?3'd4:3'd1;
  3'd4: ns <= 3'd4;
  default: ns <= 3'd0;
  endcase
always @(cs)
 case(cs)
 3'd0:begin
      DIV_start <= 1'b1;
      GCD_complete <= 1'b0;
      end
 3'd1:begin
      DIV_start <= 1'b0;
      GCD_complete <= 1'b0;
      end
 3'd2:begin
      DIV_start <= 1'b1;
      GCD_complete <= 1'b0;
      end
 3'd3:begin
      DIV_start <= 1'b1;
      GCD_complete <= 1'b0;
      end
 3'd4:begin
      DIV_start <= 1'b1;
      GCD_complete <= 1'b1;
      end
 default:begin
         DIV_start <= 1'b1;
         GCD_complete <= 1'b0;
         end
 endcase
 
Divider U0(RA,RB,clk,~DIV_start,Q,R,DIV_complete);

endmodule
