module HalfAdderdf(a,b,sum, carry);
 input a,b;
 output sum, carry;
 assign sum = a^b;
 assign carry = a&b;
endmodule
module FullAdder2haor(a, b, carryin, sum, carryout);
 input a,b, carryin;
 output sum, carryout;
 wire m, n, o;
 HalfAdderdf m1 (.a(a),.b(b),.sum(m),.carry(n));
 HalfAdderdf m2 (.a(carryin),.b(m),.sum(sum),.carry(o));
 assign y = n | o;
endmodule
