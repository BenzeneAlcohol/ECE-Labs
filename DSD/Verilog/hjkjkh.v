module TDDC(input C_Up,
input load,
input reset,
input C_On,
input clk,
input [7:0] data_in,
output [7:0] count,
output TC);
wire n1;
decadeCounter cunit(C_Up,
load,
reset,
C_On,
clk,
data_in[3:0],
count[3:0],
n1);
decadeCounter cdigit(C_Up,
load,
reset,
C_On,
n1,
data_in[7:4],
count[7:4],
TC);
endmodule

module TB_Q2();
integer i;
reg clk, C_On, resetn, load, C_Up;
reg [7:0] data_in;
wire [7:0] count;
wire TC;
TDDC d1(C_Up,
load, resetn, C_On,
clk, data_in, count, TC);
initial
begin
resetn=1;#1; resetn=0; #1; resetn=1;
load=0; data_in =8'b01001000;
C_On=1; C_Up =1;
for( i=0; i<20; i=i+1)begin
clk =1; #20; clk =0; #20;
end
load =1;
clk =1; #20; clk =0; #20; load =0;
C_Up =0;
for( i=0; i<20; i=i+1)begin
clk =1; #20; clk =0; #20;
end
end
endmodule