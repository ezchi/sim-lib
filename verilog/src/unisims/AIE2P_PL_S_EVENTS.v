///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2022 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2023.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        AIE2P_PL_S_EVENTS
// /___/   /\      Filename    : AIE2P_PL_S_EVENTS.v
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

module AIE2P_PL_S_EVENTS
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  input CLK,
  input [15:0] TRIG
);

// define constants
  localparam MODULE_NAME = "AIE2P_PL_S_EVENTS";
  
`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

// begin behavioral model

// end behavioral model

endmodule

`endcelldefine
