`timescale 1ps/1ps

(* XPM_MODULE = "TRUE", KEEP_HIERARCHY = "SOFT", DONT_TOUCH = "yes" *)
module xpm_pmc_bridge # (
  
  parameter integer DATA_WIDTH	= 32,
  parameter integer ADDR_WIDTH	= 28,
  parameter integer ID_WIDTH	= 8
) (

  (* X_INTERFACE_IGNORE = "true" *)
  input  wire                     S_AXI_clk,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWID" *)
  (* X_INTERFACE_MODE = "slave" *)
  input  wire [ID_WIDTH-1:0]      S_AXI_awid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *)
  input  wire [ADDR_WIDTH-1:0]    S_AXI_awaddr,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWLEN" *)
  input  wire [3:0]               S_AXI_awlen,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWSIZE" *)
  input  wire [2:0]               S_AXI_awsize,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWBURST" *)
  input  wire [1:0]               S_AXI_awburst,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWLOCK" *)
  input  wire [0:0]               S_AXI_awlock,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWCACHE" *)
  input  wire [3:0]               S_AXI_awcache,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWPORT" *)
  input  wire [2:0]               S_AXI_awprot,
  //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREGION" *)
  //input  wire [3:0]               S_AXI_awregion,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWQOS" *)
  input  wire [3:0]               S_AXI_awqos,
  //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWUSER" *)
  //input  wire [AUSER_WIDTH-1:0]   S_AXI_awuser,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *)
  input  wire                     S_AXI_awvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *)
  output wire                     S_AXI_awready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WID" *)
  input  wire [ID_WIDTH-1:0]      S_AXI_wid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *)
  input  wire [DATA_WIDTH-1:0]    S_AXI_wdata,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *)
  input  wire [DATA_WIDTH/8-1:0]  S_AXI_wstrb,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WLAST" *)
  input  wire                     S_AXI_wlast,
  //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WUSER" *)
  //input  wire [(DUSER_WIDTH == 0 ? 1 : DUSER_WIDTH)-1:0] S_AXI_wuser,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *)
  input  wire                     S_AXI_wvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *)
  output wire                     S_AXI_wready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BID" *)
  output wire [ID_WIDTH-1:0]      S_AXI_bid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *)
  output wire [1:0]               S_AXI_bresp,
  //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BUSER" *)
  //output wire [16-1:0]            S_AXI_buser,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *)
  output wire                     S_AXI_bvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *)
  input  wire                     S_AXI_bready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARID" *)
  input  wire [ID_WIDTH-1:0]      S_AXI_arid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *)
  input  wire [ADDR_WIDTH-1:0]    S_AXI_araddr,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARLEN" *)
  input  wire [3:0]               S_AXI_arlen,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARSIZE" *)
  input  wire [2:0]               S_AXI_arsize,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARBURST" *)
  input  wire [1:0]               S_AXI_arburst,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARLOCK" *)
  input  wire [0:0]               S_AXI_arlock,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARCACHE" *)
  input  wire [3:0]               S_AXI_arcache,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARPROT" *)
  input  wire [2:0]               S_AXI_arprot,
  //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREGION" *)
  //input  wire [3:0]               S_AXI_arregion,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARQOS" *)
  input  wire [3:0]               S_AXI_arqos,
  //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARUSER" *)
  //input  wire [AUSER_WIDTH-1:0]   S_AXI_aruser,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *)
  input  wire                     S_AXI_arvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *)
  output wire                     S_AXI_arready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RID" *)
  output wire [ID_WIDTH-1:0]      S_AXI_rid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *)
  output wire [DATA_WIDTH-1:0]    S_AXI_rdata,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *)
  output wire [1:0]               S_AXI_rresp,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RLAST" *)
  output wire                     S_AXI_rlast,
  //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RUSER" *)
  //output wire [(DUSER_WIDTH == 0 ? 1 : DUSER_WIDTH)-1:0]   S_AXI_ruser,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *)
  output wire                     S_AXI_rvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *)
  input  wire                     S_AXI_rready
);

//------------------------------------------------------------------------------
// Constants
//------------------------------------------------------------------------------
localparam XPM_NAME = "XPM_PMC_BRIDGE";
localparam integer XPM_MODULE_ID = 2;
//------------------------------------------------------------------------------
// Configuration DRCs
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Local Wire Declaration
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Mapping Interrupt signal
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Mapping Parity and Poison signals over USER signals
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Instantiating NMU Unisim
//------------------------------------------------------------------------------

(* DONT_TOUCH = "TRUE", KEEP = "TRUE" *)
    AXI32 PMCBRIDGE_INST (
      .WVALID      (S_AXI_wvalid),
      .WREADY      (S_AXI_wready),
      .WLAST       (S_AXI_wlast),
      .WDATA       (S_AXI_wdata),
      .WSTRB       (S_AXI_wstrb),
      .ARREADY     (S_AXI_arready),
      .AWREADY     (S_AXI_awready),
      .BID         (S_AXI_bid),
      .BRESP       (S_AXI_bresp),
      //.BUSER       (S_AXI_buser),
      .BVALID      (S_AXI_bvalid),
      .RDATA       (S_AXI_rdata),
      .RID         (S_AXI_rid),
      .RLAST       (S_AXI_rlast),
      .RRESP       (S_AXI_rresp),
      .RVALID      (S_AXI_rvalid),
      .ARADDR      (S_AXI_araddr),
      .ARBURST     (S_AXI_arburst),
      .ARCACHE     (S_AXI_arcache),
      .ARLEN       (S_AXI_arlen),
      .ARLOCK      (S_AXI_arlock),
      .ARPROT      (S_AXI_arprot),
      .ARQOS       (S_AXI_arqos),
      //.ARREGION    (S_AXI_arregion),
      .ARSIZE      (S_AXI_arsize),
      .ARVALID     (S_AXI_arvalid),
      .AWADDR      (S_AXI_awaddr),
      .AWBURST     (S_AXI_awburst),
      .AWCACHE     (S_AXI_awcache),
      .AWLEN       (S_AXI_awlen),
      .AWLOCK      (S_AXI_awlock),
      .AWPROT      (S_AXI_awprot),
      .AWQOS       (S_AXI_awqos),
      .AWSIZE      (S_AXI_awsize),
      .AWVALID     (S_AXI_awvalid),
      .BREADY      (S_AXI_bready),
      .RREADY      (S_AXI_rready),
      .WID         ('d0),
      .AWID        ('d0),
      .ARID        ('d0),
      .AXICLK      (S_AXI_clk)
  
      );
//end
//endgenerate

endmodule



