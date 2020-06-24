`timescale 1ns / 1ps


module brute_force(
//    input clk, 
    input enable,
    output [63:0] x_out
    );

    localparam X = 36; // Number of bytes to store chars
    reg [X*8-1:0] chars ="abcdefghijklmnopqrstuvwxyz1234567890";
    reg [X*8-1:0] shiftedChars, shift2, shift3, shift4, shift5, shift6, shift7, shift8;
//    reg [7:0] passLen;
//    reg [3:0] pos, pos2;
    reg ready;
    reg [7:0] count;
    reg [63:0] password;
    reg [63:0] guessedWord;
    
//    reg clk;
    reg done;
    
    
    
    initial begin 
//        password= "aa5";
        guessedWord = "";
        shiftedChars = chars;
        shift2 = chars;
        shift3 = chars;
        shift4 = chars;
        shift5 = chars;
        shift6 = chars;
        shift7 = chars;
        shift8 = chars;
        count = 0;
//        clk = 1;
//        pos = 0;
//        pos2= 0;
        if(password == "")
            $finish;
    end
    
//   always #5 clk = ~clk;
    
    always @(posedge enable)
    begin
        if(enable)
        begin
        shiftedChars <= shiftedChars << 8;
        if(guessedWord[7:0]==chars[7:0])
            begin
//                pos <= pos +1;
//                shift2 = chars << 8*pos;
//                guessedWord[7:0] = shift2[10*8:10*8-8];
//                guessedWord = guessedWord << 8;
                if(guessedWord[7:0] == chars[7:0])
                    begin
                       
                        guessedWord[15:8] <= shift2[X*8:X*8-8];  
                         shift2 <= shift2 << 8;  
                    end         
                if(guessedWord[15:8] == chars[7:0])
                    begin
                        shift2 <= chars;
                        guessedWord[23:16] <= shift3[X*8:X*8-8]; 
                        guessedWord[15:8] = 0;   
                        shift3 <= shift3 << 8;
                    end
                if(guessedWord[23:16] == chars[7:0])
                    begin
                        shift3 <= chars;
                        guessedWord[31:24] <= shift4[X*8:X*8-8]; 
                        guessedWord[23:16] = 0;  
                        shift4 <= shift4 << 8; 
                    end
                 if(guessedWord[31:24] == chars[7:0])
                    begin
                        shift4 <= chars;
                        guessedWord[39:32] <= shift5[X*8:X*8-8]; 
                        guessedWord[31:24] = 0;
                        shift5 <= shift5 << 8;   
                    end 
                if(guessedWord[39:32] == chars[7:0])
                    begin
                        shift5 <= chars;
                        guessedWord[47:40] <= shift6[X*8:X*8-8]; 
                        guessedWord[39:32] = 0;
                        shift6 <= shift6 << 8;   
                    end 
                    
                if(guessedWord[47:39] == chars[7:0])
                    begin
                        shift6 <= chars;
                        guessedWord[55:48] <= shift7[X*8:X*8-8]; 
                        guessedWord[47:39] = 0; 
                        shift7 <= shift7 << 8;  
                    end 
                if(guessedWord[55:48] == chars[7:0])
                    begin
                        shift7 = chars;
                        guessedWord[63:56] <= shift8[X*8:X*8-8]; 
                        guessedWord[55:48] = 0; 
                        shift8 <= shift8 << 8;  
                    end 
                
                shiftedChars <= chars;
//                $display("pos: %h", pos);
            end
        
        
        guessedWord[7:0] = shiftedChars[X*8:X*8-8];
        ready = 1;
        end
//        $display("%h", guessedWord );
    end
    
//    always @(posedge clk)
//    begin
//        if(guessedWord == password)
//            begin
//                assign done = 1;
//                $display("Password found: %h ", guessedWord);
//                $finish;
//            end
//    end 
    assign x_out = guessedWord;
//    assign ready = done;    

endmodule
