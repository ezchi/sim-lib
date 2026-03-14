///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2025 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        OBUFDS_GTM2_ADV
// /___/   /\      Filename    : OBUFDS_GTM2_ADV.v
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

module OBUFDS_GTM2_ADV
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output O,
  output OB,

  input CE,
  input [3:0] I,
  input [1:0] REFCLK_CLKOUT_SEL,
  input [4:0] REFCLK_CTL_DRV_EN_CAL,
  input [2:0] REFCLK_CTL_DRV_SWING,
  input REFCLK_EN_BLD,
  input REFCLK_EN_DRV,
  input REFCLK_EN_TX_PATH,
  input REFCLK_RCAL_OFFSET_SIGN,
  input REFCLK_RPLL_CLK_SEL_EN,
  input [1:0] RXRECCLKSEL
);

// define constants
  localparam MODULE_NAME = "OBUFDS_GTM2_ADV";
  
`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  wire CE_in;
  wire REFCLK_EN_BLD_in;
  wire REFCLK_EN_DRV_in;
  wire REFCLK_EN_TX_PATH_in;
  wire REFCLK_RCAL_OFFSET_SIGN_in;
  wire REFCLK_RPLL_CLK_SEL_EN_in;
  wire [1:0] REFCLK_CLKOUT_SEL_in;
  wire [1:0] RXRECCLKSEL_in;
  wire [2:0] REFCLK_CTL_DRV_SWING_in;
  wire [3:0] I_in;
  wire [4:0] REFCLK_CTL_DRV_EN_CAL_in;

  

  assign CE_in = CE;
  assign I_in = I;
  assign REFCLK_CLKOUT_SEL_in = REFCLK_CLKOUT_SEL;
  assign REFCLK_CTL_DRV_EN_CAL_in = REFCLK_CTL_DRV_EN_CAL;
  assign REFCLK_CTL_DRV_SWING_in = REFCLK_CTL_DRV_SWING;
  assign REFCLK_EN_BLD_in = REFCLK_EN_BLD;
  assign REFCLK_EN_DRV_in = REFCLK_EN_DRV;
  assign REFCLK_EN_TX_PATH_in = REFCLK_EN_TX_PATH;
  assign REFCLK_RCAL_OFFSET_SIGN_in = REFCLK_RCAL_OFFSET_SIGN;
  assign REFCLK_RPLL_CLK_SEL_EN_in = REFCLK_RPLL_CLK_SEL_EN;
  assign RXRECCLKSEL_in[0] = (RXRECCLKSEL[0] !== 1'bz) && RXRECCLKSEL[0]; // rv 0
  assign RXRECCLKSEL_in[1] = (RXRECCLKSEL[1] !== 1'bz) && RXRECCLKSEL[1]; // rv 0

// begin behavioral model

`ifdef XIL_XECLIB
  reg glblGTS = 1'b0;
`else
  tri0 glblGTS = glbl.GTS;
`endif

  reg  I_sel = 1'b0;
// =====================
// Generate I_sel
// =====================
  always @(*) begin
    case (RXRECCLKSEL_in)
      2'b00:    I_sel <= I_in[0];
      2'b01:    I_sel <= I_in[1];
      2'b10:    I_sel <= I_in[2];
      2'b11:    I_sel <= I_in[3];
      default : I_sel <= I_in[0];
     endcase
   end

// =====================
// Generate O
// =====================

  assign O  = (~(REFCLK_EN_TX_PATH_in && REFCLK_EN_DRV_in) || (CE_in === 1'b0) || glblGTS) ? 1'bz : I_sel;
  assign OB = (~(REFCLK_EN_TX_PATH_in && REFCLK_EN_DRV_in) || (CE_in === 1'b0) || glblGTS) ? 1'bz : ~I_sel;

// end behavioral model

endmodule

`endcelldefine
