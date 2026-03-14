///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2024 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2024.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        FUSE_CLK
// /___/   /\      Filename    : FUSE_CLK.v
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

module FUSE_CLK
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  input CLK
);

// define constants
  localparam MODULE_NAME = "FUSE_CLK";
  
`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  

// begin behavioral model

// end behavioral model

endmodule

`endcelldefine
