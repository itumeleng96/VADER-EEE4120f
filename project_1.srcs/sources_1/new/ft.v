module ft(b,c,d,stage,out);
     input [1:0]stage;
     input [31:0] b,c,d;
     output reg [0:31] out;
     always@(*)
     begin
     case(stage)
     2'b00:out=((b&c)|((~b)&d));
     2'b01:out= b^c^d;
     2'b10:out=(((b&c)|(b&d))|(c&d));
     2'b11:out= b^c^d;
     endcase
     end
endmodule