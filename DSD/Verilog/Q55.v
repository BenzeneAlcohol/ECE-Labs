module Q5(input A, B, C, D, output Y);
	assign Y = ~((~(A|B))|(~(A|C))|(~(A|D))|(~(B|C))|(~(B|D))|(~(C|D)));
endmodule
