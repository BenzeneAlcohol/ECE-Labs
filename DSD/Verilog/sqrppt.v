module SurpirseTestEC149(input start, input [5:0] inp, output done, output [5:0]reg sqroot);
	reg [5:0] A, B,C, done;
	always @(*)
	begin
		done=0;
		A = inp;
		B=1;
		C=0;
		while(!success)
		begin
			if(A>0)
			A=A-B;
			B=B+1;
			C=C+1;
			else 
			success=1;
		end
	end
	sqroot=C;
endmodule

