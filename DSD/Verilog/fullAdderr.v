module fullAdderdf(a, b, carryin, sum, carry);
 input a,b, carryin;
 output sum, carry;
 assign sum = carryin^(a^b);
 assign carry = (a&b) | carryin&(a^b);
endmodule
