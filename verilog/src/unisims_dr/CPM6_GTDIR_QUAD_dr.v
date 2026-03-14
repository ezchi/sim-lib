`include "B_CPM6_GTDIR_QUAD_defines.vh"

reg [`CPM6_GTDIR_QUAD_DATA_SZ-1:0] ATTR [0:`CPM6_GTDIR_QUAD_ADDR_N-1];
reg [`CPM6_GTDIR_QUAD__BOT_CHIPPIPE_MODE_SZ:1] BOT_CHIPPIPE_MODE_REG = BOT_CHIPPIPE_MODE;
reg [`CPM6_GTDIR_QUAD__BOT_PL_MUX_MODE_SZ:1] BOT_PL_MUX_MODE_REG = BOT_PL_MUX_MODE;

initial begin
  ATTR[`CPM6_GTDIR_QUAD__BOT_CHIPPIPE_MODE] = BOT_CHIPPIPE_MODE;
  ATTR[`CPM6_GTDIR_QUAD__BOT_PL_MUX_MODE] = BOT_PL_MUX_MODE;
end

always @(trig_attr) begin
  BOT_CHIPPIPE_MODE_REG = ATTR[`CPM6_GTDIR_QUAD__BOT_CHIPPIPE_MODE];
  BOT_PL_MUX_MODE_REG = ATTR[`CPM6_GTDIR_QUAD__BOT_PL_MUX_MODE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`CPM6_GTDIR_QUAD_ADDR_SZ-1:0] addr;
  input  [`CPM6_GTDIR_QUAD_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`CPM6_GTDIR_QUAD_DATA_SZ-1:0] read_attr;
  input  [`CPM6_GTDIR_QUAD_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
