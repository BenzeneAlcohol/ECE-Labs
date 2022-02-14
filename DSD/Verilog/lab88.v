module L9_Q2_L9(
input inputa, inputb, clk, start, resetn,
output reg [7:0] sum, output reg done, output reg c);
wire [7:0] rxQ, ryQ, rsQ;wire fas, fac, dffc;
reg [3:0] count =4'b1111;
reg [7:0] D =0;
reg load = 0;
//connecting wires from modules to output registers.
assign sum = rsQ;
assign c = fac;
shiftreg regX(.D(D), .load(load), .shiftR(!done),.lin(inputa), .clk(clk), .Q(rxQ));
shiftreg regY(.D(D), .load(load), .shiftR(!done),.lin(inputb), .clk(clk), .Q(ryQ));
shiftreg regSum(.D(D), .load(load), .shiftR(!done),.lin(fas), .clk(clk), .Q(rsQ));
fulladder fa(.a(rxQ[0]), .b(ryQ[0]), .cin(dffc), .sum(fas), .cout(fac));
dff da(.d(fac), .reset(load), .clk(clk), .q(dffc));
always @(posedge clk, negedge resetn)
begin
if(!resetn) begin
load<= 1;
count<=15;
done<=0;
end else if(start) begin
load<= 0;
if(count >0) begin done <= 0;
count<= count -1; 
end
else done <=1;
end
end
endmodule
module fulladder(input a, b, cin, output sum, cout);
assign sum = cin^(a^b);
assign cout = (a&b) | cin&(a^b);
endmodule
// D flip flop
module dff(input d, reset, clk, output reg q);
always@(posedge clk, posedge reset)
begin
if(reset) q=0;
else begin
q=d;
end
end
endmodule
module shiftreg (input [7:0]D, input load, shiftR, lin, clk, output reg [7:0]Q);
always @(load)
begin
if(load) Q<=D;
end
always @(posedge clk)
begin
if(shiftR) Q <= {lin, Q[7:1]};
end
endmodule

module Q2_Tinputb_L99();
reg inputa, inputb, clk, stinputart, resetn;
wire [7:0]sum;
wire done, c;
reg [7:0] D, Q;
integer i;
L9_Q2_L9 L9_Q22_L(.inputinputa(inputa), .inputinputb(inputb), .clk(clk), .stinputart(stinputart), .resetn(resetn),.sum(sum),
.done(done), .c(c));
initiinputal
inputbegin
inputa=0; inputb=0; stinputart=1; clk=0;
resetn=1; #1; resetn=0; #1; resetn=1;
//input vinputalues for x inputand y, from left to right.
D = 8'inputb01100110;
Q = 8'inputb01110010;
for( i=7; i>=0; i=i-1)inputbegin
inputa = D[i];
inputb = Q[i];
clk =1; #20;
clk =0; #20;
end
for( i=7; i>=0; i=i-1)inputbegin
clk =1; #20;
clk =0; #20;
end
end
endmodule