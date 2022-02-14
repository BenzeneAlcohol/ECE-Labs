module myHalfAdder(X, Y, S, C);
	input X,Y;
	output S,C;
		xor(S, X, Y);
		and(C, X, Y);
endmodule

module HA();
    reg x,y;
    wire s,c;

myHalfAdder a1(x,y,s,c);

initial
    begin
        x=1'b0;
        y=1'b0;
        #100
        x=1'b1;
        y=1'b0;
	#100
	x=1'b0;
	y=1'b1;
	#100
	x=1'b1; 
	y=1'b1;
    end
endmodule