module modulo32(a,b,out
    );
             input [31:0] a,b;
             output [31:0] out;
            // wire temp;
             assign {out}=a+b;
endmodule