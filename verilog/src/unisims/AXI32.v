///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2023 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2024.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        AXI32
// /___/   /\      Filename    : AXI32.v
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

module AXI32
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output ARREADY,
  output AWREADY,
  output [7:0] BID,
  output [1:0] BRESP,
  output BVALID,
  output [31:0] RDATA,
  output [7:0] RID,
  output RLAST,
  output [1:0] RRESP,
  output RVALID,
  output WREADY,

  input [27:0] ARADDR,
  input [1:0] ARBURST,
  input [3:0] ARCACHE,
  input [7:0] ARID,
  input [3:0] ARLEN,
  input ARLOCK,
  input [2:0] ARPROT,
  input [3:0] ARQOS,
  input [2:0] ARSIZE,
  input ARVALID,
  input [27:0] AWADDR,
  input [1:0] AWBURST,
  input [3:0] AWCACHE,
  input [7:0] AWID,
  input [3:0] AWLEN,
  input AWLOCK,
  input [2:0] AWPROT,
  input [3:0] AWQOS,
  input [2:0] AWSIZE,
  input AWVALID,
  input AXICLK,
  input BREADY,
  input RREADY,
  input [31:0] WDATA,
  input [7:0] WID,
  input WLAST,
  input [3:0] WSTRB,
  input WVALID
);

// define constants
  localparam MODULE_NAME = "AXI32";
  
`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  

// begin behavioral model

// end behavioral model

endmodule

`endcelldefine
