///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2022 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2023.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        AIE2P_PL_S_AXIS64
// /___/   /\      Filename    : AIE2P_PL_S_AXIS64.v
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

module AIE2P_PL_S_AXIS64
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output S_AXIS_TREADY,
  output TO_AIE,

  input S_AXIS_ACLK,
  input [63:0] S_AXIS_TDATA,
  input S_AXIS_TKEEP,
  input S_AXIS_TLAST,
  input S_AXIS_TVALID
);

// define constants
  localparam MODULE_NAME = "AIE2P_PL_S_AXIS64";
  
`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

// begin behavioral model

// end behavioral model

endmodule

`endcelldefine
