/*****************************************************************
 Pancham is an MD5 compliant IP core for cryptographic applicati
 -ons. 
 Copyright (C) 2003  Swapnajit Mittra, Project VeriPage
 (Contact email: verilog_tutorial at hotmail.com
  Website      : http://www.angelfire.com/ca/verilog)

 This library is free software; you can redistribute it and/or
 modify it under the terms of the GNU Lesser General Public
 License as published by the Free Software Foundation; either
 version 2.1 of the License, or (at your option) any later version.
 
 This library is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 Lesser General Public License for more details.
 
 You should have received a copy of the GNU Lesser General Public
 License along with this library; if not, write to the 
 
 Free Software Foundation, Inc.
 59 Temple Place, Suite 330
 Boston, MA  02111-1307 
 USA
 ******************************************************************/
/* 
 * This is the top level module for verification of pancham 
 *
 */
module top;

reg          clk;
reg          rst;
reg  [0:127] m_in;
reg    [0:7] m_in_w;
reg          m_in_val;

wire [0:127] m_out;
wire         m_out_val;
wire         ready;
//------------------------------
//
// Design Under Test 
//
//------------------------------
pancham MD5(
        .clk           (clk      )
      , .reset	       (rst      )
      , .msg_in        (m_in     )
      , .msg_in_width  (m_in_w   )
      , .msg_in_valid  (m_in_val )
                        
      , .msg_output    (m_out    )
      , .msg_out_valid (m_out_val)
      , .ready         (ready    )
      );

// Clock
initial 
   clk = 1'b0;

always 
   #5 clk = ~clk;

// Reset
initial begin // {
   rst = 1'b1;
   #12;
   rst = 1'b0;
end // }

// Message input vector
initial begin // {
   m_in_val = 1'b0;

   // Wait till the chip becomes ready
   wait (ready);
   #10 $display ("-------- MD5 started --------");
   m_in     = "abc"; // String to hash
   m_in_w   = 8'h70;
   m_in_val = 1'b1;
   #10;
   m_in_val = 1'b0;
   // Wait for the result to come out; then compare
   wait(m_out_val);
   
   // Print out the hash value 
   $display("MD5 hash: %h", m_out);

   // Wait for a while before finishing
   #100;
   $finish;
end //}

// 
initial begin // {
//   $dumpvars;
//   $monitor($time, ": State = %s, Phase = %b", MD5.ascii_state, MD5.phase);
//   $monitor($time, ": abcd = %h_%h_%h_%h, m = %h", MD5.A, MD5.B, MD5.C, MD5.D, MD5.m);
// $monitor($time, 
//          ": m_in = %h, m_in_w = %h, m_in_val = %h, m_out = %h, m_out_val = %h, ready = %b", 
//   m_in, 
//   m_in_w, 
//   m_in_val, 
//   m_out,
//   m_out_val,
//   ready);
end // }
endmodule
