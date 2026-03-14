`timescale 1ps/1ps

(* XPM_MODULE = "TRUE", KEEP_HIERARCHY = "SOFT", DONT_TOUCH = "yes" *)
module xpm_axi32 # (
  
  parameter integer DATA_WIDTH	= 32,
  parameter integer ADDR_WIDTH	= 28,
  parameter integer ID_WIDTH	= 8
) (

  (* X_INTERFACE_IGNORE = "true" *)
  input  wire                     AXI_clk,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWID" *)
  (* X_INTERFACE_MODE = "slave" *)
  input  wire [ID_WIDTH-1:0]      AXI_unisim_awid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *)
  input  wire [ADDR_WIDTH-1:0]    AXI_unisim_awaddr,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWLEN" *)
  input  wire [3:0]               AXI_unisim_awlen,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWSIZE" *)
  input  wire [2:0]               AXI_unisim_awsize,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWBURST" *)
  input  wire [1:0]               AXI_unisim_awburst,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWLOCK" *)
  input  wire [0:0]               AXI_unisim_awlock,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWCACHE" *)
  input  wire [3:0]               AXI_unisim_awcache,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWPORT" *)
  input  wire [2:0]               AXI_unisim_awprot,
  //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREGION" *)
  //input  wire [3:0]               AXI_unisim_awregion,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWQOS" *)
  input  wire [3:0]               AXI_unisim_awqos,
  //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWUSER" *)
  //input  wire [AUSER_WIDTH-1:0]   AXI_unisim_awuser,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *)
  input  wire                     AXI_unisim_awvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *)
  output wire                     AXI_unisim_awready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WID" *)
  input  wire [ID_WIDTH-1:0]      AXI_unisim_wid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *)
  input  wire [DATA_WIDTH-1:0]    AXI_unisim_wdata,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *)
  input  wire [DATA_WIDTH/8-1:0]  AXI_unisim_wstrb,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WLAST" *)
  input  wire                     AXI_unisim_wlast,
  //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WUSER" *)
  //input  wire [(DUSER_WIDTH == 0 ? 1 : DUSER_WIDTH)-1:0] AXI_unisim_wuser,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *)
  input  wire                     AXI_unisim_wvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *)
  output wire                     AXI_unisim_wready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BID" *)
  output wire [ID_WIDTH-1:0]      AXI_unisim_bid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *)
  output wire [1:0]               AXI_unisim_bresp,
  //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BUSER" *)
  //output wire [16-1:0]            AXI_unisim_buser,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *)
  output wire                     AXI_unisim_bvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *)
  input  wire                     AXI_unisim_bready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARID" *)
  input  wire [ID_WIDTH-1:0]      AXI_unisim_arid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *)
  input  wire [ADDR_WIDTH-1:0]    AXI_unisim_araddr,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARLEN" *)
  input  wire [3:0]               AXI_unisim_arlen,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARSIZE" *)
  input  wire [2:0]               AXI_unisim_arsize,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARBURST" *)
  input  wire [1:0]               AXI_unisim_arburst,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARLOCK" *)
  input  wire [0:0]               AXI_unisim_arlock,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARCACHE" *)
  input  wire [3:0]               AXI_unisim_arcache,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARPROT" *)
  input  wire [2:0]               AXI_unisim_arprot,
  //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREGION" *)
  //input  wire [3:0]               AXI_unisim_arregion,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARQOS" *)
  input  wire [3:0]               AXI_unisim_arqos,
  //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARUSER" *)
  //input  wire [AUSER_WIDTH-1:0]   AXI_unisim_aruser,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *)
  input  wire                     AXI_unisim_arvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *)
  output wire                     AXI_unisim_arready,

  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RID" *)
  output wire [ID_WIDTH-1:0]      AXI_unisim_rid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *)
  output wire [DATA_WIDTH-1:0]    AXI_unisim_rdata,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *)
  output wire [1:0]               AXI_unisim_rresp,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RLAST" *)
  output wire                     AXI_unisim_rlast,
  //(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RUSER" *)
  //output wire [(DUSER_WIDTH == 0 ? 1 : DUSER_WIDTH)-1:0]   AXI_unisim_ruser,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *)
  output wire                     AXI_unisim_rvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *)
  input  wire                     AXI_unisim_rready
);

//------------------------------------------------------------------------------
// Constants
//------------------------------------------------------------------------------
localparam XPM_NAME = "XPM_AXI32";
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
//generate
  //if (NOC_TYPE == "NOC1" ) begin : NOC1
  //if ((NOC_FABRIC == "VNOC") || (NOC_FABRIC == "pl")) begin : VNOC

//synthesis translate_off
  //defparam NOC_NMU512_INST.BM_NOC_NMU512_INST.MODULAR_NOC_FLOW = 1;
//synthesis translate_on

(* DONT_TOUCH = "TRUE", KEEP = "TRUE" *)
    AXI32 AXI32_INST (
      .WVALID      (AXI_unisim_wvalid),
      .WREADY      (AXI_unisim_wready),
      .WLAST       (AXI_unisim_wlast),
      .WDATA       (AXI_unisim_wdata),
      .WSTRB       (AXI_unisim_wstrb),
      .ARREADY     (AXI_unisim_arready),
      .AWREADY     (AXI_unisim_awready),
      .BID         (AXI_unisim_bid),
      .BRESP       (AXI_unisim_bresp),
      //.BUSER       (AXI_unisim_buser),
      .BVALID      (AXI_unisim_bvalid),
      .RDATA       (AXI_unisim_rdata),
      .RID         (AXI_unisim_rid),
      .RLAST       (AXI_unisim_rlast),
      .RRESP       (AXI_unisim_rresp),
      .RVALID      (AXI_unisim_rvalid),
      .ARADDR      (AXI_unisim_araddr),
      .ARBURST     (AXI_unisim_arburst),
      .ARCACHE     (AXI_unisim_arcache),
      .ARLEN       (AXI_unisim_arlen),
      .ARLOCK      (AXI_unisim_arlock),
      .ARPROT      (AXI_unisim_arprot),
      .ARQOS       (AXI_unisim_arqos),
      //.ARREGION    (AXI_unisim_arregion),
      .ARSIZE      (AXI_unisim_arsize),
      .ARVALID     (AXI_unisim_arvalid),
      .AWADDR      (AXI_unisim_awaddr),
      .AWBURST     (AXI_unisim_awburst),
      .AWCACHE     (AXI_unisim_awcache),
      .AWLEN       (AXI_unisim_awlen),
      .AWLOCK      (AXI_unisim_awlock),
      .AWPROT      (AXI_unisim_awprot),
      .AWQOS       (AXI_unisim_awqos),
      .AWSIZE      (AXI_unisim_awsize),
      .AWVALID     (AXI_unisim_awvalid),
      .BREADY      (AXI_unisim_bready),
      .RREADY      (AXI_unisim_rready),
      .WID         ('d0),
      .AWID        ('d0),
      .ARID        ('d0),
      .AXICLK         (AXI_clk)
  
      );
//end
//endgenerate

endmodule



