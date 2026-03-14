///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2025 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        IBUFDS_GTM2
// /___/   /\      Filename    : IBUFDS_GTM2.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module IBUFDS_GTM2
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output O,
  output ODIV2,

  input CE,
  input I,
  input IB,
  input REFCLK_ENB_VCM_STRONG,
  input REFCLK_EN_DC_COUP,
  input REFCLK_EN_FABRIC_CK,
  input REFCLK_EN_TX_PATH,
  input [1:0] REFCLK_HROW_CK_SEL,
  input [1:0] REFCLK_ICNTL_RX,
  input REFCLK_VCM_HIGH,
  input REFCLK_VCM_LOW
);

// define constants
  localparam MODULE_NAME = "IBUFDS_GTM2";
  
`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  

// begin behavioral model
  wire      O_out;
  reg       ODIV2_out   = 1'b0;
  reg [2:0] ce_count    = 3'b001;
  reg [2:0] edge_count  = 3'b000;
  reg       allEqual    = 1'b0;
  reg [1:0] edge_cnt    = 2'b00;
  reg       stop_cnt;
  reg       allEqual_p1 = 1'b0;
  wire      allEqual_sum ;


  assign ODIV2   = ODIV2_out;

// =====================
// Count the rising edges of the clk
// =====================
  always @(posedge I or posedge glblGSR) begin
    if (allEqual || glblGSR)
      edge_count <= 3'b000;
    else
      if (CE === 1'b1)
        edge_count <= edge_count + 1;
    end

//  Generate synchronous reset after DIVIDE number of counts
  always @(edge_count)
    if (edge_count == ce_count)
      allEqual = 1;
    else
      allEqual = 0;
   always @(posedge I or posedge glblGSR) begin
    if (glblGSR) begin
      edge_cnt <= 3'b000;
      stop_cnt <= 1'b0;
    end
    else
      if (edge_cnt == 2'h2) begin
        edge_cnt <= 1'b0;
        stop_cnt <= 1'b1;
      end
      else if ((CE === 1'b1) & !stop_cnt)
        edge_cnt <= edge_cnt + 1;
    end

  always @(posedge I) begin
      allEqual_p1 = allEqual;
  end

  assign allEqual_sum = (edge_cnt == 2'h1) | allEqual_p1;

// =====================
// Generate O
// =====================

  assign O_out = ~(REFCLK_EN_TX_PATH | (CE === 1'b0)) && I;
  assign O     = O_out;

// =====================
// Generate ODIV2
// =====================

always @(*) begin
    case (REFCLK_HROW_CK_SEL)
      2'b00:    ODIV2_out <= O_out;
      2'b01:    ODIV2_out <= allEqual_sum;
      2'b10:    ODIV2_out <= 1'b0;
      2'b11:    ODIV2_out <= 1'b0;
      default : ODIV2_out <= O_out;
    endcase
  end




// end behavioral model

endmodule

`endcelldefine
