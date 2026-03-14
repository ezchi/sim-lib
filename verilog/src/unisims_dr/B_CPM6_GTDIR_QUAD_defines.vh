// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_CPM6_GTDIR_QUAD_DEFINES_VH
`else
`define B_CPM6_GTDIR_QUAD_DEFINES_VH

// Look-up table parameters
//

`define CPM6_GTDIR_QUAD_ADDR_N  2
`define CPM6_GTDIR_QUAD_ADDR_SZ 32
`define CPM6_GTDIR_QUAD_DATA_SZ 48

// Attribute addresses
//

`define CPM6_GTDIR_QUAD__BOT_CHIPPIPE_MODE    32'h00000000
`define CPM6_GTDIR_QUAD__BOT_CHIPPIPE_MODE_SZ 48

`define CPM6_GTDIR_QUAD__BOT_PL_MUX_MODE    32'h00000001
`define CPM6_GTDIR_QUAD__BOT_PL_MUX_MODE_SZ 48

`endif  // B_CPM6_GTDIR_QUAD_DEFINES_VH