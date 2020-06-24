module padding(x,y, message_len);
input [63:0] x;
output [511:0] y;
input [64:0] message_len;

assign y[511:448]=x[63:0];
assign y[447:64]=1'b0;
assign y[63:0]= message_len;
endmodule