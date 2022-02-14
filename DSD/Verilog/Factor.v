module factorial(input [2:0] n, output reg [15:0] y);
integer i;
always @ (n)
begin
    y = 1;
    i = 0;
for(i=1;i<=n;i = i + 1)
    y = i * y;
end
endmodule

module testfactorial;
	reg [2:0] n;
	wire [15:0] y;
	factorial pp(n, y);

	initial begin
	n = 3'b001; //1
	#200;
	n = 3'b010; //2
	#200;
	n = 3'b011; //3
	#200;
	n = 3'b100; //4
	#200;
	n = 3'b101; //5
	#200;
	n = 3'b110; //6
	#200;
	n = 3'b111; //7
	end
endmodule
