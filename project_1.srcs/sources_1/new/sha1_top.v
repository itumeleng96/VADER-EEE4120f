`timescale 1ns / 1ps

module sha1_top(
    input clk,
    input enable,
    input reset,
    input [63:0] x_in, 
    output [159:0] x_out,
    output ready
   );
   
//    reg clk;
    reg [63:0] x,message, count;
    wire [159:0] y;
    wire [511:0] x_pad;
    reg [64:0] message_len;
    reg done;
    
    padding p1(x,x_pad,message_len);
    compressor c1(x_pad,y);
    
//    assign ready = 0;
    
    initial begin
        x = "a";
//        clk = 1;
        count = 0;
        message_len = (x % 8)*8;
    end
    
//    always #5 clk<=~clk;
    
    always @(posedge clk)
        begin
//            if(!reset && enable)
                begin
                    if(count == 0)
                        begin
                            x = x << 1;
                            #2
                            x = x | 1;
                            count <= count +1;
                        end
             
                    if(x[62] == 0) 
                    begin
                        x <=  x << 1;
                        count <= count+1;
                    end
                    else
                    begin
                       #5 done = 1;
//                        #5 $display("Sha1 hash string: %h", y);
                    end
                end
        end
    
    assign x_out = y;
    assign ready = done;
endmodule