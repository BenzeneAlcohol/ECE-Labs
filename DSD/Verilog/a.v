 module ques();

    reg [15:0] a, b;

      initial

           begin

               a = 1;

b = 2;

#1;

a <= b;

b <= a;

#1;

a <= b + 10;

b <= #5   b + 20;

#1;

b = #1   3;

b <= 4;

b <= #2   5;

b <= #10  6;

b = 7;

#20;

          end
  initial begin
    $monitor ("%d a=%1b b=%1b",$time, a,b);
  end
endmodule