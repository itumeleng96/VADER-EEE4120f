module roundblock(a_in,b_in,c_in,d_in,e_in,a_out,b_out,c_out,d_out,e_out,w,k,stage
    );
input [31:0] a_in,b_in,c_in,d_in,e_in,w,k;
output [31:0] a_out,b_out,c_out,d_out,e_out;
input [1:0] stage;
wire [31:0] tempa,tempb,w1,w2,w3,ft_out;
assign tempa={a_in[26:0],a_in[31:27]};
assign tempb={b_in[1:0],b_in[31:2]};
ft f1(b_in,c_in,d_in,stage,ft_out);
assign a_out=e_in+ft_out+tempa+w+k;
assign b_out=a_in;
assign c_out=tempb;
assign d_out=c_in;
assign e_out=d_in;
endmodule