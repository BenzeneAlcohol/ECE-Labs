module decoder_2to4_b(input wire I0,I1,e,output reg [3:0]f);
always@(*)
begin
casex(I1&I0&e)
3'b001 :f[0]=~I0&(~I1);
3'b011 :f[1]=I0&(~I1);
3'b101 :f[2]=~I0&(I1);
3'b111 :f[3]=I0&I1;
3'bxx0: f=4'b0000;
default :f=4'b0000;
endcase
end
endmodule
