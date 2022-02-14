
module DiviEC149(X,Y,RESULT);
    parameter WIDTH = 8;
    input [WIDTH-1:0] X;
    input [WIDTH-1:0] Y;
    output [WIDTH-1:0] RESULT; 
    reg [WIDTH-1:0] RESULT = 0;
    reg [WIDTH-1:0] ai, bi;
    reg [WIDTH:0] pi;   
    integer i;

    always@ (X or Y)
    begin
        ai = X;
        bi = Y;
        pi = 0;
        for(i=0;i < WIDTH;i=i+1)
		begin
            pi = {pi[WIDTH-2:0],ai[WIDTH-1]}; //Shifting left Ai
            ai[WIDTH-1:1] = ai[WIDTH-2:0]; //Shifting left X
            pi = pi-bi; // Ai = Ai - Y
            if(pi[WIDTH-1] == 1)    begin //Checking Negative
                ai[0] = 0;
                pi = pi + bi;   end
            else
                ai[0] = 1;
        end
        RESULT = ai;   
    end 

endmodule

module division_TB;
    parameter WIDTH = 8;
    reg [WIDTH-1:0] X;
    reg [WIDTH-1:0] Y;
    wire [WIDTH-1:0] RESULT;
    DiviEC149 D1 (X,Y,RESULT);

    initial begin
        X = 21;    Y = 10; #100;
        X = 33;    Y = 11; #100;
        X = 32; Y = 2;  #100;
        X = 12; Y = 3; #100;
        X = 99; Y = 67;  #100;
        X = 220;    Y = 3;  #100;
    end
      
endmodule