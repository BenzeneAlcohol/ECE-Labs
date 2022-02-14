module signmulti(input clock, reset, strt, input [3:0]A, B, output reg [7:0] P, output reg done);
localparam S0=0, S1=1, S2=2, S3=3, S4=4, S5=5;
reg [7:0] a_d, a_q, pdt_d, pdt_q;
reg [2:0] state_d, state_q;
reg [3:0] b_d, b_q;
assign P = pdt_q;
always @ (posedge clock , negedge reset)
begin
	if(!reset) state_q <=S0;
	else begin
	state_q <= state_d;
	pdt_q <=pdt_d;
	a_q <= a_d;
	b_q <= b_d;
	end
end

always @(*) begin
	state_d = state_q;
	done = 1'b0;
	case(state_q)
		S0:if(strt) state_d=S1;
		S1: state_d=S2;
		S2: state_d=S3;
		S3: state_d=S4;
		S4: state_d=S5;
		S5: begin
		done= 1'b1;
		if(strt)state_d =S1;
		end
		default: state_d=S0;
	endcase
end

always @(*)
begin
pdt_d = pdt_q; a_d = a_q; b_d = b_q;
case (state_q)
S0: begin
pdt_d = {8{1'b0}};
a_d = A;
b_d = B;
end
S1: begin
a_d = a_q << 1;
b_d = b_q >> 1;
if (b_q[0] == 1'b1) begin
	if(A[3] == 1'b1) pdt_d = {4'b1111,a_q[3:0]} +pdt_q; 
	else pdt_d = a_q + pdt_q;
	end
end
S2: begin
a_d = a_q << 1;
b_d = b_q >> 1;
if (b_q[0] == 1'b1) begin
	if(A[3] == 1'b1) pdt_d = {3'b111,a_q[4:1], 1'b0} +pdt_q; 
	else pdt_d = a_q + pdt_q;
	end
end
S3: begin
a_d = a_q << 1;
b_d = b_q >> 1;
if (b_q[0] == 1'b1) begin
	if(A[3] == 1'b1) pdt_d = {2'b11,a_q[5:2], 2'b00} +pdt_q; 
	else pdt_d = a_q + pdt_q;
	end
end
S4: begin
	a_d = a_q << 1;
	b_d = b_q >> 1;
	if (b_q[0] == 1'b1) begin
		if(B[3] == 1'b1) pdt_d = {1'b0, (~A+1'b1),3'b000} +pdt_q; 
		else if(A[3] == 1'b1) pdt_d = {1'b1,a_q[6:3], 3'b000} +pdt_q; 
		else pdt_d = a_q + pdt_q;
	end
end
default: pdt_d = pdt_q;
endcase
end
endmodule

module testsignedmulti();
reg clock, reset, strt;
reg [3:0] A, B;
wire [7:0] P;
wire done;
signmulti pp(.clock(clock), .reset(reset), .strt(strt), .A(A), .B(B), .P(P), .done(done));
initial
begin
	clock=0;reset=0; 
	#20; clock=1; 
	A=4'b1011; B= 4'b1101;
	#20 reset=1; clock=0; strt=1'b1;
	#20 clock =1; #20 clock=0;
	#20 clock =1; #20 clock=0;
	#20 clock =1; #20 clock=0;
	#20 clock =1; #20 clock=0;
	#20 clock =1; #20 clock=0;
	#20 clock =1; #20 clock=0;
	#20 clock =1; #20 clock=0;
end
endmodule
