module DEC3to8(A,en,Y);
input [2:0] A;
input en;
output [7:0] Y;
reg [7:0] _Y;

always @(A)
  case(A)
  3'd0: _Y <= 8'b00000001;
  3'd1: _Y <= 8'b00000010;
  3'd2: _Y <= 8'b00000100;
  3'd3: _Y <= 8'b00001000;
  3'd4: _Y <= 8'b00010000;
  3'd5: _Y <= 8'b00100000;
  3'd6: _Y <= 8'b01000000;
  3'd7: _Y <= 8'b10000000;
  endcase
  
assign Y=(en)?_Y:8'd0;

endmodule