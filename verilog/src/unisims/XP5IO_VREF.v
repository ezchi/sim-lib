///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2025 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2025.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        XP5IO_VREF
// /___/   /\      Filename    : XP5IO_VREF.v
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

module XP5IO_VREF #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter ISTANDARD = "UNUSED",
  parameter integer VOH = 100,
  parameter VREF_NIB = "VREF_MC"
)(
  output VREF,

  input [9:0] FABRIC_VREF_TUNE,
  input PHY2IOB_R2RDAC_MODE,
  input [9:0] PHY2IOB_R2RDAC_SEL
);

// define constants
  localparam MODULE_NAME = "XP5IO_VREF";
  
// Parameter encodings and registers
  localparam VREF_NIB_VREF_FABRIC = 1;
  localparam VREF_NIB_VREF_MC = 0;
  localparam VREF_NIB_VREF_RIU = 2;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "XP5IO_VREF_dr.v"
`else
  reg [48:1] ISTANDARD_REG = ISTANDARD;
  reg [31:0] VOH_REG = VOH;
  reg [88:1] VREF_NIB_REG = VREF_NIB;
`endif

`ifdef XIL_XECLIB
  wire [6:0] VOH_BIN;
  wire [1:0] VREF_NIB_BIN;
`else
  reg [6:0] VOH_BIN;
  reg [1:0] VREF_NIB_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
`endif

  

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
  assign VOH_BIN = VOH_REG[6:0];
  
  assign VREF_NIB_BIN =
      (VREF_NIB_REG == "VREF_MC") ? VREF_NIB_VREF_MC :
      (VREF_NIB_REG == "VREF_FABRIC") ? VREF_NIB_VREF_FABRIC :
      (VREF_NIB_REG == "VREF_RIU") ? VREF_NIB_VREF_RIU :
       VREF_NIB_VREF_MC;
  
`else
  always @ (trig_attr) begin
  #1;
  VOH_BIN = VOH_REG[6:0];
  
  VREF_NIB_BIN =
      (VREF_NIB_REG == "VREF_MC") ? VREF_NIB_VREF_MC :
      (VREF_NIB_REG == "VREF_FABRIC") ? VREF_NIB_VREF_FABRIC :
      (VREF_NIB_REG == "VREF_RIU") ? VREF_NIB_VREF_RIU :
       VREF_NIB_VREF_MC;
  
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((VOH_REG < 0) || (VOH_REG > 100))) begin
      $display("Error: [Unisim %s-102] VOH attribute is set to %d.  Legal values for this attribute are 0 to 100. Instance: %m", MODULE_NAME, VOH_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((VREF_NIB_REG != "VREF_MC") &&
         (VREF_NIB_REG != "VREF_FABRIC") &&
         (VREF_NIB_REG != "VREF_RIU"))) begin
      $display("Error: [Unisim %s-103] VREF_NIB attribute is set to %s.  Legal values for this attribute are VREF_MC, VREF_FABRIC or VREF_RIU. Instance: %m", MODULE_NAME, VREF_NIB_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model

// end behavioral model

endmodule

`endcelldefine
