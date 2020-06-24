module leftshift(y,x
    );
             input [31:0] x;
             output [31:0] y;
             assign y={x[30:0],x[31]};
endmodule