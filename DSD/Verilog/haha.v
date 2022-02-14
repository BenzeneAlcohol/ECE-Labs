module RCSC( NReset, clk, Q);
parameter n =8;
input NReset, clk;
output reg [n-1:0] Q;
always @(negedge NReset, posedge clk)
begin
if(!NReset) Q<={1'b1, {n-2{1'b0}}};
else begin
Q <= Q >> 1;
Q[n-1] <= Q[7] ^ Q[3] ^ Q[2] ^Q[1];
end
end
endmodule

module TB_Q6();
integer i;
reg NReset, clk;
wire [7:0] Q;
RCSC TesTB(NReset, clk, Q);
initial
begin
NReset=1;#1; NReset=0; #1; NReset=1;
for( i=0; i<50; i=i+1)begin
clk =1; #20; clk =0; #20;
end
end
endmodule