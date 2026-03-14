// PROTOTYPE System Configuration access point module
// AXI4-Lite
// PL manager to hard block subordinate

(*black_box*)
module AP_AXI4LITE_PL_HB #(
	parameter HARD_BLOCK = "",
	parameter INTERFACE  = ""
) (
	input  wire [31:0] ARADDR,
	input  wire  [2:0] ARPROT,
	output wire        ARREADY,
	input  wire        ARVALID,
	input  wire [31:0] AWADDR,
	input  wire  [2:0] AWPROT,
	output wire        AWREADY,
	input  wire        AWVALID,
	input  wire        BREADY,
	output wire  [1:0] BRESP,
	output wire        BVALID,
	output wire [31:0] RDATA,
	input  wire        RREADY,
	output wire  [1:0] RRESP,
	output wire        RVALID,
	input  wire [31:0] WDATA,
	output wire        WREADY,
	input  wire  [3:0] WSTRB,
	input  wire        WVALID
);
endmodule