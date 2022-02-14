module DecoderCase(input wire I0,I1,output reg [3:0]Q);
always@(*) 
begin
case(I1&I0)
2'b00 :Q[0]=~I0&(~I1); 
2'b01 :Q[1]=I0&(~I1);
2'b10 :Q[2]=~I0&(I1);
2'b11 :Q[3]=I0&I1;
default :Q=1'b0;
endcase
end
endmodule
