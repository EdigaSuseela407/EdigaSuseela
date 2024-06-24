`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: moore_fsm_tb
//////////////////////////////////////////////////////////////////////////////////
module moore_fsm_tb;
reg in,clk,rst;
wire out;
moore_fsm dut(in,clk,rst,out);
always #5 clk=~clk;
initial begin
 clk=0;rst=1;in=1;
 #10 rst=0;in=1;
 #10 in=0;
 #10 in=1;
 #10 in=1;
 #10 in=0;
 #10 in=1;
 #20 $stop;
 $monitor("in=%b,clk=%b,rst=%b,out=%b",in,clk,rst,out);
 end 
 endmodule
