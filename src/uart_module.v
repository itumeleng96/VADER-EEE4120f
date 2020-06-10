`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: IJ Malemela
// 
// Create Date: 10.06.2020 16:16:28
// Design Name: SHAVADER
// Module Name: top
// Project Name: 
// Target Devices: Nexys 4
// Tool Versions: 
// Description: To test the UART Transmission and Reception
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module uart_module(
input  CLK100MHZ,
output  TXD,
input  RXD,
input  [7:0] SW,
output [7:0] LED
);


wire [7:0] data_from_PC; 
wire [7:0] data_to_PC;
reg WR;
parameter CLK_DIV = 24'h98967F;  //10 times per second
reg [23:0] div = 1'b0;

  uart_tx_rx UART(
      .clk(CLK100MHZ),
    .WR(WR),
    .DIN(data_to_PC),
    .DOUT(data_from_PC),
    .TX_ready(/* open */),
    .RX_ready(/* open */),
    .TXD(TXD),
    .RXD(RXD));

  always @(posedge CLK100MHZ) begin
    if((div == CLK_DIV)) begin
      div <= {24{1'b0}};
      WR <= 1'b1;
    end
    else begin
      div <= div + 1;
      WR <= 1'b0;
    end
  end

  assign LED = data_from_PC;
  assign data_to_PC = SW;

endmodule