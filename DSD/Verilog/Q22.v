module multiPlexer(A, B, S, Y);

input A, B, S;
output Y;
reg Y;
always @ (A or B or S)
	if(S)
	Y=A;
	if(!S)
	Y=B;
endmodule


module TestMultiPlexer;

reg A, B, S;
wire Y;

multiPlexer m0(A, B, S, Y);

inital begin 

A=0;
B=0;
C=0;
#100;
A=0;
B=0;
C=1;
#100;
A=0;
B=1;
C=0;
#100;
A=0;
B=1;
C=1;
#100;
A=1;
B=0;
C=0;
#100;
A=1;
B=0;
C=1;
#100;
A=1;
B=1;
C=0;
#100;
A=1;
B=1;
C=1;

end
endmodule
