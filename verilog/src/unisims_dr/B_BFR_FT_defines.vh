// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_BFR_FT_DEFINES_VH
`else
`define B_BFR_FT_DEFINES_VH

// Look-up table parameters
//

`define BFR_FT_ADDR_N  8
`define BFR_FT_ADDR_SZ 32
`define BFR_FT_DATA_SZ 88

// Attribute addresses
//

`define BFR_FT__ACTIVE_DUTYCYCLE    32'h00000000
`define BFR_FT__ACTIVE_DUTYCYCLE_SZ 64

`define BFR_FT__FT_MODE    32'h00000001
`define BFR_FT__FT_MODE_SZ 88

`define BFR_FT__MAX_POINT_SIZE    32'h00000002
`define BFR_FT__MAX_POINT_SIZE_SZ 32

`define BFR_FT__REORDER_EN    32'h00000003
`define BFR_FT__REORDER_EN_SZ 1

`define BFR_FT__SCALING_EN    32'h00000004
`define BFR_FT__SCALING_EN_SZ 1

`define BFR_FT__SPARE    32'h00000005
`define BFR_FT__SPARE_SZ 10

`define BFR_FT__TOGGLE_RATE    32'h00000006
`define BFR_FT__TOGGLE_RATE_SZ 64

`define BFR_FT__XPA_CFG0    32'h00000007
`define BFR_FT__XPA_CFG0_SZ 16

`endif  // B_BFR_FT_DEFINES_VH