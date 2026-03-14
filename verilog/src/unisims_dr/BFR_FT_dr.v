`include "B_BFR_FT_defines.vh"

reg [`BFR_FT_DATA_SZ-1:0] ATTR [0:`BFR_FT_ADDR_N-1];
real ACTIVE_DUTYCYCLE_REG = ACTIVE_DUTYCYCLE;
reg [`BFR_FT__FT_MODE_SZ:1] FT_MODE_REG = FT_MODE;
reg [`BFR_FT__MAX_POINT_SIZE_SZ:1] MAX_POINT_SIZE_REG = MAX_POINT_SIZE;
reg REORDER_EN_REG = REORDER_EN;
reg SCALING_EN_REG = SCALING_EN;
reg [`BFR_FT__SPARE_SZ-1:0] SPARE_REG = SPARE;
real TOGGLE_RATE_REG = TOGGLE_RATE;
reg [`BFR_FT__XPA_CFG0_SZ-1:0] XPA_CFG0_REG = XPA_CFG0;

initial begin
  ATTR[`BFR_FT__ACTIVE_DUTYCYCLE] = $realtobits(ACTIVE_DUTYCYCLE);
  ATTR[`BFR_FT__FT_MODE] = FT_MODE;
  ATTR[`BFR_FT__MAX_POINT_SIZE] = MAX_POINT_SIZE;
  ATTR[`BFR_FT__REORDER_EN] = REORDER_EN;
  ATTR[`BFR_FT__SCALING_EN] = SCALING_EN;
  ATTR[`BFR_FT__SPARE] = SPARE;
  ATTR[`BFR_FT__TOGGLE_RATE] = $realtobits(TOGGLE_RATE);
  ATTR[`BFR_FT__XPA_CFG0] = XPA_CFG0;
end

always @(trig_attr) begin
  ACTIVE_DUTYCYCLE_REG = $bitstoreal(ATTR[`BFR_FT__ACTIVE_DUTYCYCLE]);
  FT_MODE_REG = ATTR[`BFR_FT__FT_MODE];
  MAX_POINT_SIZE_REG = ATTR[`BFR_FT__MAX_POINT_SIZE];
  REORDER_EN_REG = ATTR[`BFR_FT__REORDER_EN];
  SCALING_EN_REG = ATTR[`BFR_FT__SCALING_EN];
  SPARE_REG = ATTR[`BFR_FT__SPARE];
  TOGGLE_RATE_REG = $bitstoreal(ATTR[`BFR_FT__TOGGLE_RATE]);
  XPA_CFG0_REG = ATTR[`BFR_FT__XPA_CFG0];
end

// procedures to override, read attribute values

task write_attr;
  input  [`BFR_FT_ADDR_SZ-1:0] addr;
  input  [`BFR_FT_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`BFR_FT_DATA_SZ-1:0] read_attr;
  input  [`BFR_FT_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
