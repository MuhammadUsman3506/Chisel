module UpCounter(
  input         clock,
  input         reset,
  input         io_enable,
  input  [31:0] io_maxCount,
  output [31:0] io_count,
  output        io_clear
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] countReg; // @[a.scala 16:25]
  reg  clearReg; // @[a.scala 17:25]
  wire [31:0] _T_3 = countReg + 32'h1; // @[a.scala 20:26]
  wire  _GEN_1 = countReg == io_maxCount | clearReg; // @[a.scala 23:35 a.scala 24:14 a.scala 17:25]
  assign io_count = countReg; // @[a.scala 27:12]
  assign io_clear = clearReg; // @[a.scala 28:12]
  always @(posedge clock) begin
    if (reset) begin // @[a.scala 16:25]
      countReg <= 32'h0; // @[a.scala 16:25]
    end else if (io_clear) begin // @[a.scala 30:19]
      countReg <= 32'h0; // @[a.scala 31:14]
    end else if (io_enable & countReg != io_maxCount) begin // @[a.scala 19:48]
      countReg <= _T_3; // @[a.scala 20:14]
    end
    if (reset) begin // @[a.scala 17:25]
      clearReg <= 1'h0; // @[a.scala 17:25]
    end else if (io_clear) begin // @[a.scala 30:19]
      clearReg <= 1'h0; // @[a.scala 32:14]
    end else begin
      clearReg <= _GEN_1;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  countReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  clearReg = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MyTopLevelModule(
  input         clock,
  input         reset,
  input         io_enable,
  input  [31:0] io_countMax,
  output [31:0] io_count,
  output        io_clear
);
  wire  counterInstance_clock; // @[b.scala 15:31]
  wire  counterInstance_reset; // @[b.scala 15:31]
  wire  counterInstance_io_enable; // @[b.scala 15:31]
  wire [31:0] counterInstance_io_maxCount; // @[b.scala 15:31]
  wire [31:0] counterInstance_io_count; // @[b.scala 15:31]
  wire  counterInstance_io_clear; // @[b.scala 15:31]
  UpCounter counterInstance ( // @[b.scala 15:31]
    .clock(counterInstance_clock),
    .reset(counterInstance_reset),
    .io_enable(counterInstance_io_enable),
    .io_maxCount(counterInstance_io_maxCount),
    .io_count(counterInstance_io_count),
    .io_clear(counterInstance_io_clear)
  );
  assign io_count = counterInstance_io_count; // @[b.scala 19:12]
  assign io_clear = counterInstance_io_clear; // @[b.scala 20:12]
  assign counterInstance_clock = clock;
  assign counterInstance_reset = reset;
  assign counterInstance_io_enable = io_enable; // @[b.scala 17:29]
  assign counterInstance_io_maxCount = io_countMax; // @[b.scala 18:31]
endmodule
