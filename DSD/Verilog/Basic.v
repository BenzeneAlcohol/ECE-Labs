module ALU(X,Y,Z, Carry);
	input [15:0] X, Y;
	output [15:0] Z;
	output Carry;
assign {Carry, Z} = X + Y;
endmodule
