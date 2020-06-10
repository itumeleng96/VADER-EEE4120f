`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: IJ Malemela
// 
// Create Date: 10.06.2020 16:16:28
// Design Name: SHAVADER
// Module Name: 
// Project Name: 
// Target Devices: Nexys 4
// Tool Versions: 
// Description: UART
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//9600 baud rate, 8 data bits, no parity, 1 stop bit
// no timescale needed

module uart_tx_rx(
input  clk,
input  WR,
input  [7:0] DIN,
output reg [7:0] DOUT,
output reg TX_ready,
output reg RX_ready,
output reg TXD,
input  RXD
);


//CLOCK
//100 MHz/9600 baud rate  = 10416 = 0x28B0

parameter CLK_DIV = {2'b10,12'h8B0};      //100 MHz/9600/2 = 5208 = 0x1458
parameter CLK_DIV_HALF = {1'b1,12'h458};  //TRANSMISSION

reg [13:0] TX_div = 1'b0;                  //frame = 1 start + 8 data + 1 stop = 10 bits
reg [9:0] TX_frame = {1'b1,8'hff,1'b0};

parameter [1:0]
  READY = 0,
  LOAD_BIT = 1,
  SEND_BIT = 2;

reg [1:0] TX_state = READY; 
reg [1:0] TX_next_state = READY;
reg [31:0] TX_bitIndex;  // index of the next bit in TX_frame to be transferred

//RECEPTION
reg [13:0] RX_div = 1'b0;
reg [9:0] RX_frame;  //1 start + 8 data + 1 stop = 10 bits

parameter [2:0]
  DETECT_START_BIT = 1,
  READ_BIT = 2,
  PUT_BIT = 3,
  DATA_READY = 4,
  DONE = 5;

reg [2:0] RX_state = READY; 
reg [2:0] RX_next_state = READY;
reg [31:0] RX_bitIndex;                 // index of the next bit in the RX_frame to be received

//------------------------------------------------------
//-TRANSMISSION
//------------------------------------------------------
  always @(posedge clk) begin
    TX_state <= TX_next_state;
  end

  always @(posedge clk) begin
    case(TX_state)
    READY : begin
      TX_ready <= 1'b1;
      TX_bitIndex <= 0;
      TXD <= 1'b1;
      // idle
      TX_div <= {14{1'b0}};
      if((WR == 1'b1)) begin
        TX_frame <= {1'b1,DIN,1'b0};
      end
    end
    LOAD_BIT : begin
      TX_ready <= 1'b0;
      TX_div <= {14{1'b0}};
      TX_bitIndex <= TX_bitIndex + 1;
      TXD <= TX_frame[TX_bitIndex];
    end
    SEND_BIT : begin
      TX_ready <= 1'b0;
      TX_div <= TX_div + 1;
    end
    endcase
  end

  always @(TX_state, WR, TX_div, TX_bitIndex) begin
    case(TX_state)
    READY : begin
      if((WR == 1'b1)) begin
        TX_next_state <= LOAD_BIT;
      end
      else begin
        TX_next_state <= READY;
      end
    end
    LOAD_BIT : begin
      TX_next_state <= SEND_BIT;
    end
    SEND_BIT : begin
      if((TX_div >= CLK_DIV)) begin
        if((TX_bitIndex == TX_frame)) begin
          TX_next_state <= READY;
        end
        else begin
          TX_next_state <= LOAD_BIT;
        end
      end
      else begin
        TX_next_state <= SEND_BIT;
      end
    end
    default : begin
      // should never be reached
      TX_next_state <= READY;
    end
    endcase
  end

//------------------------------------------------------
//-RECEPTION
//------------------------------------------------------
  always @(posedge clk) begin
    RX_state <= RX_next_state;
  end

  always @(posedge clk) begin
    case(RX_state)
    READY : begin
      RX_ready <= 1'b0;
      RX_div <= {14{1'b0}};
      RX_bitIndex <= 0;
    end
    DETECT_START_BIT : begin
      RX_ready <= 1'b0;
      RX_div <= RX_div + 1;
    end
    PUT_BIT : begin
      RX_ready <= 1'b0;
      RX_bitIndex <= RX_bitIndex + 1;
      RX_frame[RX_bitIndex] <= RXD;
      RX_div <= {14{1'b0}};
    end
    READ_BIT : begin
      RX_ready <= 1'b0;
      RX_div <= RX_div + 1;
    end
    DATA_READY : begin
      RX_ready <= 1'b0;
      DOUT <= RX_frame[8:1];
      //extract only data bits
      RX_div <= {14{1'b0}};
    end
    DONE : begin
      RX_ready <= 1'b1;
      RX_div <= {14{1'b0}};
    end
    endcase
  end

  always @(RX_state, RXD, RX_div, RX_bitIndex) begin
    case(RX_state)
    READY : begin
      if((RXD == 1'b1)) begin
        //idle
        RX_next_state <= READY;
      end
      else begin
        RX_next_state <= DETECT_START_BIT;
        //start bit detected
      end
    end
    DETECT_START_BIT : begin
      if((RX_div == CLK_DIV_HALF)) begin
        RX_next_state <= PUT_BIT;
      end
      else begin
        RX_next_state <= DETECT_START_BIT;
      end
    end
    PUT_BIT : begin
      if((RX_bitIndex == RX_frame)) begin
        RX_next_state <= DATA_READY;
      end
      else begin
        RX_next_state <= READ_BIT;
      end
    end
    READ_BIT : begin
      if((RX_div == CLK_DIV)) begin
        RX_next_state <= PUT_BIT;
      end
      else begin
        RX_next_state <= READ_BIT;
      end
    end
    DATA_READY : begin
      RX_next_state <= DONE;
    end
    DONE : begin
      RX_next_state <= READY;
    end
    default : begin
      // should never be reached
      RX_next_state <= READY;
    end
    endcase
  end


endmodule
