`include "B_XP5IO_VREF_defines.vh"

reg [`XP5IO_VREF_DATA_SZ-1:0] ATTR [0:`XP5IO_VREF_ADDR_N-1];
reg [`XP5IO_VREF__ISTANDARD_SZ:1] ISTANDARD_REG = ISTANDARD;
reg [`XP5IO_VREF__VOH_SZ-1:0] VOH_REG = VOH;
reg [`XP5IO_VREF__VREF_NIB_SZ:1] VREF_NIB_REG = VREF_NIB;

initial begin
  ATTR[`XP5IO_VREF__ISTANDARD] = ISTANDARD;
  ATTR[`XP5IO_VREF__VOH] = VOH;
  ATTR[`XP5IO_VREF__VREF_NIB] = VREF_NIB;
end

always @(trig_attr) begin
  ISTANDARD_REG = ATTR[`XP5IO_VREF__ISTANDARD];
  VOH_REG = ATTR[`XP5IO_VREF__VOH];
  VREF_NIB_REG = ATTR[`XP5IO_VREF__VREF_NIB];
end

// procedures to override, read attribute values

task write_attr;
  input  [`XP5IO_VREF_ADDR_SZ-1:0] addr;
  input  [`XP5IO_VREF_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`XP5IO_VREF_DATA_SZ-1:0] read_attr;
  input  [`XP5IO_VREF_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
