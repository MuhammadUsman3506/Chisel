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
  reg [31:0] countReg; // @[up_counter.scala 18:25]
  wire [31:0] _T_1 = countReg + 32'h1; // @[up_counter.scala 27:26]
  assign io_clr = io_en & io_count == io_count_max; // @[up_counter.scala 31:20]
  assign io_count = countReg; // @[up_counter.scala 30:12]
  always @(posedge clock) begin
    if (reset) begin // @[up_counter.scala 18:25]
      countReg <= 32'h0; // @[up_counter.scala 18:25]
    end else if (io_clr) begin // @[up_counter.scala 24:16]
      countReg <= 32'h0; // @[up_counter.scala 25:14]
    end else if (io_en) begin // @[up_counter.scala 26:21]
      countReg <= _T_1; // @[up_counter.scala 27:14]
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
module clock(
  input         clock,
  input         reset,
  input         io_en,
  input  [31:0] io_count_max,
  input  [31:0] io_count_max_hrs,
  output        io_clr_sec,
  output [31:0] io_count_sec,
  output        io_clr_min,
  output [31:0] io_count_min,
  output        io_clr_hrs,
  output [31:0] io_count_hrs
);
  wire  up_counter_sec_clock; // @[clock.scala 24:30]
  wire  up_counter_sec_reset; // @[clock.scala 24:30]
  wire  up_counter_sec_io_en; // @[clock.scala 24:30]
  wire [31:0] up_counter_sec_io_count_max; // @[clock.scala 24:30]
  wire  up_counter_sec_io_clr; // @[clock.scala 24:30]
  wire [31:0] up_counter_sec_io_count; // @[clock.scala 24:30]
  wire  up_counter_min_clock; // @[clock.scala 31:30]
  wire  up_counter_min_reset; // @[clock.scala 31:30]
  wire  up_counter_min_io_en; // @[clock.scala 31:30]
  wire [31:0] up_counter_min_io_count_max; // @[clock.scala 31:30]
  wire  up_counter_min_io_clr; // @[clock.scala 31:30]
  wire [31:0] up_counter_min_io_count; // @[clock.scala 31:30]
  wire  up_counter_hrs_clock; // @[clock.scala 38:30]
  wire  up_counter_hrs_reset; // @[clock.scala 38:30]
  wire  up_counter_hrs_io_en; // @[clock.scala 38:30]
  wire [31:0] up_counter_hrs_io_count_max; // @[clock.scala 38:30]
  wire  up_counter_hrs_io_clr; // @[clock.scala 38:30]
  wire [31:0] up_counter_hrs_io_count; // @[clock.scala 38:30]
  up_counter up_counter_sec ( // @[clock.scala 24:30]
    .clock(up_counter_sec_clock),
    .reset(up_counter_sec_reset),
    .io_en(up_counter_sec_io_en),
    .io_count_max(up_counter_sec_io_count_max),
    .io_clr(up_counter_sec_io_clr),
    .io_count(up_counter_sec_io_count)
  );
  up_counter up_counter_min ( // @[clock.scala 31:30]
    .clock(up_counter_min_clock),
    .reset(up_counter_min_reset),
    .io_en(up_counter_min_io_en),
    .io_count_max(up_counter_min_io_count_max),
    .io_clr(up_counter_min_io_clr),
    .io_count(up_counter_min_io_count)
  );
  up_counter up_counter_hrs ( // @[clock.scala 38:30]
    .clock(up_counter_hrs_clock),
    .reset(up_counter_hrs_reset),
    .io_en(up_counter_hrs_io_en),
    .io_count_max(up_counter_hrs_io_count_max),
    .io_clr(up_counter_hrs_io_clr),
    .io_count(up_counter_hrs_io_count)
  );
  assign io_clr_sec = up_counter_sec_io_clr; // @[clock.scala 27:14]
  assign io_count_sec = up_counter_sec_io_count; // @[clock.scala 28:16]
  assign io_clr_min = up_counter_min_io_clr; // @[clock.scala 34:14]
  assign io_count_min = up_counter_min_io_count; // @[clock.scala 35:16]
  assign io_clr_hrs = up_counter_hrs_io_clr; // @[clock.scala 41:14]
  assign io_count_hrs = up_counter_hrs_io_count; // @[clock.scala 42:16]
  assign up_counter_sec_clock = clock;
  assign up_counter_sec_reset = reset;
  assign up_counter_sec_io_en = io_en; // @[clock.scala 25:25]
  assign up_counter_sec_io_count_max = io_count_max; // @[clock.scala 26:31]
  assign up_counter_min_clock = clock;
  assign up_counter_min_reset = reset;
  assign up_counter_min_io_en = io_clr_sec; // @[clock.scala 32:25]
  assign up_counter_min_io_count_max = io_count_max; // @[clock.scala 33:31]
  assign up_counter_hrs_clock = clock;
  assign up_counter_hrs_reset = reset;
  assign up_counter_hrs_io_en = io_clr_min; // @[clock.scala 39:25]
  assign up_counter_hrs_io_count_max = io_count_max_hrs; // @[clock.scala 40:31]
endmodule
