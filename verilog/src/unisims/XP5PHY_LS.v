///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2025 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2025.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        XP5PHY_LS
// /___/   /\      Filename    : XP5PHY_LS.v
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

module XP5PHY_LS #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter CASCADE_0 = "FALSE",
  parameter CASCADE_1 = "FALSE",
  parameter CASCADE_2 = "FALSE",
  parameter CASCADE_3 = "FALSE",
  parameter CASCADE_4 = "FALSE",
  parameter CASCADE_5 = "FALSE",
  parameter CONTINUOUS_DQS = "FALSE",
  parameter integer DELAY_VALUE_0 = 0,
  parameter integer DELAY_VALUE_1 = 0,
  parameter integer DELAY_VALUE_2 = 0,
  parameter integer DELAY_VALUE_3 = 0,
  parameter integer DELAY_VALUE_4 = 0,
  parameter integer DELAY_VALUE_5 = 0,
  parameter DIS_IDLY_VT_TRACK = "FALSE",
  parameter DIS_ODLY_VT_TRACK = "FALSE",
  parameter DIS_QDLY_VT_TRACK = "FALSE",
  parameter DQS_MODE = "DDR4_1TCK",
  parameter DQS_SRC = "LOCAL",
  parameter EN_CLK_TO_LOWER = "DISABLE",
  parameter EN_CLK_TO_UPPER = "DISABLE",
  parameter EN_DYN_DLY_MODE = "FALSE",
  parameter EN_OTHER_NCLK = "FALSE",
  parameter EN_OTHER_PCLK = "FALSE",
  parameter FAST_CK = "FALSE",
  parameter FIFO_MODE_0 = "ASYNC",
  parameter FIFO_MODE_1 = "ASYNC",
  parameter FIFO_MODE_2 = "ASYNC",
  parameter FIFO_MODE_3 = "ASYNC",
  parameter FIFO_MODE_4 = "ASYNC",
  parameter FIFO_MODE_5 = "ASYNC",
  parameter HISTO_EN = "ENABLE",
  parameter integer HISTO_STEPSIZE = 4095,
  parameter integer HISTO_TH0 = 819,
  parameter integer HISTO_TH1 = 3276,
  parameter IBUF_DIS_SRC_0 = "EXTERNAL",
  parameter IBUF_DIS_SRC_1 = "EXTERNAL",
  parameter IBUF_DIS_SRC_2 = "EXTERNAL",
  parameter IBUF_DIS_SRC_3 = "EXTERNAL",
  parameter IBUF_DIS_SRC_4 = "EXTERNAL",
  parameter IBUF_DIS_SRC_5 = "EXTERNAL",
  parameter INV_RXCLK = "FALSE",
  parameter LP4_DQS = "FALSE",
  parameter ODELAY_BYPASS_0 = "FALSE",
  parameter ODELAY_BYPASS_1 = "FALSE",
  parameter ODELAY_BYPASS_2 = "FALSE",
  parameter ODELAY_BYPASS_3 = "FALSE",
  parameter ODELAY_BYPASS_4 = "FALSE",
  parameter ODELAY_BYPASS_5 = "FALSE",
  parameter ODT_SRC_0 = "EXTERNAL",
  parameter ODT_SRC_1 = "EXTERNAL",
  parameter ODT_SRC_2 = "EXTERNAL",
  parameter ODT_SRC_3 = "EXTERNAL",
  parameter ODT_SRC_4 = "EXTERNAL",
  parameter ODT_SRC_5 = "EXTERNAL",
  parameter real REFCLK_FREQUENCY = 200.0,
  parameter RX_CLK_PHASE_N = "SHIFT_0",
  parameter RX_CLK_PHASE_P = "SHIFT_0",
  parameter integer RX_DATA_WIDTH = 8,
  parameter RX_GATING = "DISABLE",
  parameter SELF_CALIBRATE = "ENABLE",
  parameter SERIAL_MODE = "FALSE",
  parameter TBYTE_CTL_0 = "T",
  parameter TBYTE_CTL_1 = "T",
  parameter TBYTE_CTL_2 = "T",
  parameter TBYTE_CTL_3 = "T",
  parameter TBYTE_CTL_4 = "T",
  parameter TBYTE_CTL_5 = "T",
  parameter TXRX_LOOPBACK_0 = "FALSE",
  parameter TXRX_LOOPBACK_1 = "FALSE",
  parameter TXRX_LOOPBACK_2 = "FALSE",
  parameter TXRX_LOOPBACK_3 = "FALSE",
  parameter TXRX_LOOPBACK_4 = "FALSE",
  parameter TXRX_LOOPBACK_5 = "FALSE",
  parameter integer TX_DATA_WIDTH = 8,
  parameter TX_GATING = "DISABLE",
  parameter [0:0] TX_INIT_0 = 1'b0,
  parameter [0:0] TX_INIT_1 = 1'b0,
  parameter [0:0] TX_INIT_2 = 1'b0,
  parameter [0:0] TX_INIT_3 = 1'b0,
  parameter [0:0] TX_INIT_4 = 1'b0,
  parameter [0:0] TX_INIT_5 = 1'b0,
  parameter [0:0] TX_INIT_TRI = 1'b1,
  parameter TX_OUTPUT_PHASE_90_0 = "FALSE",
  parameter TX_OUTPUT_PHASE_90_1 = "FALSE",
  parameter TX_OUTPUT_PHASE_90_2 = "FALSE",
  parameter TX_OUTPUT_PHASE_90_3 = "FALSE",
  parameter TX_OUTPUT_PHASE_90_4 = "FALSE",
  parameter TX_OUTPUT_PHASE_90_5 = "FALSE",
  parameter TX_OUTPUT_PHASE_90_TRI = "FALSE",
  parameter WRITE_LEVELING = "FALSE"
)(
  output [88:0] CFGTRL_OUT,
  output [53:0] CNTVALUEOUT,
  output DFX_UNEXPECTED_ACTIVATION,
  output DLY_RDY,
  output DMC_DIV4_CLK,
  output DMC_FIFO_EMPTY,
  output [5:0] DYN_DCI,
  output FIFO_EMPTY,
  output FIFO_WR_CLK,
  output [13:0] GATE_DLY_OUT,
  output GT_STATUS,
  output [5:0] IBUF_DISABLE,
  output [13:0] IDLY0_OUT,
  output [13:0] IDLY1_OUT,
  output [13:0] IDLY2_OUT,
  output [13:0] IDLY3_OUT,
  output [13:0] IDLY4_OUT,
  output [13:0] IDLY5_OUT,
  output [18:0] LCG_CTRL_OUT,
  output [44:0] LCT_CTRL_OUT,
  output [16:0] LCT_GT_CTRL_OUT,
  output LS_HS_FIXDLY_RDY,
  output [2:0] LS_HS_LSHS_LP_TX_O_OR_PU_EN_0,
  output [2:0] LS_HS_LSHS_LP_TX_O_OR_PU_EN_1,
  output [2:0] LS_HS_LSHS_LP_TX_T_OR_PD_EN_0,
  output LS_HS_PHY_RDY,
  output LS_HS_PRIME_VAL,
  output [15:0] MIN_DLY_OUT,
  output [14:0] NQTR_DLY_OUT,
  output [14:0] ODLY0_OUT,
  output [14:0] ODLY1_OUT,
  output [14:0] ODLY2_OUT,
  output [14:0] ODLY3_OUT,
  output [14:0] ODLY4_OUT,
  output [14:0] ODLY5_OUT,
  output PHY2DMC_GT_STATUS,
  output PHY2PHY_BISC_START_OUT,
  output PHY2PHY_BISC_STOP_OUT,
  output PHY_RDY,
  output [14:0] PQTR_DLY_OUT,
  output [7:0] Q0,
  output [7:0] Q1,
  output [7:0] Q2,
  output [7:0] Q3,
  output [7:0] Q4,
  output [7:0] Q5,
  output [15:0] RIU2CLB_RD_DATA,
  output RIU2CLB_VALID,
  output [42:0] RIU_CTRL_OUT,
  output [15:0] RIU_RD_DATA,
  output RIU_RD_VALID,
  output [10:0] SCAN_CTRL_OUT,
  output [4:0] TRID_OUT,
  output [13:0] TSTATE_DLY_OUT,
  output [11:0] TXD0_OUT,
  output [11:0] TXD1_OUT,
  output [11:0] TXD2_OUT,
  output [11:0] TXD3_OUT,
  output [11:0] TXD4_OUT,
  output [11:0] TXD5_OUT,

  input [5:0] CE,
  input [5:0] CLB2PHY_DYNAMIC_DCI_TS,
  input [5:0] CLB2PHY_IBUF_DISABLE,
  input [53:0] CNTVALUEIN,
  input CTRL_CLK,
  input [7:0] D0,
  input [7:0] D1,
  input [7:0] D2,
  input [7:0] D3,
  input [7:0] D4,
  input [7:0] D5,
  input EN_VTC,
  input FIFO_RDEN,
  input FIFO_RD_CLK,
  input [4:0] HCG_RXCTRL_IN,
  input [5:0] HCG_TXCTRL_IN,
  input [6:0] HCT_GT_STATUS_IN,
  input [3:0] HCT_MON_IN,
  input HCT_REFCLKEN_IN,
  input [6:0] HRT_PNSEL_IN,
  input [5:0] INC,
  input [5:0] IOB2COMP_LSPEED_I,
  input [5:0] LD,
  input OSC_TST_CLK_IN,
  input PHY2PHY_BISC_START_IN,
  input PHY2PHY_BISC_STOP_IN,
  input [3:0] PHY_RDEN,
  input [3:0] PHY_WREN,
  input [7:0] RIU_ADDR,
  input RIU_NIBBLE_SEL,
  input [15:0] RIU_WR_DATA,
  input RIU_WR_EN,
  input RST,
  input [6:0] RXD0_IN,
  input [6:0] RXD1_IN,
  input [6:0] RXD2_IN,
  input [6:0] RXD3_IN,
  input [6:0] RXD4_IN,
  input [6:0] RXD5_IN,
  input [5:0] RXTX_SEL,
  input [5:0] RX_EN_VTC,
  input [5:0] RX_RST,
  input [5:0] T,
  input [5:0] TX_EN_VTC,
  input [5:0] TX_RST
);

// define constants
  localparam MODULE_NAME = "XP5PHY_LS";
  
  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "XP5PHY_LS_dr.v"
`else
  reg [40:1] CASCADE_0_REG = CASCADE_0;
  reg [40:1] CASCADE_1_REG = CASCADE_1;
  reg [40:1] CASCADE_2_REG = CASCADE_2;
  reg [40:1] CASCADE_3_REG = CASCADE_3;
  reg [40:1] CASCADE_4_REG = CASCADE_4;
  reg [40:1] CASCADE_5_REG = CASCADE_5;
  reg [40:1] CONTINUOUS_DQS_REG = CONTINUOUS_DQS;
  reg [10:0] DELAY_VALUE_0_REG = DELAY_VALUE_0;
  reg [10:0] DELAY_VALUE_1_REG = DELAY_VALUE_1;
  reg [10:0] DELAY_VALUE_2_REG = DELAY_VALUE_2;
  reg [10:0] DELAY_VALUE_3_REG = DELAY_VALUE_3;
  reg [10:0] DELAY_VALUE_4_REG = DELAY_VALUE_4;
  reg [10:0] DELAY_VALUE_5_REG = DELAY_VALUE_5;
  reg [40:1] DIS_IDLY_VT_TRACK_REG = DIS_IDLY_VT_TRACK;
  reg [40:1] DIS_ODLY_VT_TRACK_REG = DIS_ODLY_VT_TRACK;
  reg [40:1] DIS_QDLY_VT_TRACK_REG = DIS_QDLY_VT_TRACK;
  reg [104:1] DQS_MODE_REG = DQS_MODE;
  reg [48:1] DQS_SRC_REG = DQS_SRC;
  reg [56:1] EN_CLK_TO_LOWER_REG = EN_CLK_TO_LOWER;
  reg [56:1] EN_CLK_TO_UPPER_REG = EN_CLK_TO_UPPER;
  reg [40:1] EN_DYN_DLY_MODE_REG = EN_DYN_DLY_MODE;
  reg [40:1] EN_OTHER_NCLK_REG = EN_OTHER_NCLK;
  reg [40:1] EN_OTHER_PCLK_REG = EN_OTHER_PCLK;
  reg [40:1] FAST_CK_REG = FAST_CK;
  reg [48:1] FIFO_MODE_0_REG = FIFO_MODE_0;
  reg [48:1] FIFO_MODE_1_REG = FIFO_MODE_1;
  reg [48:1] FIFO_MODE_2_REG = FIFO_MODE_2;
  reg [48:1] FIFO_MODE_3_REG = FIFO_MODE_3;
  reg [48:1] FIFO_MODE_4_REG = FIFO_MODE_4;
  reg [48:1] FIFO_MODE_5_REG = FIFO_MODE_5;
  reg [56:1] HISTO_EN_REG = HISTO_EN;
  reg [11:0] HISTO_STEPSIZE_REG = HISTO_STEPSIZE;
  reg [11:0] HISTO_TH0_REG = HISTO_TH0;
  reg [11:0] HISTO_TH1_REG = HISTO_TH1;
  reg [64:1] IBUF_DIS_SRC_0_REG = IBUF_DIS_SRC_0;
  reg [64:1] IBUF_DIS_SRC_1_REG = IBUF_DIS_SRC_1;
  reg [64:1] IBUF_DIS_SRC_2_REG = IBUF_DIS_SRC_2;
  reg [64:1] IBUF_DIS_SRC_3_REG = IBUF_DIS_SRC_3;
  reg [64:1] IBUF_DIS_SRC_4_REG = IBUF_DIS_SRC_4;
  reg [64:1] IBUF_DIS_SRC_5_REG = IBUF_DIS_SRC_5;
  reg [40:1] INV_RXCLK_REG = INV_RXCLK;
  reg [40:1] LP4_DQS_REG = LP4_DQS;
  reg [40:1] ODELAY_BYPASS_0_REG = ODELAY_BYPASS_0;
  reg [40:1] ODELAY_BYPASS_1_REG = ODELAY_BYPASS_1;
  reg [40:1] ODELAY_BYPASS_2_REG = ODELAY_BYPASS_2;
  reg [40:1] ODELAY_BYPASS_3_REG = ODELAY_BYPASS_3;
  reg [40:1] ODELAY_BYPASS_4_REG = ODELAY_BYPASS_4;
  reg [40:1] ODELAY_BYPASS_5_REG = ODELAY_BYPASS_5;
  reg [64:1] ODT_SRC_0_REG = ODT_SRC_0;
  reg [64:1] ODT_SRC_1_REG = ODT_SRC_1;
  reg [64:1] ODT_SRC_2_REG = ODT_SRC_2;
  reg [64:1] ODT_SRC_3_REG = ODT_SRC_3;
  reg [64:1] ODT_SRC_4_REG = ODT_SRC_4;
  reg [64:1] ODT_SRC_5_REG = ODT_SRC_5;
  real REFCLK_FREQUENCY_REG = REFCLK_FREQUENCY;
  reg [64:1] RX_CLK_PHASE_N_REG = RX_CLK_PHASE_N;
  reg [64:1] RX_CLK_PHASE_P_REG = RX_CLK_PHASE_P;
  reg [3:0] RX_DATA_WIDTH_REG = RX_DATA_WIDTH;
  reg [56:1] RX_GATING_REG = RX_GATING;
  reg [56:1] SELF_CALIBRATE_REG = SELF_CALIBRATE;
  reg [40:1] SERIAL_MODE_REG = SERIAL_MODE;
  reg [64:1] TBYTE_CTL_0_REG = TBYTE_CTL_0;
  reg [64:1] TBYTE_CTL_1_REG = TBYTE_CTL_1;
  reg [64:1] TBYTE_CTL_2_REG = TBYTE_CTL_2;
  reg [64:1] TBYTE_CTL_3_REG = TBYTE_CTL_3;
  reg [64:1] TBYTE_CTL_4_REG = TBYTE_CTL_4;
  reg [64:1] TBYTE_CTL_5_REG = TBYTE_CTL_5;
  reg [40:1] TXRX_LOOPBACK_0_REG = TXRX_LOOPBACK_0;
  reg [40:1] TXRX_LOOPBACK_1_REG = TXRX_LOOPBACK_1;
  reg [40:1] TXRX_LOOPBACK_2_REG = TXRX_LOOPBACK_2;
  reg [40:1] TXRX_LOOPBACK_3_REG = TXRX_LOOPBACK_3;
  reg [40:1] TXRX_LOOPBACK_4_REG = TXRX_LOOPBACK_4;
  reg [40:1] TXRX_LOOPBACK_5_REG = TXRX_LOOPBACK_5;
  reg [3:0] TX_DATA_WIDTH_REG = TX_DATA_WIDTH;
  reg [56:1] TX_GATING_REG = TX_GATING;
  reg [0:0] TX_INIT_0_REG = TX_INIT_0;
  reg [0:0] TX_INIT_1_REG = TX_INIT_1;
  reg [0:0] TX_INIT_2_REG = TX_INIT_2;
  reg [0:0] TX_INIT_3_REG = TX_INIT_3;
  reg [0:0] TX_INIT_4_REG = TX_INIT_4;
  reg [0:0] TX_INIT_5_REG = TX_INIT_5;
  reg [0:0] TX_INIT_TRI_REG = TX_INIT_TRI;
  reg [40:1] TX_OUTPUT_PHASE_90_0_REG = TX_OUTPUT_PHASE_90_0;
  reg [40:1] TX_OUTPUT_PHASE_90_1_REG = TX_OUTPUT_PHASE_90_1;
  reg [40:1] TX_OUTPUT_PHASE_90_2_REG = TX_OUTPUT_PHASE_90_2;
  reg [40:1] TX_OUTPUT_PHASE_90_3_REG = TX_OUTPUT_PHASE_90_3;
  reg [40:1] TX_OUTPUT_PHASE_90_4_REG = TX_OUTPUT_PHASE_90_4;
  reg [40:1] TX_OUTPUT_PHASE_90_5_REG = TX_OUTPUT_PHASE_90_5;
  reg [40:1] TX_OUTPUT_PHASE_90_TRI_REG = TX_OUTPUT_PHASE_90_TRI;
  reg [40:1] WRITE_LEVELING_REG = WRITE_LEVELING;
`endif

  reg [7:0] ROUNDING_FACTOR_REG = 16;
  reg [40:1] STOP_AFTER_ALIGN_REG = "FALSE";
  reg [40:1] TEST_MCT_REG = "FALSE";

`ifdef XIL_XECLIB
  wire [63:0] REFCLK_FREQUENCY_BIN;
`else
  reg [63:0] REFCLK_FREQUENCY_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
`endif

  wire CTRL_CLK_OUT_out;
  wire DFX_UNEXPECTED_ACTIVATION_out;
  wire DLY_RDY_out;
  wire DMC_DIV4_CLK_out;
  wire DMC_FIFO_EMPTY_out;
  wire FIFO_EMPTY_out;
  wire FIFO_WR_CLK_out;
  wire GT_STATUS_out;
  wire IJTAG_CAPTURE_DR_OUT_out;
  wire IJTAG_CLOCK_DR_OUT_out;
  wire IJTAG_RESET_TAP_B_OUT_out;
  wire IJTAG_SELECT_DR_OUT_out;
  wire IJTAG_SHIFT_DR_OUT_out;
  wire IJTAG_UPDATE_DR_OUT_out;
  wire LS_HS_FIXDLY_RDY_out;
  wire LS_HS_PHY_RDY_out;
  wire LS_HS_PRIME_VAL_out;
  wire PHY2CLB_MASTER_PD_out;
  wire PHY2CLB_SCAN_CNTRL_CHNL_OUT_out;
  wire PHY2CLB_SCAN_COMP_OUT_out;
  wire PHY2CLB_SCAN_OUT_out;
  wire PHY2DMC_GT_STATUS_out;
  wire PHY2IOB_R2RDAC_MODE_out;
  wire PHY2PHY_BISC_START_OUT_out;
  wire PHY2PHY_BISC_STOP_OUT_out;
  wire PHY2XXX_IJTAG_TDO_RETURN_out;
  wire PHY2XXX_IJTAG_TDO_out;
  wire PHY_RDY_out;
  wire RIU2CLB_VALID_out;
  wire RIU_RD_VALID_out;
  wire [10:0] SCAN_CTRL_OUT_out;
  wire [11:0] TXD0_OUT_out;
  wire [11:0] TXD1_OUT_out;
  wire [11:0] TXD2_OUT_out;
  wire [11:0] TXD3_OUT_out;
  wire [11:0] TXD4_OUT_out;
  wire [11:0] TXD5_OUT_out;
  wire [13:0] GATE_DLY_OUT_out;
  wire [13:0] IDLY0_OUT_out;
  wire [13:0] IDLY1_OUT_out;
  wire [13:0] IDLY2_OUT_out;
  wire [13:0] IDLY3_OUT_out;
  wire [13:0] IDLY4_OUT_out;
  wire [13:0] IDLY5_OUT_out;
  wire [13:0] TSTATE_DLY_OUT_out;
  wire [14:0] NQTR_DLY_OUT_out;
  wire [14:0] ODLY0_OUT_out;
  wire [14:0] ODLY1_OUT_out;
  wire [14:0] ODLY2_OUT_out;
  wire [14:0] ODLY3_OUT_out;
  wire [14:0] ODLY4_OUT_out;
  wire [14:0] ODLY5_OUT_out;
  wire [14:0] PQTR_DLY_OUT_out;
  wire [14:0] RTRIM_M2L_OUT_out;
  wire [15:0] MIN_DLY_OUT_out;
  wire [15:0] RIU2CLB_RD_DATA_out;
  wire [15:0] RIU_RD_DATA_out;
  wire [16:0] LCT_GT_CTRL_OUT_out;
  wire [18:0] LCG_CTRL_OUT_out;
  wire [2:0] LS_HS_LSHS_LP_TX_O_OR_PU_EN_0_out;
  wire [2:0] LS_HS_LSHS_LP_TX_O_OR_PU_EN_1_out;
  wire [2:0] LS_HS_LSHS_LP_TX_T_OR_PD_EN_0_out;
  wire [2:0] PHY2CLB_LP_I_0_out;
  wire [2:0] PHY2CLB_LP_I_1_out;
  wire [2:0] PHY2IOB_LP_RX_DIS_OR_TERM_EN_out;
  wire [2:0] PHY2IOB_LP_TX_O_OR_PU_EN_0_out;
  wire [2:0] PHY2IOB_LP_TX_O_OR_PU_EN_1_out;
  wire [2:0] PHY2IOB_LP_TX_T_OR_PD_EN_0_out;
  wire [2:0] PHY2IOB_PD_EN_1_out;
  wire [42:0] RIU_CTRL_OUT_out;
  wire [44:0] LCT_CTRL_OUT_out;
  wire [4:0] TRID_OUT_out;
  wire [53:0] CNTVALUEOUT_out;
  wire [5:0] DYN_DCI_out;
  wire [5:0] IBUF_DISABLE_out;
  wire [5:0] IF_IOB2CLB_DFT_out;
  wire [5:0] PHY2IOB_KEEPER_EN_out;
  wire [7:0] DMC_Q0_out;
  wire [7:0] DMC_Q1_out;
  wire [7:0] DMC_Q2_out;
  wire [7:0] DMC_Q3_out;
  wire [7:0] DMC_Q4_out;
  wire [7:0] DMC_Q5_out;
  wire [7:0] Q0_out;
  wire [7:0] Q1_out;
  wire [7:0] Q2_out;
  wire [7:0] Q3_out;
  wire [7:0] Q4_out;
  wire [7:0] Q5_out;
  wire [88:0] CFGTRL_OUT_out;
  wire [9:0] PHY2IOB_R2RDAC_SEL_out;

  wire CLB2PHY_CSSD_TRIG_in;
  wire CLB2PHY_SCAN_CLK_B_in;
  wire CLB2PHY_SCAN_CNTRL_CHNL_IN_in;
  wire CLB2PHY_SCAN_COMP_IN_in;
  wire CLB2PHY_SCAN_EDT_UPDT_B_in;
  wire CLB2PHY_SCAN_EN_B_in;
  wire CLB2PHY_SCAN_IN_in;
  wire CLB2PHY_SCAN_MODE_RST_B_in;
  wire CTRL_CLK_in;
  wire DMC2PHY_RST_in;
  wire DMC_CTRL_CLK_in;
  wire DMC_FIFO_RDEN_in;
  wire DMC_FIFO_RD_CLK_in;
  wire DMC_RIU_NIBBLE_SEL_in;
  wire DMC_RIU_WR_EN_in;
  wire EN_VTC_in;
  wire FIFO_RDEN_in;
  wire FIFO_RD_CLK_in;
  wire HCT_REFCLKEN_IN_in;
  wire IJTAG_CAPTURE_DR_IN_in;
  wire IJTAG_CLOCK_DR_IN_in;
  wire IJTAG_RESET_TAP_B_IN_in;
  wire IJTAG_SELECT_DR_IN_in;
  wire IJTAG_SHIFT_DR_IN_in;
  wire IJTAG_UPDATE_DR_IN_in;
  wire OSC_TST_CLK_IN_in;
  wire PHY2PHY_BISC_START_IN_in;
  wire PHY2PHY_BISC_STOP_IN_in;
  wire RIU_NIBBLE_SEL_in;
  wire RIU_WR_EN_in;
  wire RST_in;
  wire XXX2PHY_IJTAG_TDI_RETURN_in;
  wire XXX2PHY_IJTAG_TDI_in;
  wire [14:0] RTRIM_M2L_IN_in;
  wire [15:0] DMC_RIU_WR_DATA_in;
  wire [15:0] RIU_WR_DATA_in;
  wire [2:0] CLB2PHY_LP_RX_DIS_OR_TERM_EN_in;
  wire [2:0] CLB2PHY_LP_TX_O_OR_PU_EN_0_in;
  wire [2:0] CLB2PHY_LP_TX_O_OR_PU_EN_1_in;
  wire [2:0] CLB2PHY_LP_TX_T_OR_PD_EN_0_in;
  wire [2:0] CLB2PHY_PD_EN_1_in;
  wire [2:0] IOB2PHY_LP_I_0_in;
  wire [2:0] IOB2PHY_LP_I_1_in;
  wire [3:0] CFG2PHY_SCAN_DATA_OUT_INT_in;
  wire [3:0] DMC_PHY_RDEN_in;
  wire [3:0] DMC_PHY_WREN_in;
  wire [3:0] HCT_MON_IN_in;
  wire [3:0] PHY_RDEN_in;
  wire [3:0] PHY_WREN_in;
  wire [4:0] HCG_RXCTRL_IN_in;
  wire [53:0] CNTVALUEIN_in;
  wire [5:0] CE_in;
  wire [5:0] CLB2PHY_DYNAMIC_DCI_TS_in;
  wire [5:0] CLB2PHY_IBUF_DISABLE_in;
  wire [5:0] CLB2PHY_KEEPER_EN_in;
  wire [5:0] DMC_T_in;
  wire [5:0] HCG_TXCTRL_IN_in;
  wire [5:0] INC_in;
  wire [5:0] IOB2COMP_LSPEED_I_in;
  wire [5:0] LD_in;
  wire [5:0] RXTX_SEL_in;
  wire [5:0] RX_EN_VTC_in;
  wire [5:0] RX_RST_in;
  wire [5:0] TX_EN_VTC_in;
  wire [5:0] TX_RST_in;
  wire [5:0] T_in;
  wire [6:0] HCT_GT_STATUS_IN_in;
  wire [6:0] HRT_PNSEL_IN_in;
  wire [6:0] RXD0_IN_in;
  wire [6:0] RXD1_IN_in;
  wire [6:0] RXD2_IN_in;
  wire [6:0] RXD3_IN_in;
  wire [6:0] RXD4_IN_in;
  wire [6:0] RXD5_IN_in;
  wire [7:0] D0_in;
  wire [7:0] D1_in;
  wire [7:0] D2_in;
  wire [7:0] D3_in;
  wire [7:0] D4_in;
  wire [7:0] D5_in;
  wire [7:0] DMC_D0_in;
  wire [7:0] DMC_D1_in;
  wire [7:0] DMC_D2_in;
  wire [7:0] DMC_D3_in;
  wire [7:0] DMC_D4_in;
  wire [7:0] DMC_D5_in;
  wire [7:0] DMC_RIU_ADDR_in;
  wire [7:0] RIU_ADDR_in;

  
  assign CFGTRL_OUT = CFGTRL_OUT_out;
  assign CNTVALUEOUT = CNTVALUEOUT_out;
  assign DFX_UNEXPECTED_ACTIVATION = DFX_UNEXPECTED_ACTIVATION_out;
  assign DLY_RDY = DLY_RDY_out;
  assign DMC_DIV4_CLK = DMC_DIV4_CLK_out;
  assign DMC_FIFO_EMPTY = DMC_FIFO_EMPTY_out;
  assign DYN_DCI = DYN_DCI_out;
  assign FIFO_EMPTY = FIFO_EMPTY_out;
  assign FIFO_WR_CLK = FIFO_WR_CLK_out;
  assign GATE_DLY_OUT = GATE_DLY_OUT_out;
  assign GT_STATUS = GT_STATUS_out;
  assign IBUF_DISABLE = IBUF_DISABLE_out;
  assign IDLY0_OUT = IDLY0_OUT_out;
  assign IDLY1_OUT = IDLY1_OUT_out;
  assign IDLY2_OUT = IDLY2_OUT_out;
  assign IDLY3_OUT = IDLY3_OUT_out;
  assign IDLY4_OUT = IDLY4_OUT_out;
  assign IDLY5_OUT = IDLY5_OUT_out;
  assign LCG_CTRL_OUT = LCG_CTRL_OUT_out;
  assign LCT_CTRL_OUT = LCT_CTRL_OUT_out;
  assign LCT_GT_CTRL_OUT = LCT_GT_CTRL_OUT_out;
  assign LS_HS_FIXDLY_RDY = LS_HS_FIXDLY_RDY_out;
  assign LS_HS_LSHS_LP_TX_O_OR_PU_EN_0 = LS_HS_LSHS_LP_TX_O_OR_PU_EN_0_out;
  assign LS_HS_LSHS_LP_TX_O_OR_PU_EN_1 = LS_HS_LSHS_LP_TX_O_OR_PU_EN_1_out;
  assign LS_HS_LSHS_LP_TX_T_OR_PD_EN_0 = LS_HS_LSHS_LP_TX_T_OR_PD_EN_0_out;
  assign LS_HS_PHY_RDY = LS_HS_PHY_RDY_out;
  assign LS_HS_PRIME_VAL = LS_HS_PRIME_VAL_out;
  assign MIN_DLY_OUT = MIN_DLY_OUT_out;
  assign NQTR_DLY_OUT = NQTR_DLY_OUT_out;
  assign ODLY0_OUT = ODLY0_OUT_out;
  assign ODLY1_OUT = ODLY1_OUT_out;
  assign ODLY2_OUT = ODLY2_OUT_out;
  assign ODLY3_OUT = ODLY3_OUT_out;
  assign ODLY4_OUT = ODLY4_OUT_out;
  assign ODLY5_OUT = ODLY5_OUT_out;
  assign PHY2DMC_GT_STATUS = PHY2DMC_GT_STATUS_out;
  assign PHY2PHY_BISC_START_OUT = PHY2PHY_BISC_START_OUT_out;
  assign PHY2PHY_BISC_STOP_OUT = PHY2PHY_BISC_STOP_OUT_out;
  assign PHY_RDY = PHY_RDY_out;
  assign PQTR_DLY_OUT = PQTR_DLY_OUT_out;
  assign Q0 = Q0_out;
  assign Q1 = Q1_out;
  assign Q2 = Q2_out;
  assign Q3 = Q3_out;
  assign Q4 = Q4_out;
  assign Q5 = Q5_out;
  assign RIU2CLB_RD_DATA = RIU2CLB_RD_DATA_out;
  assign RIU2CLB_VALID = RIU2CLB_VALID_out;
  assign RIU_CTRL_OUT = RIU_CTRL_OUT_out;
  assign RIU_RD_DATA = RIU_RD_DATA_out;
  assign RIU_RD_VALID = RIU_RD_VALID_out;
  assign SCAN_CTRL_OUT = SCAN_CTRL_OUT_out;
  assign TRID_OUT = TRID_OUT_out;
  assign TSTATE_DLY_OUT = TSTATE_DLY_OUT_out;
  assign TXD0_OUT = TXD0_OUT_out;
  assign TXD1_OUT = TXD1_OUT_out;
  assign TXD2_OUT = TXD2_OUT_out;
  assign TXD3_OUT = TXD3_OUT_out;
  assign TXD4_OUT = TXD4_OUT_out;
  assign TXD5_OUT = TXD5_OUT_out;

  assign CE_in = CE;
  assign CLB2PHY_DYNAMIC_DCI_TS_in = CLB2PHY_DYNAMIC_DCI_TS;
  assign CLB2PHY_IBUF_DISABLE_in = CLB2PHY_IBUF_DISABLE;
  assign CNTVALUEIN_in = CNTVALUEIN;
  assign CTRL_CLK_in = CTRL_CLK;
  assign D0_in = D0;
  assign D1_in = D1;
  assign D2_in = D2;
  assign D3_in = D3;
  assign D4_in = D4;
  assign D5_in = D5;
  assign EN_VTC_in = (EN_VTC !== 1'bz) && EN_VTC; // rv 0
  assign FIFO_RDEN_in = (FIFO_RDEN !== 1'bz) && FIFO_RDEN; // rv 0
  assign FIFO_RD_CLK_in = (FIFO_RD_CLK === 1'bz) || FIFO_RD_CLK; // rv 1
  assign HCG_RXCTRL_IN_in = HCG_RXCTRL_IN;
  assign HCG_TXCTRL_IN_in = HCG_TXCTRL_IN;
  assign HCT_GT_STATUS_IN_in = HCT_GT_STATUS_IN;
  assign HCT_MON_IN_in = HCT_MON_IN;
  assign HCT_REFCLKEN_IN_in = HCT_REFCLKEN_IN;
  assign HRT_PNSEL_IN_in = HRT_PNSEL_IN;
  assign INC_in = INC;
  assign IOB2COMP_LSPEED_I_in = IOB2COMP_LSPEED_I;
  assign LD_in = LD;
  assign OSC_TST_CLK_IN_in = OSC_TST_CLK_IN;
  assign PHY2PHY_BISC_START_IN_in = PHY2PHY_BISC_START_IN;
  assign PHY2PHY_BISC_STOP_IN_in = PHY2PHY_BISC_STOP_IN;
  assign PHY_RDEN_in[0] = (PHY_RDEN[0] !== 1'bz) && PHY_RDEN[0]; // rv 0
  assign PHY_RDEN_in[1] = (PHY_RDEN[1] !== 1'bz) && PHY_RDEN[1]; // rv 0
  assign PHY_RDEN_in[2] = (PHY_RDEN[2] !== 1'bz) && PHY_RDEN[2]; // rv 0
  assign PHY_RDEN_in[3] = (PHY_RDEN[3] !== 1'bz) && PHY_RDEN[3]; // rv 0
  assign PHY_WREN_in[0] = (PHY_WREN[0] !== 1'bz) && PHY_WREN[0]; // rv 0
  assign PHY_WREN_in[1] = (PHY_WREN[1] !== 1'bz) && PHY_WREN[1]; // rv 0
  assign PHY_WREN_in[2] = (PHY_WREN[2] !== 1'bz) && PHY_WREN[2]; // rv 0
  assign PHY_WREN_in[3] = (PHY_WREN[3] !== 1'bz) && PHY_WREN[3]; // rv 0
  assign RIU_ADDR_in[0] = (RIU_ADDR[0] === 1'bz) || RIU_ADDR[0]; // rv 1
  assign RIU_ADDR_in[1] = (RIU_ADDR[1] === 1'bz) || RIU_ADDR[1]; // rv 1
  assign RIU_ADDR_in[2] = (RIU_ADDR[2] === 1'bz) || RIU_ADDR[2]; // rv 1
  assign RIU_ADDR_in[3] = (RIU_ADDR[3] === 1'bz) || RIU_ADDR[3]; // rv 1
  assign RIU_ADDR_in[4] = (RIU_ADDR[4] === 1'bz) || RIU_ADDR[4]; // rv 1
  assign RIU_ADDR_in[5] = (RIU_ADDR[5] === 1'bz) || RIU_ADDR[5]; // rv 1
  assign RIU_ADDR_in[6] = (RIU_ADDR[6] === 1'bz) || RIU_ADDR[6]; // rv 1
  assign RIU_ADDR_in[7] = (RIU_ADDR[7] === 1'bz) || RIU_ADDR[7]; // rv 1
  assign RIU_NIBBLE_SEL_in = (RIU_NIBBLE_SEL !== 1'bz) && RIU_NIBBLE_SEL; // rv 0
  assign RIU_WR_DATA_in[0] = (RIU_WR_DATA[0] === 1'bz) || RIU_WR_DATA[0]; // rv 1
  assign RIU_WR_DATA_in[10] = (RIU_WR_DATA[10] === 1'bz) || RIU_WR_DATA[10]; // rv 1
  assign RIU_WR_DATA_in[11] = (RIU_WR_DATA[11] === 1'bz) || RIU_WR_DATA[11]; // rv 1
  assign RIU_WR_DATA_in[12] = (RIU_WR_DATA[12] === 1'bz) || RIU_WR_DATA[12]; // rv 1
  assign RIU_WR_DATA_in[13] = (RIU_WR_DATA[13] === 1'bz) || RIU_WR_DATA[13]; // rv 1
  assign RIU_WR_DATA_in[14] = (RIU_WR_DATA[14] === 1'bz) || RIU_WR_DATA[14]; // rv 1
  assign RIU_WR_DATA_in[15] = (RIU_WR_DATA[15] === 1'bz) || RIU_WR_DATA[15]; // rv 1
  assign RIU_WR_DATA_in[1] = (RIU_WR_DATA[1] === 1'bz) || RIU_WR_DATA[1]; // rv 1
  assign RIU_WR_DATA_in[2] = (RIU_WR_DATA[2] === 1'bz) || RIU_WR_DATA[2]; // rv 1
  assign RIU_WR_DATA_in[3] = (RIU_WR_DATA[3] === 1'bz) || RIU_WR_DATA[3]; // rv 1
  assign RIU_WR_DATA_in[4] = (RIU_WR_DATA[4] === 1'bz) || RIU_WR_DATA[4]; // rv 1
  assign RIU_WR_DATA_in[5] = (RIU_WR_DATA[5] === 1'bz) || RIU_WR_DATA[5]; // rv 1
  assign RIU_WR_DATA_in[6] = (RIU_WR_DATA[6] === 1'bz) || RIU_WR_DATA[6]; // rv 1
  assign RIU_WR_DATA_in[7] = (RIU_WR_DATA[7] === 1'bz) || RIU_WR_DATA[7]; // rv 1
  assign RIU_WR_DATA_in[8] = (RIU_WR_DATA[8] === 1'bz) || RIU_WR_DATA[8]; // rv 1
  assign RIU_WR_DATA_in[9] = (RIU_WR_DATA[9] === 1'bz) || RIU_WR_DATA[9]; // rv 1
  assign RIU_WR_EN_in = (RIU_WR_EN === 1'bz) || RIU_WR_EN; // rv 1
  assign RST_in = (RST !== 1'bz) && RST; // rv 0
  assign RXD0_IN_in = RXD0_IN;
  assign RXD1_IN_in = RXD1_IN;
  assign RXD2_IN_in = RXD2_IN;
  assign RXD3_IN_in = RXD3_IN;
  assign RXD4_IN_in = RXD4_IN;
  assign RXD5_IN_in = RXD5_IN;
  assign RXTX_SEL_in = RXTX_SEL;
  assign RX_EN_VTC_in[0] = (RX_EN_VTC[0] === 1'bz) || RX_EN_VTC[0]; // rv 1
  assign RX_EN_VTC_in[1] = (RX_EN_VTC[1] === 1'bz) || RX_EN_VTC[1]; // rv 1
  assign RX_EN_VTC_in[2] = (RX_EN_VTC[2] === 1'bz) || RX_EN_VTC[2]; // rv 1
  assign RX_EN_VTC_in[3] = (RX_EN_VTC[3] === 1'bz) || RX_EN_VTC[3]; // rv 1
  assign RX_EN_VTC_in[4] = (RX_EN_VTC[4] === 1'bz) || RX_EN_VTC[4]; // rv 1
  assign RX_EN_VTC_in[5] = (RX_EN_VTC[5] === 1'bz) || RX_EN_VTC[5]; // rv 1
  assign RX_RST_in = RX_RST;
  assign TX_EN_VTC_in[0] = (TX_EN_VTC[0] === 1'bz) || TX_EN_VTC[0]; // rv 1
  assign TX_EN_VTC_in[1] = (TX_EN_VTC[1] === 1'bz) || TX_EN_VTC[1]; // rv 1
  assign TX_EN_VTC_in[2] = (TX_EN_VTC[2] === 1'bz) || TX_EN_VTC[2]; // rv 1
  assign TX_EN_VTC_in[3] = (TX_EN_VTC[3] === 1'bz) || TX_EN_VTC[3]; // rv 1
  assign TX_EN_VTC_in[4] = (TX_EN_VTC[4] === 1'bz) || TX_EN_VTC[4]; // rv 1
  assign TX_EN_VTC_in[5] = (TX_EN_VTC[5] === 1'bz) || TX_EN_VTC[5]; // rv 1
  assign TX_RST_in = TX_RST;
  assign T_in = T;

`ifndef XIL_XECLIB
  reg attr_test;
  reg attr_err;
  
  initial begin
  trig_attr = 1'b0;
  `ifdef XIL_ATTR_TEST
    attr_test = 1'b1;
  `else
    attr_test = 1'b0;
  `endif
    attr_err = 1'b0;
    #1;
    trig_attr = ~trig_attr;
  end
`endif

`ifdef XIL_XECLIB
  assign REFCLK_FREQUENCY_BIN = REFCLK_FREQUENCY_REG * 1000;
  
`else
  always @ (trig_attr) begin
  #1;
  REFCLK_FREQUENCY_BIN = REFCLK_FREQUENCY_REG * 1000;
  
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((CASCADE_0_REG != "FALSE") &&
         (CASCADE_0_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-101] CASCADE_0 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CASCADE_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CASCADE_1_REG != "FALSE") &&
         (CASCADE_1_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-102] CASCADE_1 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CASCADE_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CASCADE_2_REG != "FALSE") &&
         (CASCADE_2_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-103] CASCADE_2 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CASCADE_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CASCADE_3_REG != "FALSE") &&
         (CASCADE_3_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-104] CASCADE_3 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CASCADE_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CASCADE_4_REG != "FALSE") &&
         (CASCADE_4_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-105] CASCADE_4 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CASCADE_4_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CASCADE_5_REG != "FALSE") &&
         (CASCADE_5_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-106] CASCADE_5 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CASCADE_5_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CONTINUOUS_DQS_REG != "FALSE") &&
         (CONTINUOUS_DQS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-107] CONTINUOUS_DQS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CONTINUOUS_DQS_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DELAY_VALUE_0_REG < 0) || (DELAY_VALUE_0_REG > 1250))) begin
      $display("Error: [Unisim %s-108] DELAY_VALUE_0 attribute is set to %d.  Legal values for this attribute are 0 to 1250. Instance: %m", MODULE_NAME, DELAY_VALUE_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DELAY_VALUE_1_REG < 0) || (DELAY_VALUE_1_REG > 1250))) begin
      $display("Error: [Unisim %s-109] DELAY_VALUE_1 attribute is set to %d.  Legal values for this attribute are 0 to 1250. Instance: %m", MODULE_NAME, DELAY_VALUE_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DELAY_VALUE_2_REG < 0) || (DELAY_VALUE_2_REG > 1250))) begin
      $display("Error: [Unisim %s-110] DELAY_VALUE_2 attribute is set to %d.  Legal values for this attribute are 0 to 1250. Instance: %m", MODULE_NAME, DELAY_VALUE_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DELAY_VALUE_3_REG < 0) || (DELAY_VALUE_3_REG > 1250))) begin
      $display("Error: [Unisim %s-111] DELAY_VALUE_3 attribute is set to %d.  Legal values for this attribute are 0 to 1250. Instance: %m", MODULE_NAME, DELAY_VALUE_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DELAY_VALUE_4_REG < 0) || (DELAY_VALUE_4_REG > 1250))) begin
      $display("Error: [Unisim %s-112] DELAY_VALUE_4 attribute is set to %d.  Legal values for this attribute are 0 to 1250. Instance: %m", MODULE_NAME, DELAY_VALUE_4_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DELAY_VALUE_5_REG < 0) || (DELAY_VALUE_5_REG > 1250))) begin
      $display("Error: [Unisim %s-113] DELAY_VALUE_5 attribute is set to %d.  Legal values for this attribute are 0 to 1250. Instance: %m", MODULE_NAME, DELAY_VALUE_5_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DIS_IDLY_VT_TRACK_REG != "FALSE") &&
         (DIS_IDLY_VT_TRACK_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-114] DIS_IDLY_VT_TRACK attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DIS_IDLY_VT_TRACK_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DIS_ODLY_VT_TRACK_REG != "FALSE") &&
         (DIS_ODLY_VT_TRACK_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-115] DIS_ODLY_VT_TRACK attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DIS_ODLY_VT_TRACK_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DIS_QDLY_VT_TRACK_REG != "FALSE") &&
         (DIS_QDLY_VT_TRACK_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-116] DIS_QDLY_VT_TRACK attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DIS_QDLY_VT_TRACK_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DQS_MODE_REG != "DDR4_1TCK") &&
         (DQS_MODE_REG != "DDR3") &&
         (DQS_MODE_REG != "DDR4_2TCK") &&
         (DQS_MODE_REG != "LPDDR4") &&
         (DQS_MODE_REG != "LPDDR4_TOGGLE"))) begin
      $display("Error: [Unisim %s-124] DQS_MODE attribute is set to %s.  Legal values for this attribute are DDR4_1TCK, DDR3, DDR4_2TCK, LPDDR4 or LPDDR4_TOGGLE. Instance: %m", MODULE_NAME, DQS_MODE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DQS_SRC_REG != "LOCAL") &&
         (DQS_SRC_REG != "EXTERN"))) begin
      $display("Error: [Unisim %s-125] DQS_SRC attribute is set to %s.  Legal values for this attribute are LOCAL or EXTERN. Instance: %m", MODULE_NAME, DQS_SRC_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((EN_CLK_TO_LOWER_REG != "DISABLE") &&
         (EN_CLK_TO_LOWER_REG != "ENABLE"))) begin
      $display("Error: [Unisim %s-126] EN_CLK_TO_LOWER attribute is set to %s.  Legal values for this attribute are DISABLE or ENABLE. Instance: %m", MODULE_NAME, EN_CLK_TO_LOWER_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((EN_CLK_TO_UPPER_REG != "DISABLE") &&
         (EN_CLK_TO_UPPER_REG != "ENABLE"))) begin
      $display("Error: [Unisim %s-127] EN_CLK_TO_UPPER attribute is set to %s.  Legal values for this attribute are DISABLE or ENABLE. Instance: %m", MODULE_NAME, EN_CLK_TO_UPPER_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((EN_DYN_DLY_MODE_REG != "FALSE") &&
         (EN_DYN_DLY_MODE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-128] EN_DYN_DLY_MODE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, EN_DYN_DLY_MODE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((EN_OTHER_NCLK_REG != "FALSE") &&
         (EN_OTHER_NCLK_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-129] EN_OTHER_NCLK attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, EN_OTHER_NCLK_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((EN_OTHER_PCLK_REG != "FALSE") &&
         (EN_OTHER_PCLK_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-130] EN_OTHER_PCLK attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, EN_OTHER_PCLK_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((FAST_CK_REG != "FALSE") &&
         (FAST_CK_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-131] FAST_CK attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, FAST_CK_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((FIFO_MODE_0_REG != "ASYNC") &&
         (FIFO_MODE_0_REG != "BYPASS") &&
         (FIFO_MODE_0_REG != "SYNC"))) begin
      $display("Error: [Unisim %s-133] FIFO_MODE_0 attribute is set to %s.  Legal values for this attribute are ASYNC, BYPASS or SYNC. Instance: %m", MODULE_NAME, FIFO_MODE_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((FIFO_MODE_1_REG != "ASYNC") &&
         (FIFO_MODE_1_REG != "BYPASS") &&
         (FIFO_MODE_1_REG != "SYNC"))) begin
      $display("Error: [Unisim %s-134] FIFO_MODE_1 attribute is set to %s.  Legal values for this attribute are ASYNC, BYPASS or SYNC. Instance: %m", MODULE_NAME, FIFO_MODE_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((FIFO_MODE_2_REG != "ASYNC") &&
         (FIFO_MODE_2_REG != "BYPASS") &&
         (FIFO_MODE_2_REG != "SYNC"))) begin
      $display("Error: [Unisim %s-135] FIFO_MODE_2 attribute is set to %s.  Legal values for this attribute are ASYNC, BYPASS or SYNC. Instance: %m", MODULE_NAME, FIFO_MODE_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((FIFO_MODE_3_REG != "ASYNC") &&
         (FIFO_MODE_3_REG != "BYPASS") &&
         (FIFO_MODE_3_REG != "SYNC"))) begin
      $display("Error: [Unisim %s-136] FIFO_MODE_3 attribute is set to %s.  Legal values for this attribute are ASYNC, BYPASS or SYNC. Instance: %m", MODULE_NAME, FIFO_MODE_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((FIFO_MODE_4_REG != "ASYNC") &&
         (FIFO_MODE_4_REG != "BYPASS") &&
         (FIFO_MODE_4_REG != "SYNC"))) begin
      $display("Error: [Unisim %s-137] FIFO_MODE_4 attribute is set to %s.  Legal values for this attribute are ASYNC, BYPASS or SYNC. Instance: %m", MODULE_NAME, FIFO_MODE_4_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((FIFO_MODE_5_REG != "ASYNC") &&
         (FIFO_MODE_5_REG != "BYPASS") &&
         (FIFO_MODE_5_REG != "SYNC"))) begin
      $display("Error: [Unisim %s-138] FIFO_MODE_5 attribute is set to %s.  Legal values for this attribute are ASYNC, BYPASS or SYNC. Instance: %m", MODULE_NAME, FIFO_MODE_5_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((HISTO_EN_REG != "ENABLE") &&
         (HISTO_EN_REG != "DISABLE"))) begin
      $display("Error: [Unisim %s-139] HISTO_EN attribute is set to %s.  Legal values for this attribute are ENABLE or DISABLE. Instance: %m", MODULE_NAME, HISTO_EN_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((HISTO_STEPSIZE_REG < 0) || (HISTO_STEPSIZE_REG > 4095))) begin
      $display("Error: [Unisim %s-140] HISTO_STEPSIZE attribute is set to %d.  Legal values for this attribute are 0 to 4095. Instance: %m", MODULE_NAME, HISTO_STEPSIZE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((HISTO_TH0_REG < 0) || (HISTO_TH0_REG > 4095))) begin
      $display("Error: [Unisim %s-141] HISTO_TH0 attribute is set to %d.  Legal values for this attribute are 0 to 4095. Instance: %m", MODULE_NAME, HISTO_TH0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((HISTO_TH1_REG < 0) || (HISTO_TH1_REG > 4095))) begin
      $display("Error: [Unisim %s-142] HISTO_TH1 attribute is set to %d.  Legal values for this attribute are 0 to 4095. Instance: %m", MODULE_NAME, HISTO_TH1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_DIS_SRC_0_REG != "EXTERNAL") &&
         (IBUF_DIS_SRC_0_REG != "INTERNAL"))) begin
      $display("Error: [Unisim %s-143] IBUF_DIS_SRC_0 attribute is set to %s.  Legal values for this attribute are EXTERNAL or INTERNAL. Instance: %m", MODULE_NAME, IBUF_DIS_SRC_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_DIS_SRC_1_REG != "EXTERNAL") &&
         (IBUF_DIS_SRC_1_REG != "INTERNAL"))) begin
      $display("Error: [Unisim %s-144] IBUF_DIS_SRC_1 attribute is set to %s.  Legal values for this attribute are EXTERNAL or INTERNAL. Instance: %m", MODULE_NAME, IBUF_DIS_SRC_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_DIS_SRC_2_REG != "EXTERNAL") &&
         (IBUF_DIS_SRC_2_REG != "INTERNAL"))) begin
      $display("Error: [Unisim %s-145] IBUF_DIS_SRC_2 attribute is set to %s.  Legal values for this attribute are EXTERNAL or INTERNAL. Instance: %m", MODULE_NAME, IBUF_DIS_SRC_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_DIS_SRC_3_REG != "EXTERNAL") &&
         (IBUF_DIS_SRC_3_REG != "INTERNAL"))) begin
      $display("Error: [Unisim %s-146] IBUF_DIS_SRC_3 attribute is set to %s.  Legal values for this attribute are EXTERNAL or INTERNAL. Instance: %m", MODULE_NAME, IBUF_DIS_SRC_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_DIS_SRC_4_REG != "EXTERNAL") &&
         (IBUF_DIS_SRC_4_REG != "INTERNAL"))) begin
      $display("Error: [Unisim %s-147] IBUF_DIS_SRC_4 attribute is set to %s.  Legal values for this attribute are EXTERNAL or INTERNAL. Instance: %m", MODULE_NAME, IBUF_DIS_SRC_4_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_DIS_SRC_5_REG != "EXTERNAL") &&
         (IBUF_DIS_SRC_5_REG != "INTERNAL"))) begin
      $display("Error: [Unisim %s-148] IBUF_DIS_SRC_5 attribute is set to %s.  Legal values for this attribute are EXTERNAL or INTERNAL. Instance: %m", MODULE_NAME, IBUF_DIS_SRC_5_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((INV_RXCLK_REG != "FALSE") &&
         (INV_RXCLK_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-149] INV_RXCLK attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, INV_RXCLK_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((LP4_DQS_REG != "FALSE") &&
         (LP4_DQS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-150] LP4_DQS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, LP4_DQS_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ODELAY_BYPASS_0_REG != "FALSE") &&
         (ODELAY_BYPASS_0_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-151] ODELAY_BYPASS_0 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, ODELAY_BYPASS_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ODELAY_BYPASS_1_REG != "FALSE") &&
         (ODELAY_BYPASS_1_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-152] ODELAY_BYPASS_1 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, ODELAY_BYPASS_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ODELAY_BYPASS_2_REG != "FALSE") &&
         (ODELAY_BYPASS_2_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-153] ODELAY_BYPASS_2 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, ODELAY_BYPASS_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ODELAY_BYPASS_3_REG != "FALSE") &&
         (ODELAY_BYPASS_3_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-154] ODELAY_BYPASS_3 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, ODELAY_BYPASS_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ODELAY_BYPASS_4_REG != "FALSE") &&
         (ODELAY_BYPASS_4_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-155] ODELAY_BYPASS_4 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, ODELAY_BYPASS_4_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ODELAY_BYPASS_5_REG != "FALSE") &&
         (ODELAY_BYPASS_5_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-156] ODELAY_BYPASS_5 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, ODELAY_BYPASS_5_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ODT_SRC_0_REG != "EXTERNAL") &&
         (ODT_SRC_0_REG != "INTERNAL"))) begin
      $display("Error: [Unisim %s-157] ODT_SRC_0 attribute is set to %s.  Legal values for this attribute are EXTERNAL or INTERNAL. Instance: %m", MODULE_NAME, ODT_SRC_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ODT_SRC_1_REG != "EXTERNAL") &&
         (ODT_SRC_1_REG != "INTERNAL"))) begin
      $display("Error: [Unisim %s-158] ODT_SRC_1 attribute is set to %s.  Legal values for this attribute are EXTERNAL or INTERNAL. Instance: %m", MODULE_NAME, ODT_SRC_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ODT_SRC_2_REG != "EXTERNAL") &&
         (ODT_SRC_2_REG != "INTERNAL"))) begin
      $display("Error: [Unisim %s-159] ODT_SRC_2 attribute is set to %s.  Legal values for this attribute are EXTERNAL or INTERNAL. Instance: %m", MODULE_NAME, ODT_SRC_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ODT_SRC_3_REG != "EXTERNAL") &&
         (ODT_SRC_3_REG != "INTERNAL"))) begin
      $display("Error: [Unisim %s-160] ODT_SRC_3 attribute is set to %s.  Legal values for this attribute are EXTERNAL or INTERNAL. Instance: %m", MODULE_NAME, ODT_SRC_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ODT_SRC_4_REG != "EXTERNAL") &&
         (ODT_SRC_4_REG != "INTERNAL"))) begin
      $display("Error: [Unisim %s-161] ODT_SRC_4 attribute is set to %s.  Legal values for this attribute are EXTERNAL or INTERNAL. Instance: %m", MODULE_NAME, ODT_SRC_4_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ODT_SRC_5_REG != "EXTERNAL") &&
         (ODT_SRC_5_REG != "INTERNAL"))) begin
      $display("Error: [Unisim %s-162] ODT_SRC_5 attribute is set to %s.  Legal values for this attribute are EXTERNAL or INTERNAL. Instance: %m", MODULE_NAME, ODT_SRC_5_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (REFCLK_FREQUENCY_REG < 200.0 || REFCLK_FREQUENCY_REG > 4266.0)) begin
      $display("Error: [Unisim %s-163] REFCLK_FREQUENCY attribute is set to %f.  Legal values for this attribute are 200.0 to 4266.0. Instance: %m", MODULE_NAME, REFCLK_FREQUENCY_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RX_CLK_PHASE_N_REG != "SHIFT_0") &&
         (RX_CLK_PHASE_N_REG != "SHIFT_90"))) begin
      $display("Error: [Unisim %s-171] RX_CLK_PHASE_N attribute is set to %s.  Legal values for this attribute are SHIFT_0 or SHIFT_90. Instance: %m", MODULE_NAME, RX_CLK_PHASE_N_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RX_CLK_PHASE_P_REG != "SHIFT_0") &&
         (RX_CLK_PHASE_P_REG != "SHIFT_90"))) begin
      $display("Error: [Unisim %s-172] RX_CLK_PHASE_P attribute is set to %s.  Legal values for this attribute are SHIFT_0 or SHIFT_90. Instance: %m", MODULE_NAME, RX_CLK_PHASE_P_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RX_DATA_WIDTH_REG != 8) &&
         (RX_DATA_WIDTH_REG != 2) &&
         (RX_DATA_WIDTH_REG != 4))) begin
      $display("Error: [Unisim %s-173] RX_DATA_WIDTH attribute is set to %d.  Legal values for this attribute are 8, 2 or 4. Instance: %m", MODULE_NAME, RX_DATA_WIDTH_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RX_GATING_REG != "DISABLE") &&
         (RX_GATING_REG != "ENABLE"))) begin
      $display("Error: [Unisim %s-174] RX_GATING attribute is set to %s.  Legal values for this attribute are DISABLE or ENABLE. Instance: %m", MODULE_NAME, RX_GATING_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SELF_CALIBRATE_REG != "ENABLE") &&
         (SELF_CALIBRATE_REG != "DISABLE"))) begin
      $display("Error: [Unisim %s-175] SELF_CALIBRATE attribute is set to %s.  Legal values for this attribute are ENABLE or DISABLE. Instance: %m", MODULE_NAME, SELF_CALIBRATE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SERIAL_MODE_REG != "FALSE") &&
         (SERIAL_MODE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-176] SERIAL_MODE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, SERIAL_MODE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TBYTE_CTL_0_REG != "T") &&
         (TBYTE_CTL_0_REG != "PHY_WREN"))) begin
      $display("Error: [Unisim %s-179] TBYTE_CTL_0 attribute is set to %s.  Legal values for this attribute are T or PHY_WREN. Instance: %m", MODULE_NAME, TBYTE_CTL_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TBYTE_CTL_1_REG != "T") &&
         (TBYTE_CTL_1_REG != "PHY_WREN"))) begin
      $display("Error: [Unisim %s-180] TBYTE_CTL_1 attribute is set to %s.  Legal values for this attribute are T or PHY_WREN. Instance: %m", MODULE_NAME, TBYTE_CTL_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TBYTE_CTL_2_REG != "T") &&
         (TBYTE_CTL_2_REG != "PHY_WREN"))) begin
      $display("Error: [Unisim %s-181] TBYTE_CTL_2 attribute is set to %s.  Legal values for this attribute are T or PHY_WREN. Instance: %m", MODULE_NAME, TBYTE_CTL_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TBYTE_CTL_3_REG != "T") &&
         (TBYTE_CTL_3_REG != "PHY_WREN"))) begin
      $display("Error: [Unisim %s-182] TBYTE_CTL_3 attribute is set to %s.  Legal values for this attribute are T or PHY_WREN. Instance: %m", MODULE_NAME, TBYTE_CTL_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TBYTE_CTL_4_REG != "T") &&
         (TBYTE_CTL_4_REG != "PHY_WREN"))) begin
      $display("Error: [Unisim %s-183] TBYTE_CTL_4 attribute is set to %s.  Legal values for this attribute are T or PHY_WREN. Instance: %m", MODULE_NAME, TBYTE_CTL_4_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TBYTE_CTL_5_REG != "T") &&
         (TBYTE_CTL_5_REG != "PHY_WREN"))) begin
      $display("Error: [Unisim %s-184] TBYTE_CTL_5 attribute is set to %s.  Legal values for this attribute are T or PHY_WREN. Instance: %m", MODULE_NAME, TBYTE_CTL_5_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TXRX_LOOPBACK_0_REG != "FALSE") &&
         (TXRX_LOOPBACK_0_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-186] TXRX_LOOPBACK_0 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TXRX_LOOPBACK_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TXRX_LOOPBACK_1_REG != "FALSE") &&
         (TXRX_LOOPBACK_1_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-187] TXRX_LOOPBACK_1 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TXRX_LOOPBACK_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TXRX_LOOPBACK_2_REG != "FALSE") &&
         (TXRX_LOOPBACK_2_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-188] TXRX_LOOPBACK_2 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TXRX_LOOPBACK_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TXRX_LOOPBACK_3_REG != "FALSE") &&
         (TXRX_LOOPBACK_3_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-189] TXRX_LOOPBACK_3 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TXRX_LOOPBACK_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TXRX_LOOPBACK_4_REG != "FALSE") &&
         (TXRX_LOOPBACK_4_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-190] TXRX_LOOPBACK_4 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TXRX_LOOPBACK_4_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TXRX_LOOPBACK_5_REG != "FALSE") &&
         (TXRX_LOOPBACK_5_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-191] TXRX_LOOPBACK_5 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TXRX_LOOPBACK_5_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_DATA_WIDTH_REG != 8) &&
         (TX_DATA_WIDTH_REG != 2) &&
         (TX_DATA_WIDTH_REG != 4))) begin
      $display("Error: [Unisim %s-192] TX_DATA_WIDTH attribute is set to %d.  Legal values for this attribute are 8, 2 or 4. Instance: %m", MODULE_NAME, TX_DATA_WIDTH_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_GATING_REG != "DISABLE") &&
         (TX_GATING_REG != "ENABLE"))) begin
      $display("Error: [Unisim %s-193] TX_GATING attribute is set to %s.  Legal values for this attribute are DISABLE or ENABLE. Instance: %m", MODULE_NAME, TX_GATING_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_OUTPUT_PHASE_90_0_REG != "FALSE") &&
         (TX_OUTPUT_PHASE_90_0_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-201] TX_OUTPUT_PHASE_90_0 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX_OUTPUT_PHASE_90_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_OUTPUT_PHASE_90_1_REG != "FALSE") &&
         (TX_OUTPUT_PHASE_90_1_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-202] TX_OUTPUT_PHASE_90_1 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX_OUTPUT_PHASE_90_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_OUTPUT_PHASE_90_2_REG != "FALSE") &&
         (TX_OUTPUT_PHASE_90_2_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-203] TX_OUTPUT_PHASE_90_2 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX_OUTPUT_PHASE_90_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_OUTPUT_PHASE_90_3_REG != "FALSE") &&
         (TX_OUTPUT_PHASE_90_3_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-204] TX_OUTPUT_PHASE_90_3 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX_OUTPUT_PHASE_90_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_OUTPUT_PHASE_90_4_REG != "FALSE") &&
         (TX_OUTPUT_PHASE_90_4_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-205] TX_OUTPUT_PHASE_90_4 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX_OUTPUT_PHASE_90_4_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_OUTPUT_PHASE_90_5_REG != "FALSE") &&
         (TX_OUTPUT_PHASE_90_5_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-206] TX_OUTPUT_PHASE_90_5 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX_OUTPUT_PHASE_90_5_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_OUTPUT_PHASE_90_TRI_REG != "FALSE") &&
         (TX_OUTPUT_PHASE_90_TRI_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-207] TX_OUTPUT_PHASE_90_TRI attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX_OUTPUT_PHASE_90_TRI_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((WRITE_LEVELING_REG != "FALSE") &&
         (WRITE_LEVELING_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-208] WRITE_LEVELING attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, WRITE_LEVELING_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif


assign CLB2PHY_SCAN_CLK_B_in = 1'b0; // tie off
assign DMC_CTRL_CLK_in = 1'b0; // tie off
assign DMC_FIFO_RD_CLK_in = 1'b0; // tie off

assign CFG2PHY_SCAN_DATA_OUT_INT_in = 4'b1111; // tie off
assign CLB2PHY_CSSD_TRIG_in = 1'b0; // tie off
assign CLB2PHY_KEEPER_EN_in = 6'b111111; // tie off
assign CLB2PHY_LP_RX_DIS_OR_TERM_EN_in = 3'b111; // tie off
assign CLB2PHY_LP_TX_O_OR_PU_EN_0_in = 3'b111; // tie off
assign CLB2PHY_LP_TX_O_OR_PU_EN_1_in = 3'b111; // tie off
assign CLB2PHY_LP_TX_T_OR_PD_EN_0_in = 3'b111; // tie off
assign CLB2PHY_PD_EN_1_in = 3'b111; // tie off
assign CLB2PHY_SCAN_CNTRL_CHNL_IN_in = 1'b0; // tie off
assign CLB2PHY_SCAN_COMP_IN_in = 1'b0; // tie off
assign CLB2PHY_SCAN_EDT_UPDT_B_in = 1'b0; // tie off
assign CLB2PHY_SCAN_EN_B_in = 1'b0; // tie off
assign CLB2PHY_SCAN_IN_in = 1'b0; // tie off
assign CLB2PHY_SCAN_MODE_RST_B_in = 1'b0; // tie off
assign DMC2PHY_RST_in = 1'b0; // tie off
assign DMC_D0_in = 8'b11111111; // tie off
assign DMC_D1_in = 8'b11111111; // tie off
assign DMC_D2_in = 8'b11111111; // tie off
assign DMC_D3_in = 8'b11111111; // tie off
assign DMC_D4_in = 8'b11111111; // tie off
assign DMC_D5_in = 8'b11111111; // tie off
assign DMC_FIFO_RDEN_in = 1'b0; // tie off
assign DMC_PHY_RDEN_in = 4'b0000; // tie off
assign DMC_PHY_WREN_in = 4'b0000; // tie off
assign DMC_RIU_ADDR_in = 8'b00000000; // tie off
assign DMC_RIU_NIBBLE_SEL_in = 1'b0; // tie off
assign DMC_RIU_WR_DATA_in = 16'b0000000000000000; // tie off
assign DMC_RIU_WR_EN_in = 1'b0; // tie off
assign DMC_T_in = 6'b111111; // tie off
assign IJTAG_CAPTURE_DR_IN_in = 1'b1; // tie off
assign IJTAG_CLOCK_DR_IN_in = 1'b1; // tie off
assign IJTAG_RESET_TAP_B_IN_in = 1'b0; // tie off
assign IJTAG_SELECT_DR_IN_in = 1'b1; // tie off
assign IJTAG_SHIFT_DR_IN_in = 1'b1; // tie off
assign IJTAG_UPDATE_DR_IN_in = 1'b1; // tie off
assign IOB2PHY_LP_I_0_in = 3'b111; // tie off
assign IOB2PHY_LP_I_1_in = 3'b111; // tie off
assign RTRIM_M2L_IN_in = 15'b111111111111111; // tie off
assign XXX2PHY_IJTAG_TDI_RETURN_in = 1'b1; // tie off
assign XXX2PHY_IJTAG_TDI_in = 1'b1; // tie off

  SIP_XP5PHY_LS SIP_XP5PHY_LS_INST (
    .CASCADE_0 (CASCADE_0_REG),
    .CASCADE_1 (CASCADE_1_REG),
    .CASCADE_2 (CASCADE_2_REG),
    .CASCADE_3 (CASCADE_3_REG),
    .CASCADE_4 (CASCADE_4_REG),
    .CASCADE_5 (CASCADE_5_REG),
    .CONTINUOUS_DQS (CONTINUOUS_DQS_REG),
    .DELAY_VALUE_0 (DELAY_VALUE_0_REG),
    .DELAY_VALUE_1 (DELAY_VALUE_1_REG),
    .DELAY_VALUE_2 (DELAY_VALUE_2_REG),
    .DELAY_VALUE_3 (DELAY_VALUE_3_REG),
    .DELAY_VALUE_4 (DELAY_VALUE_4_REG),
    .DELAY_VALUE_5 (DELAY_VALUE_5_REG),
    .DIS_IDLY_VT_TRACK (DIS_IDLY_VT_TRACK_REG),
    .DIS_ODLY_VT_TRACK (DIS_ODLY_VT_TRACK_REG),
    .DIS_QDLY_VT_TRACK (DIS_QDLY_VT_TRACK_REG),
    .DQS_MODE (DQS_MODE_REG),
    .DQS_SRC (DQS_SRC_REG),
    .EN_CLK_TO_LOWER (EN_CLK_TO_LOWER_REG),
    .EN_CLK_TO_UPPER (EN_CLK_TO_UPPER_REG),
    .EN_DYN_DLY_MODE (EN_DYN_DLY_MODE_REG),
    .EN_OTHER_NCLK (EN_OTHER_NCLK_REG),
    .EN_OTHER_PCLK (EN_OTHER_PCLK_REG),
    .FAST_CK (FAST_CK_REG),
    .FIFO_MODE_0 (FIFO_MODE_0_REG),
    .FIFO_MODE_1 (FIFO_MODE_1_REG),
    .FIFO_MODE_2 (FIFO_MODE_2_REG),
    .FIFO_MODE_3 (FIFO_MODE_3_REG),
    .FIFO_MODE_4 (FIFO_MODE_4_REG),
    .FIFO_MODE_5 (FIFO_MODE_5_REG),
    .HISTO_EN (HISTO_EN_REG),
    .HISTO_STEPSIZE (HISTO_STEPSIZE_REG),
    .HISTO_TH0 (HISTO_TH0_REG),
    .HISTO_TH1 (HISTO_TH1_REG),
    .IBUF_DIS_SRC_0 (IBUF_DIS_SRC_0_REG),
    .IBUF_DIS_SRC_1 (IBUF_DIS_SRC_1_REG),
    .IBUF_DIS_SRC_2 (IBUF_DIS_SRC_2_REG),
    .IBUF_DIS_SRC_3 (IBUF_DIS_SRC_3_REG),
    .IBUF_DIS_SRC_4 (IBUF_DIS_SRC_4_REG),
    .IBUF_DIS_SRC_5 (IBUF_DIS_SRC_5_REG),
    .INV_RXCLK (INV_RXCLK_REG),
    .LP4_DQS (LP4_DQS_REG),
    .ODELAY_BYPASS_0 (ODELAY_BYPASS_0_REG),
    .ODELAY_BYPASS_1 (ODELAY_BYPASS_1_REG),
    .ODELAY_BYPASS_2 (ODELAY_BYPASS_2_REG),
    .ODELAY_BYPASS_3 (ODELAY_BYPASS_3_REG),
    .ODELAY_BYPASS_4 (ODELAY_BYPASS_4_REG),
    .ODELAY_BYPASS_5 (ODELAY_BYPASS_5_REG),
    .ODT_SRC_0 (ODT_SRC_0_REG),
    .ODT_SRC_1 (ODT_SRC_1_REG),
    .ODT_SRC_2 (ODT_SRC_2_REG),
    .ODT_SRC_3 (ODT_SRC_3_REG),
    .ODT_SRC_4 (ODT_SRC_4_REG),
    .ODT_SRC_5 (ODT_SRC_5_REG),
    .REFCLK_FREQUENCY (REFCLK_FREQUENCY_BIN),
    .ROUNDING_FACTOR (ROUNDING_FACTOR_REG),
    .RX_CLK_PHASE_N (RX_CLK_PHASE_N_REG),
    .RX_CLK_PHASE_P (RX_CLK_PHASE_P_REG),
    .RX_DATA_WIDTH (RX_DATA_WIDTH_REG),
    .RX_GATING (RX_GATING_REG),
    .SELF_CALIBRATE (SELF_CALIBRATE_REG),
    .SERIAL_MODE (SERIAL_MODE_REG),
    .STOP_AFTER_ALIGN (STOP_AFTER_ALIGN_REG),
    .TBYTE_CTL_0 (TBYTE_CTL_0_REG),
    .TBYTE_CTL_1 (TBYTE_CTL_1_REG),
    .TBYTE_CTL_2 (TBYTE_CTL_2_REG),
    .TBYTE_CTL_3 (TBYTE_CTL_3_REG),
    .TBYTE_CTL_4 (TBYTE_CTL_4_REG),
    .TBYTE_CTL_5 (TBYTE_CTL_5_REG),
    .TEST_MCT (TEST_MCT_REG),
    .TXRX_LOOPBACK_0 (TXRX_LOOPBACK_0_REG),
    .TXRX_LOOPBACK_1 (TXRX_LOOPBACK_1_REG),
    .TXRX_LOOPBACK_2 (TXRX_LOOPBACK_2_REG),
    .TXRX_LOOPBACK_3 (TXRX_LOOPBACK_3_REG),
    .TXRX_LOOPBACK_4 (TXRX_LOOPBACK_4_REG),
    .TXRX_LOOPBACK_5 (TXRX_LOOPBACK_5_REG),
    .TX_DATA_WIDTH (TX_DATA_WIDTH_REG),
    .TX_GATING (TX_GATING_REG),
    .TX_INIT_0 (TX_INIT_0_REG),
    .TX_INIT_1 (TX_INIT_1_REG),
    .TX_INIT_2 (TX_INIT_2_REG),
    .TX_INIT_3 (TX_INIT_3_REG),
    .TX_INIT_4 (TX_INIT_4_REG),
    .TX_INIT_5 (TX_INIT_5_REG),
    .TX_INIT_TRI (TX_INIT_TRI_REG),
    .TX_OUTPUT_PHASE_90_0 (TX_OUTPUT_PHASE_90_0_REG),
    .TX_OUTPUT_PHASE_90_1 (TX_OUTPUT_PHASE_90_1_REG),
    .TX_OUTPUT_PHASE_90_2 (TX_OUTPUT_PHASE_90_2_REG),
    .TX_OUTPUT_PHASE_90_3 (TX_OUTPUT_PHASE_90_3_REG),
    .TX_OUTPUT_PHASE_90_4 (TX_OUTPUT_PHASE_90_4_REG),
    .TX_OUTPUT_PHASE_90_5 (TX_OUTPUT_PHASE_90_5_REG),
    .TX_OUTPUT_PHASE_90_TRI (TX_OUTPUT_PHASE_90_TRI_REG),
    .WRITE_LEVELING (WRITE_LEVELING_REG),
    .CFGTRL_OUT (CFGTRL_OUT_out),
    .CNTVALUEOUT (CNTVALUEOUT_out),
    .CTRL_CLK_OUT (CTRL_CLK_OUT_out),
    .DFX_UNEXPECTED_ACTIVATION (DFX_UNEXPECTED_ACTIVATION_out),
    .DLY_RDY (DLY_RDY_out),
    .DMC_DIV4_CLK (DMC_DIV4_CLK_out),
    .DMC_FIFO_EMPTY (DMC_FIFO_EMPTY_out),
    .DMC_Q0 (DMC_Q0_out),
    .DMC_Q1 (DMC_Q1_out),
    .DMC_Q2 (DMC_Q2_out),
    .DMC_Q3 (DMC_Q3_out),
    .DMC_Q4 (DMC_Q4_out),
    .DMC_Q5 (DMC_Q5_out),
    .DYN_DCI (DYN_DCI_out),
    .FIFO_EMPTY (FIFO_EMPTY_out),
    .FIFO_WR_CLK (FIFO_WR_CLK_out),
    .GATE_DLY_OUT (GATE_DLY_OUT_out),
    .GT_STATUS (GT_STATUS_out),
    .IBUF_DISABLE (IBUF_DISABLE_out),
    .IDLY0_OUT (IDLY0_OUT_out),
    .IDLY1_OUT (IDLY1_OUT_out),
    .IDLY2_OUT (IDLY2_OUT_out),
    .IDLY3_OUT (IDLY3_OUT_out),
    .IDLY4_OUT (IDLY4_OUT_out),
    .IDLY5_OUT (IDLY5_OUT_out),
    .IF_IOB2CLB_DFT (IF_IOB2CLB_DFT_out),
    .IJTAG_CAPTURE_DR_OUT (IJTAG_CAPTURE_DR_OUT_out),
    .IJTAG_CLOCK_DR_OUT (IJTAG_CLOCK_DR_OUT_out),
    .IJTAG_RESET_TAP_B_OUT (IJTAG_RESET_TAP_B_OUT_out),
    .IJTAG_SELECT_DR_OUT (IJTAG_SELECT_DR_OUT_out),
    .IJTAG_SHIFT_DR_OUT (IJTAG_SHIFT_DR_OUT_out),
    .IJTAG_UPDATE_DR_OUT (IJTAG_UPDATE_DR_OUT_out),
    .LCG_CTRL_OUT (LCG_CTRL_OUT_out),
    .LCT_CTRL_OUT (LCT_CTRL_OUT_out),
    .LCT_GT_CTRL_OUT (LCT_GT_CTRL_OUT_out),
    .LS_HS_FIXDLY_RDY (LS_HS_FIXDLY_RDY_out),
    .LS_HS_LSHS_LP_TX_O_OR_PU_EN_0 (LS_HS_LSHS_LP_TX_O_OR_PU_EN_0_out),
    .LS_HS_LSHS_LP_TX_O_OR_PU_EN_1 (LS_HS_LSHS_LP_TX_O_OR_PU_EN_1_out),
    .LS_HS_LSHS_LP_TX_T_OR_PD_EN_0 (LS_HS_LSHS_LP_TX_T_OR_PD_EN_0_out),
    .LS_HS_PHY_RDY (LS_HS_PHY_RDY_out),
    .LS_HS_PRIME_VAL (LS_HS_PRIME_VAL_out),
    .MIN_DLY_OUT (MIN_DLY_OUT_out),
    .NQTR_DLY_OUT (NQTR_DLY_OUT_out),
    .ODLY0_OUT (ODLY0_OUT_out),
    .ODLY1_OUT (ODLY1_OUT_out),
    .ODLY2_OUT (ODLY2_OUT_out),
    .ODLY3_OUT (ODLY3_OUT_out),
    .ODLY4_OUT (ODLY4_OUT_out),
    .ODLY5_OUT (ODLY5_OUT_out),
    .PHY2CLB_LP_I_0 (PHY2CLB_LP_I_0_out),
    .PHY2CLB_LP_I_1 (PHY2CLB_LP_I_1_out),
    .PHY2CLB_MASTER_PD (PHY2CLB_MASTER_PD_out),
    .PHY2CLB_SCAN_CNTRL_CHNL_OUT (PHY2CLB_SCAN_CNTRL_CHNL_OUT_out),
    .PHY2CLB_SCAN_COMP_OUT (PHY2CLB_SCAN_COMP_OUT_out),
    .PHY2CLB_SCAN_OUT (PHY2CLB_SCAN_OUT_out),
    .PHY2DMC_GT_STATUS (PHY2DMC_GT_STATUS_out),
    .PHY2IOB_KEEPER_EN (PHY2IOB_KEEPER_EN_out),
    .PHY2IOB_LP_RX_DIS_OR_TERM_EN (PHY2IOB_LP_RX_DIS_OR_TERM_EN_out),
    .PHY2IOB_LP_TX_O_OR_PU_EN_0 (PHY2IOB_LP_TX_O_OR_PU_EN_0_out),
    .PHY2IOB_LP_TX_O_OR_PU_EN_1 (PHY2IOB_LP_TX_O_OR_PU_EN_1_out),
    .PHY2IOB_LP_TX_T_OR_PD_EN_0 (PHY2IOB_LP_TX_T_OR_PD_EN_0_out),
    .PHY2IOB_PD_EN_1 (PHY2IOB_PD_EN_1_out),
    .PHY2IOB_R2RDAC_MODE (PHY2IOB_R2RDAC_MODE_out),
    .PHY2IOB_R2RDAC_SEL (PHY2IOB_R2RDAC_SEL_out),
    .PHY2PHY_BISC_START_OUT (PHY2PHY_BISC_START_OUT_out),
    .PHY2PHY_BISC_STOP_OUT (PHY2PHY_BISC_STOP_OUT_out),
    .PHY2XXX_IJTAG_TDO (PHY2XXX_IJTAG_TDO_out),
    .PHY2XXX_IJTAG_TDO_RETURN (PHY2XXX_IJTAG_TDO_RETURN_out),
    .PHY_RDY (PHY_RDY_out),
    .PQTR_DLY_OUT (PQTR_DLY_OUT_out),
    .Q0 (Q0_out),
    .Q1 (Q1_out),
    .Q2 (Q2_out),
    .Q3 (Q3_out),
    .Q4 (Q4_out),
    .Q5 (Q5_out),
    .RIU2CLB_RD_DATA (RIU2CLB_RD_DATA_out),
    .RIU2CLB_VALID (RIU2CLB_VALID_out),
    .RIU_CTRL_OUT (RIU_CTRL_OUT_out),
    .RIU_RD_DATA (RIU_RD_DATA_out),
    .RIU_RD_VALID (RIU_RD_VALID_out),
    .RTRIM_M2L_OUT (RTRIM_M2L_OUT_out),
    .SCAN_CTRL_OUT (SCAN_CTRL_OUT_out),
    .TRID_OUT (TRID_OUT_out),
    .TSTATE_DLY_OUT (TSTATE_DLY_OUT_out),
    .TXD0_OUT (TXD0_OUT_out),
    .TXD1_OUT (TXD1_OUT_out),
    .TXD2_OUT (TXD2_OUT_out),
    .TXD3_OUT (TXD3_OUT_out),
    .TXD4_OUT (TXD4_OUT_out),
    .TXD5_OUT (TXD5_OUT_out),
    .CE (CE_in),
    .CFG2PHY_SCAN_DATA_OUT_INT (CFG2PHY_SCAN_DATA_OUT_INT_in),
    .CLB2PHY_CSSD_TRIG (CLB2PHY_CSSD_TRIG_in),
    .CLB2PHY_DYNAMIC_DCI_TS (CLB2PHY_DYNAMIC_DCI_TS_in),
    .CLB2PHY_IBUF_DISABLE (CLB2PHY_IBUF_DISABLE_in),
    .CLB2PHY_KEEPER_EN (CLB2PHY_KEEPER_EN_in),
    .CLB2PHY_LP_RX_DIS_OR_TERM_EN (CLB2PHY_LP_RX_DIS_OR_TERM_EN_in),
    .CLB2PHY_LP_TX_O_OR_PU_EN_0 (CLB2PHY_LP_TX_O_OR_PU_EN_0_in),
    .CLB2PHY_LP_TX_O_OR_PU_EN_1 (CLB2PHY_LP_TX_O_OR_PU_EN_1_in),
    .CLB2PHY_LP_TX_T_OR_PD_EN_0 (CLB2PHY_LP_TX_T_OR_PD_EN_0_in),
    .CLB2PHY_PD_EN_1 (CLB2PHY_PD_EN_1_in),
    .CLB2PHY_SCAN_CLK_B (CLB2PHY_SCAN_CLK_B_in),
    .CLB2PHY_SCAN_CNTRL_CHNL_IN (CLB2PHY_SCAN_CNTRL_CHNL_IN_in),
    .CLB2PHY_SCAN_COMP_IN (CLB2PHY_SCAN_COMP_IN_in),
    .CLB2PHY_SCAN_EDT_UPDT_B (CLB2PHY_SCAN_EDT_UPDT_B_in),
    .CLB2PHY_SCAN_EN_B (CLB2PHY_SCAN_EN_B_in),
    .CLB2PHY_SCAN_IN (CLB2PHY_SCAN_IN_in),
    .CLB2PHY_SCAN_MODE_RST_B (CLB2PHY_SCAN_MODE_RST_B_in),
    .CNTVALUEIN (CNTVALUEIN_in),
    .CTRL_CLK (CTRL_CLK_in),
    .D0 (D0_in),
    .D1 (D1_in),
    .D2 (D2_in),
    .D3 (D3_in),
    .D4 (D4_in),
    .D5 (D5_in),
    .DMC2PHY_RST (DMC2PHY_RST_in),
    .DMC_CTRL_CLK (DMC_CTRL_CLK_in),
    .DMC_D0 (DMC_D0_in),
    .DMC_D1 (DMC_D1_in),
    .DMC_D2 (DMC_D2_in),
    .DMC_D3 (DMC_D3_in),
    .DMC_D4 (DMC_D4_in),
    .DMC_D5 (DMC_D5_in),
    .DMC_FIFO_RDEN (DMC_FIFO_RDEN_in),
    .DMC_FIFO_RD_CLK (DMC_FIFO_RD_CLK_in),
    .DMC_PHY_RDEN (DMC_PHY_RDEN_in),
    .DMC_PHY_WREN (DMC_PHY_WREN_in),
    .DMC_RIU_ADDR (DMC_RIU_ADDR_in),
    .DMC_RIU_NIBBLE_SEL (DMC_RIU_NIBBLE_SEL_in),
    .DMC_RIU_WR_DATA (DMC_RIU_WR_DATA_in),
    .DMC_RIU_WR_EN (DMC_RIU_WR_EN_in),
    .DMC_T (DMC_T_in),
    .EN_VTC (EN_VTC_in),
    .FIFO_RDEN (FIFO_RDEN_in),
    .FIFO_RD_CLK (FIFO_RD_CLK_in),
    .HCG_RXCTRL_IN (HCG_RXCTRL_IN_in),
    .HCG_TXCTRL_IN (HCG_TXCTRL_IN_in),
    .HCT_GT_STATUS_IN (HCT_GT_STATUS_IN_in),
    .HCT_MON_IN (HCT_MON_IN_in),
    .HCT_REFCLKEN_IN (HCT_REFCLKEN_IN_in),
    .HRT_PNSEL_IN (HRT_PNSEL_IN_in),
    .IJTAG_CAPTURE_DR_IN (IJTAG_CAPTURE_DR_IN_in),
    .IJTAG_CLOCK_DR_IN (IJTAG_CLOCK_DR_IN_in),
    .IJTAG_RESET_TAP_B_IN (IJTAG_RESET_TAP_B_IN_in),
    .IJTAG_SELECT_DR_IN (IJTAG_SELECT_DR_IN_in),
    .IJTAG_SHIFT_DR_IN (IJTAG_SHIFT_DR_IN_in),
    .IJTAG_UPDATE_DR_IN (IJTAG_UPDATE_DR_IN_in),
    .INC (INC_in),
    .IOB2COMP_LSPEED_I (IOB2COMP_LSPEED_I_in),
    .IOB2PHY_LP_I_0 (IOB2PHY_LP_I_0_in),
    .IOB2PHY_LP_I_1 (IOB2PHY_LP_I_1_in),
    .LD (LD_in),
    .OSC_TST_CLK_IN (OSC_TST_CLK_IN_in),
    .PHY2PHY_BISC_START_IN (PHY2PHY_BISC_START_IN_in),
    .PHY2PHY_BISC_STOP_IN (PHY2PHY_BISC_STOP_IN_in),
    .PHY_RDEN (PHY_RDEN_in),
    .PHY_WREN (PHY_WREN_in),
    .RIU_ADDR (RIU_ADDR_in),
    .RIU_NIBBLE_SEL (RIU_NIBBLE_SEL_in),
    .RIU_WR_DATA (RIU_WR_DATA_in),
    .RIU_WR_EN (RIU_WR_EN_in),
    .RST (RST_in),
    .RTRIM_M2L_IN (RTRIM_M2L_IN_in),
    .RXD0_IN (RXD0_IN_in),
    .RXD1_IN (RXD1_IN_in),
    .RXD2_IN (RXD2_IN_in),
    .RXD3_IN (RXD3_IN_in),
    .RXD4_IN (RXD4_IN_in),
    .RXD5_IN (RXD5_IN_in),
    .RXTX_SEL (RXTX_SEL_in),
    .RX_EN_VTC (RX_EN_VTC_in),
    .RX_RST (RX_RST_in),
    .T (T_in),
    .TX_EN_VTC (TX_EN_VTC_in),
    .TX_RST (TX_RST_in),
    .XXX2PHY_IJTAG_TDI (XXX2PHY_IJTAG_TDI_in),
    .XXX2PHY_IJTAG_TDI_RETURN (XXX2PHY_IJTAG_TDI_RETURN_in),
    .GSR (glblGSR)
  );

endmodule

`endcelldefine
