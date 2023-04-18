module up_counter(
  input         clock,
  input         reset,
  input         io_en,
  input  [31:0] io_count_max,
  output        io_clr,
  output [31:0] io_count
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] countReg; // @[up_counter.scala 16:25]
  wire [31:0] _T_1 = countReg + 32'h1; // @[up_counter.scala 25:26]
  assign io_clr = io_en & io_count == io_count_max; // @[up_counter.scala 29:20]
  assign io_count = countReg; // @[up_counter.scala 28:12]
  always @(posedge clock) begin
    if (reset) begin // @[up_counter.scala 16:25]
      countReg <= 32'h0; // @[up_counter.scala 16:25]
    end else if (io_clr) begin // @[up_counter.scala 22:16]
      countReg <= 32'h0; // @[up_counter.scala 23:14]
    end else if (io_en) begin // @[up_counter.scala 24:21]
      countReg <= _T_1; // @[up_counter.scala 25:14]
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
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
