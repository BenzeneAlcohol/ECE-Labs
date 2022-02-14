module division(X,Y,output);
    parameter wd = 8;
    input [wd-1:0] X;
    input [wd-1:0] Y;
    output [wd-1:0] output; 
    reg [wd-1:0] output = 0;
    reg [wd-1:0] ai, bi;
    reg [wd:0] pi;   
    integer i;

    always@ (X or Y)
    begin
        ai = X;
        bi = Y;
        pi = 0;
        for(i=0;i < wd;i=i+1)
		begin
            pi = {pi[wd-2:0],ai[wd-1]}; //Shifting left Ai
            ai[wd-1:1] = ai[wd-2:0]; 
            pi = pi-bi; // Ai = Ai - Y
            if(pi[wd-1] == 1)    begin 
                ai[0] = 0;
                pi = pi + bi;   end
            else
                ai[0] = 1;
        end
        output = ai;   
    end 

endmodule

module testdivision;
    parameter wd = 8;
    reg [wd-1:0] X;
    reg [wd-1:0] Y;
    wire [wd-1:0] output;
    division pp(X,Y,output);

    initial begin
        X = 30;    Y = 6; #100;
        X = 40;    Y = 3; #100;
        X = 100; Y = 20;  #100;
        X = 70; Y = 30; #100;
        X = 16; Y = 4;  #100;
        X = 190;    Y = 30;  #100;
    end
      
endmodule