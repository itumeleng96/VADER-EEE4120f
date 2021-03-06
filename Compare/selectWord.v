`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2020 03:47:26 PM
// Design Name: 
// Module Name: selectWord
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


module selectWord(
    input clk, //clock
    input [20*8:0] Pass, // hashed password
    input [20*8:0] Dic, //hashed dictonary word
    output reg [20*8:0] word, //hashed dictonary word that's correct
    output reg done // register to inform process that matching hash has been found
    );
    
    wire ans;
    
    compare_sha1 cmp(clk, Pass, Dic, ans); // compares password to dictionary word
    
    always @(posedge clk)
    begin
    if (ans == 1) // if comparison returns 1, words are the same
    begin
    assign word = Pass; // assign hashed correct word
    done <= 1;
    end
    else
    
    done <=0;
    
    end
    
endmodule
