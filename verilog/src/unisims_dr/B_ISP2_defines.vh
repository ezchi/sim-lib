// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_ISP2_DEFINES_VH
`else
`define B_ISP2_DEFINES_VH

// Look-up table parameters
//

`define ISP2_ADDR_N  6
`define ISP2_ADDR_SZ 32
`define ISP2_DATA_SZ 32

// Attribute addresses
//

`define ISP2__ISP_CORE_0_FRAME_RATE    32'h00000000
`define ISP2__ISP_CORE_0_FRAME_RATE_SZ 32

`define ISP2__ISP_CORE_0_NO_OF_SENSORS    32'h00000001
`define ISP2__ISP_CORE_0_NO_OF_SENSORS_SZ 32

`define ISP2__ISP_CORE_0_RESOLUTION_MP    32'h00000002
`define ISP2__ISP_CORE_0_RESOLUTION_MP_SZ 32

`define ISP2__ISP_CORE_1_FRAME_RATE    32'h00000003
`define ISP2__ISP_CORE_1_FRAME_RATE_SZ 32

`define ISP2__ISP_CORE_1_NO_OF_SENSORS    32'h00000004
`define ISP2__ISP_CORE_1_NO_OF_SENSORS_SZ 32

`define ISP2__ISP_CORE_1_RESOLUTION_MP    32'h00000005
`define ISP2__ISP_CORE_1_RESOLUTION_MP_SZ 32

`endif  // B_ISP2_DEFINES_VH