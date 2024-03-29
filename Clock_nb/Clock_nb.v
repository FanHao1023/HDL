module Clock_nb (clk,reset,ss,mm,hh,ss_in,mm_in,hh_in);
input clk,reset;
output reg [5:0] ss,mm,hh;
input [5:0] ss_in,mm_in,hh_in;
wire [5:0] nss,nmm,nhh;

always@(negedge clk or negedge reset)
if(reset==1'b0)
begin
ss <= ss_in;
mm<=mm_in;
hh<=hh_in;
end
else
begin
ss<=nss;
mm<=nmm;
hh<=nhh;
end 

assign nss=(ss>=6'd59)?6'd0:ss+1;
assign nmm=(ss>=6'd59)?((mm>=6'd59)?6'd0:mm+1):mm;
assign nhh=((ss>=6'd59)&&(mm>=6'd59))?((hh>=6'd23)?6'd0:hh+1):hh;

endmodule