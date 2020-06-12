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
    input [20*8:0] Pass,
    input [20*8:0] Dic,
    output reg ans
    );
    
    
    always @(posedge clk)
    begin
        if (Pass == Dic)
        ans<= 1;
        else 
        ans <= 0;
    end
    
endmodule
