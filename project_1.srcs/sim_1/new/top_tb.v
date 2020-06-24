`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2020 19:01:17
// Design Name: 
// Module Name: top_tb
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


module top_tb();

    reg clk;
    reg reset;
    reg [127:0] password;
    reg enable;
    reg type; // 1 == sha1, 0 == md5
    wire ready;
    wire [159:0] hash_string;
    wire [63:0] guessed_word;
    
    
    // Compare module vars
    reg [159:0] pass; // hashed password
    wire [159:0] word; //hashed dictonary word that's correct
    wire done; // 
    
    initial begin
        clk = 1;
        pass = 160'h0000000081025db70a8c28d895a3c6218536fbf8;
        password = "";
        type = 0;
        enable = 0;
        reset = 1;
        #12
        reset = 0; 
    end
    
    always #5 clk = ~clk;
    
    hash hash(
        .clk(clk), 
        .reset(reset),
        .x_in(password), 
        .type(type), 
        .x_out(hash_string), 
        .hash_ready(ready)
    );
    
    selectWord select(
        .clk(enable), //clock
        .pass(pass), // hashed password
        .dic(hash_string), //hashed dictonary word
        .word(word), //hashed dictonary word that's correct
        .done(done) 
    );
    
    brute_force bf(.enable(enable), .x_out(guessed_word));
    
    always @(posedge clk)
    begin
        #5 enable = 0;
        password = guessed_word;
        wait(ready); // Wait for the hash function to finish
//        #2 // delay
        //enable = 1;
        
//        $display("%h", hash_string);
////      $display("hash: %h", hash_string);
//        wait(done);
        
//        $display("%h          %h", guessed_word, hash_string);
        if(done) $finish;
        else enable = 1;
//            $display("%h          %h", guessed_word, hash_string);
//            $finish;
        
        
        
    end
    
endmodule
