module Clock (clk,reset,ss,mm,hh,ss_in,mm_in,hh_in);
input clk,reset;
output reg [5:0] ss,mm,hh;
input [5:0] ss_in,mm_in,hh_in;

always @(negedge clk or negedge reset)
 if(reset==1'b0)
  begin
   ss=ss_in;
   mm=mm_in;
   hh=hh_in;
  end
 else
  begin
   ss=ss+1;
    if(ss >= 6'd60)
     begin
      ss=6'd0;
      mm=mm+1;
       if(mm >= 6'd60)
         begin
          mm=6'd0;
          hh=hh+1;
          if(hh >= 24)
           hh=0;
         end
       else
         hh=hh;
         end
    else
     begin
      mm=mm;
      hh=hh;
     end
 end
 
 endmodule