

module main(
input wire clk,
output wire TXD,
input wire RXD,
input wire [7:0] sw,
output wire [7:0] LED
);




wire [7:0] data_from_PC; wire [7:0] data_to_PC;
reg WR;
parameter CLK_DIV = 24'h98967F;  //10 times per second
reg [23:0] div = 1'b0;

  uart_tx_rx UART(
      .clk(clk),
    .WR(WR),
    .DIN(data_to_PC),
    .DOUT(data_from_PC),
    .TX_ready(/* open */),
    .RX_ready(/* open */),
    .TXD(TXD),
    .RXD(RXD));

  always @(posedge clk) begin
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
  assign data_to_PC = sw;

endmodule
