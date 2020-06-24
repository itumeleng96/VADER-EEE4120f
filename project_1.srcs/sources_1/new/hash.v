`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2020 13:04:51
// Design Name: 
// Module Name: hash
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


module hash(
        input clk, 
        input reset,
        input [127:0] x_in, 
        input type, 
        output [159:0] x_out, 
        output hash_ready
    );
    
//    reg clk;
    reg [0:127] password;
    reg [63:0] sha1_input;
    
    wire [159:0] sha1_hash;
    wire [0:127] md5_hash;
    wire sha1_ready;
    wire md5_ready;
    
    reg ready;
//    reg reset;
    reg [159:0] m_out;
    
    reg    [0:7] m_in_w;
    reg          m_in_val;
//    reg type;
    
    initial begin
//      clk = 1;
//      type = 0;
//      password = x_in;
//      $display("input: %h", x_in);
//      sha1_input = {{password[64:127]}};
//      reset = 1;
//      #12
//      reset = 0; 
      
    end
    
//    always #5 clk = ~clk;
    
    sha1_top sha(
        .clk(clk),
        .reset(reset),
        .x_in(sha1_input), 
        .x_out(sha1_hash),
        .ready(sha1_ready),
        .enable(type)
    );
   
   pancham MD5(
        .clk           (clk      )
      , .reset	       (reset      )
      , .msg_in        (x_in     )
      , .msg_in_width  (m_in_w   )
      , .msg_in_valid  (m_in_val )
                        
      , .msg_output    (md5_hash    )
      , .msg_out_valid (m_out_val)
      , .ready         (md5_ready    )
      );
    
    always @(posedge clk)
    begin
        if(reset)
            begin
                password = "";
//                $display("input: %h", x_in);
                sha1_input = {{password[64:127]}};
            end
        else
        begin
            password = x_in;
            sha1_input = {{password[64:127]}};
//             $display("input: %h", x_in);
            if(type == 1)
                begin
                    wait(sha1_ready);
                    #20
                    m_out = sha1_hash;
                    ready = 1;
                    $display("hash: %h",sha1_hash);
                    $finish;
                end
             else
                begin
                    #10 ready = 0;
                    wait(md5_ready)
                    #20
                    m_in_w   = 8'h8;
                    m_in_val = 1'b1;
                    #15;
                    m_in_val = 1'b0;
                    wait(m_out_val)
                    #10
                    m_out = md5_hash;
    //                #10
                    ready = 1;
                   
//                    $display("hash %h", md5_hash); 
    //                $finish;
                end
           end
    end
  
    assign hash_ready = ready;
    assign x_out = m_out;
endmodule