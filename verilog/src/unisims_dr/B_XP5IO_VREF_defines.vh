// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_XP5IO_VREF_DEFINES_VH
`else
`define B_XP5IO_VREF_DEFINES_VH

// Look-up table parameters
//

`define XP5IO_VREF_ADDR_N  3
`define XP5IO_VREF_ADDR_SZ 32
`define XP5IO_VREF_DATA_SZ 88

// Attribute addresses
//

`define XP5IO_VREF__ISTANDARD    32'h00000000
`define XP5IO_VREF__ISTANDARD_SZ 48

`define XP5IO_VREF__VOH    32'h00000001
`define XP5IO_VREF__VOH_SZ 32

`define XP5IO_VREF__VREF_NIB    32'h00000002
`define XP5IO_VREF__VREF_NIB_SZ 88

`endif  // B_XP5IO_VREF_DEFINES_VH