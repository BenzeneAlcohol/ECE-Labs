module multiPlexer(A, B, S, Y);

input A, B, S;
output Y;
reg Y;
always @ (A or B or S)
	if(S)
	Y = A;
	else
	Y = B;
endmodule


module TestMultiPlexer;

reg A, B, S;
wire Y;

multiPlexer m0(A, B, S, Y);

initial begin 

A=0;
B=0;
S=0;
#100;
A=0;
B=0;
S=1;
#100;
A=0;
B=1;
S=0;
#100;
A=0;
B=1;
S=1;
#100;
A=1;
B=0;
S=0;
#100;
A=1;
B=0;
S=1;
#100;
A=1;
B=1;
S=0;
#100;
A=1;
B=1;
S=1;

end

endmodule
