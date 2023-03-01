module UpDownCounter(
  input        clock,
  input        reset,
  input        io_up,
  input        io_down,
  output [3:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] count; // @[up_down_counter.scala 18:22]
  wire [3:0] _T_5 = count + 4'h1; // @[up_down_counter.scala 21:20]
  wire [3:0] _T_11 = count - 4'h1; // @[up_down_counter.scala 23:20]
  assign io_out = count; // @[up_down_counter.scala 26:10]
  always @(posedge clock) begin
    if (reset) begin // @[up_down_counter.scala 18:22]
      count <= 4'h0; // @[up_down_counter.scala 18:22]
    end else if (io_up & ~io_down & count != 4'h9) begin // @[up_down_counter.scala 20:53]
      count <= _T_5; // @[up_down_counter.scala 21:11]
    end else if (~io_up & io_down & count != 4'h0) begin // @[up_down_counter.scala 22:50]
      count <= _T_11; // @[up_down_counter.scala 23:11]
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
  count = _RAND_0[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
