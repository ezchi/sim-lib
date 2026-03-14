///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2017 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        Analog Auxiliary SYSMON Input Buffer
// /___/   /\      Filename    : IBUF_ANALOG.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//
//    10/30/13 - Initial version.
//    02/04/15 - 845545 - Remove pulldown and strength specification.
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`define XIL_XECLIB
 `celldefine

module IBUF_ANALOG
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output O,

  input I
);

// define constants
  localparam MODULE_NAME = "IBUF_ANALOG";
  `ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif
//  tri0 glblGSR = glbl.GSR;

// begin behavioral model

  assign O = I;

// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
specify
  (I => O) = (0:0:0, 0:0:0);
  specparam PATHPULSE$ = 0;
endspecify
`endif
`endif

endmodule

`endcelldefine
