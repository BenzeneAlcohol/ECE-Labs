module 201EC149_SEQDET(
input x,clk,reset,
output reg y
);

parameter S0 = 0 , S1 = 1 , S2 = 2 , S3 = 3 ;
reg [1:0] PS, NS ;

    always@(posedge clk or posedge reset)
        begin
            if(reset)
                PS <= S0;   
            else    
                PS <= NS ;
        end             

    always@(PS or x)
        begin 
            
            case(PS)
                S0 : begin 
                            y = 0 ;
                            NS = x ? S1 : S0 ;
                        end
                S1 : begin 
                            y = 0 ;
                            NS = x ? S1 : S2 ;
                        end
                S2 : begin 
                            y = 0 ;
                            NS = x ? S3 : S0 ;
                        end 
                S3 : begin 
                            y = x ? 1 : 0 ; 
                            NS = x ? S1 : S2 ;
                        end

            endcase
        end
endmodule