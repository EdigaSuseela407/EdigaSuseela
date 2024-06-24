`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: moore_fsm
//////////////////////////////////////////////////////////////////////////////////
module moore_fsm(in,clk,rst,out);
input in,clk,rst;
output out; 
parameter s0=3'b000,
          s1=3'b001,
          s2=3'b010,
          s3=3'b011,
          s4=3'b100,
          s5=3'b101;
   reg[2:0] ps,ns;
   always@(posedge clk)begin
   if(rst)
   ps<=s0;
   else
   ps<=ns;
   end 
  always@(ps,in)
  begin
  case(ps)
  s0:ns=in?s1:s0;
   s1:ns=in?s2:s0;
    s2:ns=in?s2:s3;
     s3:ns=in?s4:s0;
      s4:ns=in?s5:s0;
       s5:ns=in?s1:s0;
    default:ns=s0;
    endcase
    end
    assign out=(ps==s5);
endmodule
