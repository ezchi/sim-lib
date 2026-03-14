///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2025 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2025.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        XP5PHY_HS
// /___/   /\      Filename    : XP5PHY_HS.v
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

module XP5PHY_HS
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output CLK_TO_EXT_NORTH,
  output CLK_TO_EXT_SOUTH,
  output [4:0] HCG_RXCTRL_OUT,
  output [5:0] HCG_TXCTRL_OUT,
  output [6:0] HCT_GT_STATUS_OUT,
  output [3:0] HCT_MON_OUT,
  output HCT_REFCLKEN_OUT,
  output [5:0] HRT_PHY2IOB_O0,
  output [5:0] HRT_PHY2IOB_T,
  output [6:0] HRT_PNSEL_OUT,
  output NDQS_GT_OUT,
  output OSC_TST_CLK_OUT,
  output PDQS_GT_OUT,
  output [6:0] RXD0_OUT,
  output [6:0] RXD1_OUT,
  output [6:0] RXD2_OUT,
  output [6:0] RXD3_OUT,
  output [6:0] RXD4_OUT,
  output [6:0] RXD5_OUT,

  input [88:0] CFGTRL_IN,
  input CLB2PHY_CTRL_DLY_TEST_IN,
  input CLK_FROM_EXT,
  input FIXDLY_RDY,
  input [13:0] GATE_DLY_IN,
  input [13:0] IDLY0_IN,
  input [13:0] IDLY1_IN,
  input [13:0] IDLY2_IN,
  input [13:0] IDLY3_IN,
  input [13:0] IDLY4_IN,
  input [13:0] IDLY5_IN,
  input [5:0] IOB2PHY_RX_D,
  input [18:0] LCG_CTRL_IN,
  input LCT_BSC_PHY_RDY,
  input [44:0] LCT_CTRL_IN,
  input [16:0] LCT_GT_CTRL_IN,
  input [15:0] MIN_DLY_IN,
  input NDQS_GT_IN,
  input [14:0] NQTR_DLY_IN,
  input [14:0] ODLY0_IN,
  input [14:0] ODLY1_IN,
  input [14:0] ODLY2_IN,
  input [14:0] ODLY3_IN,
  input [14:0] ODLY4_IN,
  input [14:0] ODLY5_IN,
  input PDQS_GT_IN,
  input PLL_CLK,
  input [14:0] PQTR_DLY_IN,
  input PRIME_VAL,
  input [42:0] RIU_CTRL_IN,
  input [10:0] SCAN_CTRL_IN,
  input [4:0] TRID_IN,
  input [13:0] TSTATE_DLY_IN,
  input [11:0] TXD0_IN,
  input [11:0] TXD1_IN,
  input [11:0] TXD2_IN,
  input [11:0] TXD3_IN,
  input [11:0] TXD4_IN,
  input [11:0] TXD5_IN,
  input [17:0] XMC_IDELAY_FDLY,
  input [20:0] XMC_ODELAY_FDLY
);

// define constants
  localparam MODULE_NAME = "XP5PHY_HS";
  
`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  wire CLK_TO_EXT_NORTH_out;
  wire CLK_TO_EXT_SOUTH_out;
  wire HCT_REFCLKEN_OUT_out;
  wire NDQS_GT_OUT_out;
  wire OSC_TST_CLK_OUT_out;
  wire PDQS_GT_OUT_out;
  wire [3:0] HCT_MON_OUT_out;
  wire [4:0] HCG_RXCTRL_OUT_out;
  wire [5:0] HCG_TXCTRL_OUT_out;
  wire [5:0] HRT_PHY2IOB_O0_out;
  wire [5:0] HRT_PHY2IOB_T_out;
  wire [6:0] HCT_GT_STATUS_OUT_out;
  wire [6:0] HRT_PNSEL_OUT_out;
  wire [6:0] RXD0_OUT_out;
  wire [6:0] RXD1_OUT_out;
  wire [6:0] RXD2_OUT_out;
  wire [6:0] RXD3_OUT_out;
  wire [6:0] RXD4_OUT_out;
  wire [6:0] RXD5_OUT_out;

  wire CLB2PHY_CTRL_DLY_TEST_IN_in;
  wire CLK_FROM_EXT_in;
  wire CTRL_CLK_IN_in;
  wire FIXDLY_RDY_in;
  wire LCT_BSC_PHY_RDY_in;
  wire NDQS_GT_IN_in;
  wire PDQS_GT_IN_in;
  wire PLL_CLK_in;
  wire PRIME_VAL_in;
  wire [10:0] SCAN_CTRL_IN_in;
  wire [11:0] TXD0_IN_in;
  wire [11:0] TXD1_IN_in;
  wire [11:0] TXD2_IN_in;
  wire [11:0] TXD3_IN_in;
  wire [11:0] TXD4_IN_in;
  wire [11:0] TXD5_IN_in;
  wire [13:0] GATE_DLY_IN_in;
  wire [13:0] IDLY0_IN_in;
  wire [13:0] IDLY1_IN_in;
  wire [13:0] IDLY2_IN_in;
  wire [13:0] IDLY3_IN_in;
  wire [13:0] IDLY4_IN_in;
  wire [13:0] IDLY5_IN_in;
  wire [13:0] TSTATE_DLY_IN_in;
  wire [14:0] NQTR_DLY_IN_in;
  wire [14:0] ODLY0_IN_in;
  wire [14:0] ODLY1_IN_in;
  wire [14:0] ODLY2_IN_in;
  wire [14:0] ODLY3_IN_in;
  wire [14:0] ODLY4_IN_in;
  wire [14:0] ODLY5_IN_in;
  wire [14:0] PQTR_DLY_IN_in;
  wire [15:0] MIN_DLY_IN_in;
  wire [16:0] LCT_GT_CTRL_IN_in;
  wire [17:0] XMC_IDELAY_FDLY_in;
  wire [18:0] LCG_CTRL_IN_in;
  wire [20:0] XMC_ODELAY_FDLY_in;
  wire [2:0] LS2HS_LP_TX_O_PU_EN_0_IN_in;
  wire [2:0] LS2HS_LP_TX_O_PU_EN_1_IN_in;
  wire [2:0] LS2HS_LP_TX_T_PD_EN_0_IN_in;
  wire [42:0] RIU_CTRL_IN_in;
  wire [44:0] LCT_CTRL_IN_in;
  wire [4:0] TRID_IN_in;
  wire [5:0] IOB2PHY_RX_D_in;
  wire [88:0] CFGTRL_IN_in;

  
  assign CLK_TO_EXT_NORTH = CLK_TO_EXT_NORTH_out;
  assign CLK_TO_EXT_SOUTH = CLK_TO_EXT_SOUTH_out;
  assign HCG_RXCTRL_OUT = HCG_RXCTRL_OUT_out;
  assign HCG_TXCTRL_OUT = HCG_TXCTRL_OUT_out;
  assign HCT_GT_STATUS_OUT = HCT_GT_STATUS_OUT_out;
  assign HCT_MON_OUT = HCT_MON_OUT_out;
  assign HCT_REFCLKEN_OUT = HCT_REFCLKEN_OUT_out;
  assign HRT_PHY2IOB_O0 = HRT_PHY2IOB_O0_out;
  assign HRT_PHY2IOB_T = HRT_PHY2IOB_T_out;
  assign HRT_PNSEL_OUT = HRT_PNSEL_OUT_out;
  assign NDQS_GT_OUT = NDQS_GT_OUT_out;
  assign OSC_TST_CLK_OUT = OSC_TST_CLK_OUT_out;
  assign PDQS_GT_OUT = PDQS_GT_OUT_out;
  assign RXD0_OUT = RXD0_OUT_out;
  assign RXD1_OUT = RXD1_OUT_out;
  assign RXD2_OUT = RXD2_OUT_out;
  assign RXD3_OUT = RXD3_OUT_out;
  assign RXD4_OUT = RXD4_OUT_out;
  assign RXD5_OUT = RXD5_OUT_out;

  assign CFGTRL_IN_in = CFGTRL_IN;
  assign CLB2PHY_CTRL_DLY_TEST_IN_in = CLB2PHY_CTRL_DLY_TEST_IN;
  assign CLK_FROM_EXT_in = CLK_FROM_EXT;
  assign FIXDLY_RDY_in = FIXDLY_RDY;
  assign GATE_DLY_IN_in = GATE_DLY_IN;
  assign IDLY0_IN_in = IDLY0_IN;
  assign IDLY1_IN_in = IDLY1_IN;
  assign IDLY2_IN_in = IDLY2_IN;
  assign IDLY3_IN_in = IDLY3_IN;
  assign IDLY4_IN_in = IDLY4_IN;
  assign IDLY5_IN_in = IDLY5_IN;
  assign IOB2PHY_RX_D_in = IOB2PHY_RX_D;
  assign LCG_CTRL_IN_in = LCG_CTRL_IN;
  assign LCT_BSC_PHY_RDY_in = LCT_BSC_PHY_RDY;
  assign LCT_CTRL_IN_in = LCT_CTRL_IN;
  assign LCT_GT_CTRL_IN_in = LCT_GT_CTRL_IN;
  assign MIN_DLY_IN_in = MIN_DLY_IN;
  assign NDQS_GT_IN_in = NDQS_GT_IN;
  assign NQTR_DLY_IN_in = NQTR_DLY_IN;
  assign ODLY0_IN_in = ODLY0_IN;
  assign ODLY1_IN_in = ODLY1_IN;
  assign ODLY2_IN_in = ODLY2_IN;
  assign ODLY3_IN_in = ODLY3_IN;
  assign ODLY4_IN_in = ODLY4_IN;
  assign ODLY5_IN_in = ODLY5_IN;
  assign PDQS_GT_IN_in = PDQS_GT_IN;
  assign PLL_CLK_in = PLL_CLK;
  assign PQTR_DLY_IN_in = PQTR_DLY_IN;
  assign PRIME_VAL_in = PRIME_VAL;
  assign RIU_CTRL_IN_in = RIU_CTRL_IN;
  assign SCAN_CTRL_IN_in = SCAN_CTRL_IN;
  assign TRID_IN_in = TRID_IN;
  assign TSTATE_DLY_IN_in = TSTATE_DLY_IN;
  assign TXD0_IN_in = TXD0_IN;
  assign TXD1_IN_in = TXD1_IN;
  assign TXD2_IN_in = TXD2_IN;
  assign TXD3_IN_in = TXD3_IN;
  assign TXD4_IN_in = TXD4_IN;
  assign TXD5_IN_in = TXD5_IN;
  assign XMC_IDELAY_FDLY_in = XMC_IDELAY_FDLY;
  assign XMC_ODELAY_FDLY_in = XMC_ODELAY_FDLY;



  assign CTRL_CLK_IN_in = 1'b1; // tie off
  assign LS2HS_LP_TX_O_PU_EN_0_IN_in = 3'b111; // tie off
  assign LS2HS_LP_TX_O_PU_EN_1_IN_in = 3'b111; // tie off
  assign LS2HS_LP_TX_T_PD_EN_0_IN_in = 3'b111; // tie off

    SIP_XP5PHY_HS SIP_XP5PHY_HS_INST (
      .CLK_TO_EXT_NORTH (CLK_TO_EXT_NORTH_out),
      .CLK_TO_EXT_SOUTH (CLK_TO_EXT_SOUTH_out),
      .HCG_RXCTRL_OUT (HCG_RXCTRL_OUT_out),
      .HCG_TXCTRL_OUT (HCG_TXCTRL_OUT_out),
      .HCT_GT_STATUS_OUT (HCT_GT_STATUS_OUT_out),
      .HCT_MON_OUT (HCT_MON_OUT_out),
      .HCT_REFCLKEN_OUT (HCT_REFCLKEN_OUT_out),
      .HRT_PHY2IOB_O0 (HRT_PHY2IOB_O0_out),
      .HRT_PHY2IOB_T (HRT_PHY2IOB_T_out),
      .HRT_PNSEL_OUT (HRT_PNSEL_OUT_out),
      .NDQS_GT_OUT (NDQS_GT_OUT_out),
      .OSC_TST_CLK_OUT (OSC_TST_CLK_OUT_out),
      .PDQS_GT_OUT (PDQS_GT_OUT_out),
      .RXD0_OUT (RXD0_OUT_out),
      .RXD1_OUT (RXD1_OUT_out),
      .RXD2_OUT (RXD2_OUT_out),
      .RXD3_OUT (RXD3_OUT_out),
      .RXD4_OUT (RXD4_OUT_out),
      .RXD5_OUT (RXD5_OUT_out),
      .CFGTRL_IN (CFGTRL_IN_in),
      .CLB2PHY_CTRL_DLY_TEST_IN (CLB2PHY_CTRL_DLY_TEST_IN_in),
      .CLK_FROM_EXT (CLK_FROM_EXT_in),
      .CTRL_CLK_IN (CTRL_CLK_IN_in),
      .FIXDLY_RDY (FIXDLY_RDY_in),
      .GATE_DLY_IN (GATE_DLY_IN_in),
      .IDLY0_IN (IDLY0_IN_in),
      .IDLY1_IN (IDLY1_IN_in),
      .IDLY2_IN (IDLY2_IN_in),
      .IDLY3_IN (IDLY3_IN_in),
      .IDLY4_IN (IDLY4_IN_in),
      .IDLY5_IN (IDLY5_IN_in),
      .IOB2PHY_RX_D (IOB2PHY_RX_D_in),
      .LCG_CTRL_IN (LCG_CTRL_IN_in),
      .LCT_BSC_PHY_RDY (LCT_BSC_PHY_RDY_in),
      .LCT_CTRL_IN (LCT_CTRL_IN_in),
      .LCT_GT_CTRL_IN (LCT_GT_CTRL_IN_in),
      .LS2HS_LP_TX_O_PU_EN_0_IN (LS2HS_LP_TX_O_PU_EN_0_IN_in),
      .LS2HS_LP_TX_O_PU_EN_1_IN (LS2HS_LP_TX_O_PU_EN_1_IN_in),
      .LS2HS_LP_TX_T_PD_EN_0_IN (LS2HS_LP_TX_T_PD_EN_0_IN_in),
      .MIN_DLY_IN (MIN_DLY_IN_in),
      .NDQS_GT_IN (NDQS_GT_IN_in),
      .NQTR_DLY_IN (NQTR_DLY_IN_in),
      .ODLY0_IN (ODLY0_IN_in),
      .ODLY1_IN (ODLY1_IN_in),
      .ODLY2_IN (ODLY2_IN_in),
      .ODLY3_IN (ODLY3_IN_in),
      .ODLY4_IN (ODLY4_IN_in),
      .ODLY5_IN (ODLY5_IN_in),
      .PDQS_GT_IN (PDQS_GT_IN_in),
      .PLL_CLK (PLL_CLK_in),
      .PQTR_DLY_IN (PQTR_DLY_IN_in),
      .PRIME_VAL (PRIME_VAL_in),
      .RIU_CTRL_IN (RIU_CTRL_IN_in),
      .SCAN_CTRL_IN (SCAN_CTRL_IN_in),
      .TRID_IN (TRID_IN_in),
      .TSTATE_DLY_IN (TSTATE_DLY_IN_in),
      .TXD0_IN (TXD0_IN_in),
      .TXD1_IN (TXD1_IN_in),
      .TXD2_IN (TXD2_IN_in),
      .TXD3_IN (TXD3_IN_in),
      .TXD4_IN (TXD4_IN_in),
      .TXD5_IN (TXD5_IN_in),
      .XMC_IDELAY_FDLY (XMC_IDELAY_FDLY_in),
      .XMC_ODELAY_FDLY (XMC_ODELAY_FDLY_in),
      .GSR (glblGSR)
    );

endmodule

`endcelldefine
