///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2025 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2025.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        PLLE4XP_BASE
// /___/   /\      Filename    : PLLE4XP_BASE.v
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

module PLLE4XP_BASE #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer CLKFBOUT_MULT = 5,
  parameter real CLKFBOUT_PHASE = 0.000,
  parameter real CLKIN_PERIOD = 0.000,
  parameter integer CLKOUT0_DIVIDE = 1,
  parameter real CLKOUT0_DUTY_CYCLE = 0.500,
  parameter real CLKOUT0_PHASE = 0.000,
  parameter integer CLKOUT1_DIVIDE = 1,
  parameter real CLKOUT1_DUTY_CYCLE = 0.500,
  parameter real CLKOUT1_PHASE = 0.000,
  parameter CLKOUTPHY_MODE = "VCO_2X",
  parameter integer DIVCLK_DIVIDE = 1,
  parameter [0:0] IS_CLKFBIN_INVERTED = 1'b0,
  parameter [0:0] IS_CLKIN_INVERTED = 1'b0,
  parameter [0:0] IS_PWRDWN_INVERTED = 1'b0,
  parameter [0:0] IS_RST_INVERTED = 1'b0,
  parameter real REF_JITTER = 0.010,
  parameter STARTUP_WAIT = "FALSE",
  parameter VCO_RANGE = "HIGHRANGE"
)(
  output CLKFBOUT,
  output CLKOUT0,
  output CLKOUT0B,
  output CLKOUT1,
  output CLKOUT1B,
  output CLKOUTPHY,
  output LOCKED,

  input CLKFBIN,
  input CLKIN,
  input CLKOUTPHYEN,
  input PWRDWN,
  input RST
);

// define constants
  localparam MODULE_NAME = "PLLE4XP_BASE";
  
// Parameter encodings and registers
  localparam CLKOUTPHY_MODE_VCO = 1;
  localparam CLKOUTPHY_MODE_VCO_2X = 0;
  localparam CLKOUTPHY_MODE_VCO_DMC = 2;
  localparam CLKOUTPHY_MODE_VCO_HALF = 3;
  localparam STARTUP_WAIT_FALSE = 0;
  localparam STARTUP_WAIT_TRUE = 1;
  localparam VCO_RANGE_HIGHRANGE = 0;
  localparam VCO_RANGE_LOWRANGE = 1;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "PLLE4XP_BASE_dr.v"
`else
  reg [31:0] CLKFBOUT_MULT_REG = CLKFBOUT_MULT;
  real CLKFBOUT_PHASE_REG = CLKFBOUT_PHASE;
  real CLKIN_PERIOD_REG = CLKIN_PERIOD;
  reg [31:0] CLKOUT0_DIVIDE_REG = CLKOUT0_DIVIDE;
  real CLKOUT0_DUTY_CYCLE_REG = CLKOUT0_DUTY_CYCLE;
  real CLKOUT0_PHASE_REG = CLKOUT0_PHASE;
  reg [31:0] CLKOUT1_DIVIDE_REG = CLKOUT1_DIVIDE;
  real CLKOUT1_DUTY_CYCLE_REG = CLKOUT1_DUTY_CYCLE;
  real CLKOUT1_PHASE_REG = CLKOUT1_PHASE;
  reg [64:1] CLKOUTPHY_MODE_REG = CLKOUTPHY_MODE;
  reg [31:0] DIVCLK_DIVIDE_REG = DIVCLK_DIVIDE;
  reg [0:0] IS_CLKFBIN_INVERTED_REG = IS_CLKFBIN_INVERTED;
  reg [0:0] IS_CLKIN_INVERTED_REG = IS_CLKIN_INVERTED;
  reg [0:0] IS_PWRDWN_INVERTED_REG = IS_PWRDWN_INVERTED;
  reg [0:0] IS_RST_INVERTED_REG = IS_RST_INVERTED;
  real REF_JITTER_REG = REF_JITTER;
  reg [40:1] STARTUP_WAIT_REG = STARTUP_WAIT;
  reg [72:1] VCO_RANGE_REG = VCO_RANGE;
`endif

`ifdef XIL_XECLIB
  wire [4:0] CLKFBOUT_MULT_BIN;
  wire [63:0] CLKFBOUT_PHASE_BIN;
  wire [63:0] CLKIN_PERIOD_BIN;
  wire [7:0] CLKOUT0_DIVIDE_BIN;
  wire [63:0] CLKOUT0_DUTY_CYCLE_BIN;
  wire [63:0] CLKOUT0_PHASE_BIN;
  wire [7:0] CLKOUT1_DIVIDE_BIN;
  wire [63:0] CLKOUT1_DUTY_CYCLE_BIN;
  wire [63:0] CLKOUT1_PHASE_BIN;
  wire [1:0] CLKOUTPHY_MODE_BIN;
  wire [3:0] DIVCLK_DIVIDE_BIN;
  wire [63:0] REF_JITTER_BIN;
  wire STARTUP_WAIT_BIN;
  wire VCO_RANGE_BIN;
`else
  reg [4:0] CLKFBOUT_MULT_BIN;
  reg [63:0] CLKFBOUT_PHASE_BIN;
  reg [63:0] CLKIN_PERIOD_BIN;
  reg [7:0] CLKOUT0_DIVIDE_BIN;
  reg [63:0] CLKOUT0_DUTY_CYCLE_BIN;
  reg [63:0] CLKOUT0_PHASE_BIN;
  reg [7:0] CLKOUT1_DIVIDE_BIN;
  reg [63:0] CLKOUT1_DUTY_CYCLE_BIN;
  reg [63:0] CLKOUT1_PHASE_BIN;
  reg [1:0] CLKOUTPHY_MODE_BIN;
  reg [3:0] DIVCLK_DIVIDE_BIN;
  reg [63:0] REF_JITTER_BIN;
  reg STARTUP_WAIT_BIN;
  reg VCO_RANGE_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
`endif

  wire CLKFBIN_in;
  wire CLKIN_in;
  wire CLKOUTPHYEN_in;
  wire PWRDWN_in;
  wire RST_in;

  

  assign CLKFBIN_in = (CLKFBIN !== 1'bz) && (CLKFBIN ^ IS_CLKFBIN_INVERTED_REG); // rv 0
  assign CLKIN_in = (CLKIN !== 1'bz) && (CLKIN ^ IS_CLKIN_INVERTED_REG); // rv 0
  assign CLKOUTPHYEN_in = (CLKOUTPHYEN === 1'bz) || CLKOUTPHYEN; // rv 1
  assign PWRDWN_in = (PWRDWN !== 1'bz) && (PWRDWN ^ IS_PWRDWN_INVERTED_REG); // rv 0
  assign RST_in = (RST !== 1'bz) && (RST ^ IS_RST_INVERTED_REG); // rv 0

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
  assign CLKFBOUT_MULT_BIN = CLKFBOUT_MULT_REG[4:0];
  
  assign CLKFBOUT_PHASE_BIN = CLKFBOUT_PHASE_REG * 1000;
  
  assign CLKIN_PERIOD_BIN = CLKIN_PERIOD_REG * 1000;
  
  assign CLKOUT0_DIVIDE_BIN = CLKOUT0_DIVIDE_REG[7:0];
  
  assign CLKOUT0_DUTY_CYCLE_BIN = CLKOUT0_DUTY_CYCLE_REG * 1000;
  
  assign CLKOUT0_PHASE_BIN = CLKOUT0_PHASE_REG * 1000;
  
  assign CLKOUT1_DIVIDE_BIN = CLKOUT1_DIVIDE_REG[7:0];
  
  assign CLKOUT1_DUTY_CYCLE_BIN = CLKOUT1_DUTY_CYCLE_REG * 1000;
  
  assign CLKOUT1_PHASE_BIN = CLKOUT1_PHASE_REG * 1000;
  
  assign CLKOUTPHY_MODE_BIN =
      (CLKOUTPHY_MODE_REG == "VCO_2X") ? CLKOUTPHY_MODE_VCO_2X :
      (CLKOUTPHY_MODE_REG == "VCO") ? CLKOUTPHY_MODE_VCO :
      (CLKOUTPHY_MODE_REG == "VCO_DMC") ? CLKOUTPHY_MODE_VCO_DMC :
      (CLKOUTPHY_MODE_REG == "VCO_HALF") ? CLKOUTPHY_MODE_VCO_HALF :
       CLKOUTPHY_MODE_VCO_2X;
  
  assign DIVCLK_DIVIDE_BIN = DIVCLK_DIVIDE_REG[3:0];
  
  assign REF_JITTER_BIN = REF_JITTER_REG * 1000;
  
  assign STARTUP_WAIT_BIN =
      (STARTUP_WAIT_REG == "FALSE") ? STARTUP_WAIT_FALSE :
      (STARTUP_WAIT_REG == "TRUE") ? STARTUP_WAIT_TRUE :
       STARTUP_WAIT_FALSE;
  
  assign VCO_RANGE_BIN =
      (VCO_RANGE_REG == "HIGHRANGE") ? VCO_RANGE_HIGHRANGE :
      (VCO_RANGE_REG == "LOWRANGE") ? VCO_RANGE_LOWRANGE :
       VCO_RANGE_HIGHRANGE;
  
`else
  always @ (trig_attr) begin
  #1;
  CLKFBOUT_MULT_BIN = CLKFBOUT_MULT_REG[4:0];
  
  CLKFBOUT_PHASE_BIN = CLKFBOUT_PHASE_REG * 1000;
  
  CLKIN_PERIOD_BIN = CLKIN_PERIOD_REG * 1000;
  
  CLKOUT0_DIVIDE_BIN = CLKOUT0_DIVIDE_REG[7:0];
  
  CLKOUT0_DUTY_CYCLE_BIN = CLKOUT0_DUTY_CYCLE_REG * 1000;
  
  CLKOUT0_PHASE_BIN = CLKOUT0_PHASE_REG * 1000;
  
  CLKOUT1_DIVIDE_BIN = CLKOUT1_DIVIDE_REG[7:0];
  
  CLKOUT1_DUTY_CYCLE_BIN = CLKOUT1_DUTY_CYCLE_REG * 1000;
  
  CLKOUT1_PHASE_BIN = CLKOUT1_PHASE_REG * 1000;
  
  CLKOUTPHY_MODE_BIN =
      (CLKOUTPHY_MODE_REG == "VCO_2X") ? CLKOUTPHY_MODE_VCO_2X :
      (CLKOUTPHY_MODE_REG == "VCO") ? CLKOUTPHY_MODE_VCO :
      (CLKOUTPHY_MODE_REG == "VCO_DMC") ? CLKOUTPHY_MODE_VCO_DMC :
      (CLKOUTPHY_MODE_REG == "VCO_HALF") ? CLKOUTPHY_MODE_VCO_HALF :
       CLKOUTPHY_MODE_VCO_2X;
  
  DIVCLK_DIVIDE_BIN = DIVCLK_DIVIDE_REG[3:0];
  
  REF_JITTER_BIN = REF_JITTER_REG * 1000;
  
  STARTUP_WAIT_BIN =
      (STARTUP_WAIT_REG == "FALSE") ? STARTUP_WAIT_FALSE :
      (STARTUP_WAIT_REG == "TRUE") ? STARTUP_WAIT_TRUE :
       STARTUP_WAIT_FALSE;
  
  VCO_RANGE_BIN =
      (VCO_RANGE_REG == "HIGHRANGE") ? VCO_RANGE_HIGHRANGE :
      (VCO_RANGE_REG == "LOWRANGE") ? VCO_RANGE_LOWRANGE :
       VCO_RANGE_HIGHRANGE;
  
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((CLKFBOUT_MULT_REG < 2) || (CLKFBOUT_MULT_REG > 21))) begin
      $display("Error: [Unisim %s-101] CLKFBOUT_MULT attribute is set to %d.  Legal values for this attribute are 2 to 21. Instance: %m", MODULE_NAME, CLKFBOUT_MULT_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKFBOUT_PHASE_REG < -360.000 || CLKFBOUT_PHASE_REG > 360.000)) begin
      $display("Error: [Unisim %s-102] CLKFBOUT_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKFBOUT_PHASE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKIN_PERIOD_REG < 0.000 || CLKIN_PERIOD_REG > 14.286)) begin
      $display("Error: [Unisim %s-103] CLKIN_PERIOD attribute is set to %f.  Legal values for this attribute are 0.000 to 14.286. Instance: %m", MODULE_NAME, CLKIN_PERIOD_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLKOUT0_DIVIDE_REG < 1) || (CLKOUT0_DIVIDE_REG > 128))) begin
      $display("Error: [Unisim %s-104] CLKOUT0_DIVIDE attribute is set to %d.  Legal values for this attribute are 1 to 128. Instance: %m", MODULE_NAME, CLKOUT0_DIVIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT0_DUTY_CYCLE_REG < 0.001 || CLKOUT0_DUTY_CYCLE_REG > 0.999)) begin
      $display("Error: [Unisim %s-105] CLKOUT0_DUTY_CYCLE attribute is set to %f.  Legal values for this attribute are 0.001 to 0.999. Instance: %m", MODULE_NAME, CLKOUT0_DUTY_CYCLE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT0_PHASE_REG < -360.000 || CLKOUT0_PHASE_REG > 360.000)) begin
      $display("Error: [Unisim %s-106] CLKOUT0_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT0_PHASE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLKOUT1_DIVIDE_REG < 1) || (CLKOUT1_DIVIDE_REG > 128))) begin
      $display("Error: [Unisim %s-107] CLKOUT1_DIVIDE attribute is set to %d.  Legal values for this attribute are 1 to 128. Instance: %m", MODULE_NAME, CLKOUT1_DIVIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT1_DUTY_CYCLE_REG < 0.001 || CLKOUT1_DUTY_CYCLE_REG > 0.999)) begin
      $display("Error: [Unisim %s-108] CLKOUT1_DUTY_CYCLE attribute is set to %f.  Legal values for this attribute are 0.001 to 0.999. Instance: %m", MODULE_NAME, CLKOUT1_DUTY_CYCLE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT1_PHASE_REG < -360.000 || CLKOUT1_PHASE_REG > 360.000)) begin
      $display("Error: [Unisim %s-109] CLKOUT1_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT1_PHASE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLKOUTPHY_MODE_REG != "VCO_2X") &&
         (CLKOUTPHY_MODE_REG != "VCO") &&
         (CLKOUTPHY_MODE_REG != "VCO_DMC") &&
         (CLKOUTPHY_MODE_REG != "VCO_HALF"))) begin
      $display("Error: [Unisim %s-110] CLKOUTPHY_MODE attribute is set to %s.  Legal values for this attribute are VCO_2X, VCO, VCO_DMC or VCO_HALF. Instance: %m", MODULE_NAME, CLKOUTPHY_MODE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DIVCLK_DIVIDE_REG < 1) || (DIVCLK_DIVIDE_REG > 15))) begin
      $display("Error: [Unisim %s-111] DIVCLK_DIVIDE attribute is set to %d.  Legal values for this attribute are 1 to 15. Instance: %m", MODULE_NAME, DIVCLK_DIVIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (REF_JITTER_REG < 0.000 || REF_JITTER_REG > 0.999)) begin
      $display("Error: [Unisim %s-116] REF_JITTER attribute is set to %f.  Legal values for this attribute are 0.000 to 0.999. Instance: %m", MODULE_NAME, REF_JITTER_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((STARTUP_WAIT_REG != "FALSE") &&
         (STARTUP_WAIT_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-117] STARTUP_WAIT attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, STARTUP_WAIT_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((VCO_RANGE_REG != "HIGHRANGE") &&
         (VCO_RANGE_REG != "LOWRANGE"))) begin
      $display("Error: [Unisim %s-118] VCO_RANGE attribute is set to %s.  Legal values for this attribute are HIGHRANGE or LOWRANGE. Instance: %m", MODULE_NAME, VCO_RANGE_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model

  initial begin
    #1;
    if ($realtime == 0) begin
      $display ("Error: [Unisim %s-1] Simulator resolution is set to a value greater than 1 ps. ", MODULE_NAME);
      $display ("The simulator resolution must be set to 1ps or smaller. Instance %m");
      #1 $finish;
    end
  end

  wire OPEN_DRDY;
  wire OPEN_PSDONE;
  wire OPEN_FBS;
  wire OPEN_INS;
  wire [15:0] OPEN_DO;

  PLLE4XP_ADV #(
       .CLKFBOUT_MULT(CLKFBOUT_MULT),
       .CLKFBOUT_PHASE(CLKFBOUT_PHASE),
       .CLKIN_PERIOD(CLKIN_PERIOD),
       .CLKOUT0_DIVIDE(CLKOUT0_DIVIDE),
       .CLKOUT0_DUTY_CYCLE(CLKOUT0_DUTY_CYCLE),
       .CLKOUT0_PHASE(CLKOUT0_PHASE),
       .CLKOUT1_DIVIDE(CLKOUT1_DIVIDE),
       .CLKOUT1_DUTY_CYCLE(CLKOUT1_DUTY_CYCLE),
       .CLKOUT1_PHASE(CLKOUT1_PHASE),
       .CLKOUTPHY_MODE(CLKOUTPHY_MODE),
       .DIVCLK_DIVIDE(DIVCLK_DIVIDE),
       .IS_CLKFBIN_INVERTED(IS_CLKFBIN_INVERTED),
       .IS_CLKIN_INVERTED(IS_CLKIN_INVERTED),
       .IS_PWRDWN_INVERTED(IS_PWRDWN_INVERTED),
       .IS_RST_INVERTED(IS_RST_INVERTED),
       .REF_JITTER(REF_JITTER),
       .STARTUP_WAIT(STARTUP_WAIT)
      ) pll_adv_1 (
       .CLKFBOUT (CLKFBOUT),
       .CLKOUT0 (CLKOUT0),
       .CLKOUT0B (CLKOUT0B),
       .CLKOUT1 (CLKOUT1),
       .CLKOUT1B (CLKOUT1B),
       .CLKOUTPHY (CLKOUTPHY),
       .CLKOUTPHYEN (CLKOUTPHYEN),
       .DO (OPEN_DO),
       .DRDY (OPEN_DRDY),
       .LOCKED (LOCKED),
       .CLKFBIN (CLKFBIN),
       .CLKIN (CLKIN),
       .DADDR (7'b0),
       .DCLK (1'b0),
       .DEN (1'b0),
       .DI (16'b0),
       .DWE (1'b0),
       .PWRDWN(PWRDWN),
       .RST (RST)
    );

// end behavioral model

endmodule

`endcelldefine
