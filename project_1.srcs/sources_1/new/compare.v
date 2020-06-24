`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2020 05:45:39 PM
// Design Name: 
// Module Name: compare_sha1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module compare_sha1(
    input clk,
    input [159:0] pass,
    input [159:0] dic,
    output reg ans
    );
    
    
    always @(posedge clk)
    begin
        $display("%h",pass);
        $display("%h", dic);
        if (pass == dic)
        ans<= 1;
        else 
        ans <= 0;
    end
    
endmodule