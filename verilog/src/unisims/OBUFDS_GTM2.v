///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2025 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        OBUFDS_GTM2
// /___/   /\      Filename    : OBUFDS_GTM2.v
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

module OBUFDS_GTM2
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output O,
  output OB,

  input CE,
  input I
);

// define constants
  localparam MODULE_NAME = "OBUFDS_GTM2";
  
`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  

// begin behavioral model

`ifdef XIL_XECLIB
  reg glblGTS = 1'b0;
`else
  tri0 glblGTS = glbl.GTS;
`endif

// =====================
// Generate O
// =====================

  assign O = ((CE === 1'b0) || glblGTS) ? 1'bz : I;
  assign OB = ((CE === 1'b0) || glblGTS) ? 1'bz : ~I;


// end behavioral model

endmodule

`endcelldefine
