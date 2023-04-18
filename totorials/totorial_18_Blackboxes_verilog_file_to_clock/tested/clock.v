module clock(
  input         clock,
  input         reset,
  input         io_clock,
  input         io_reset,
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
  wire  up_counter_sec_clock; // @[up_counter_clock.scala 27:30]
  wire  up_counter_sec_reset; // @[up_counter_clock.scala 27:30]
  wire  up_counter_sec_io_en; // @[up_counter_clock.scala 27:30]
  wire [31:0] up_counter_sec_io_count_max; // @[up_counter_clock.scala 27:30]
  wire  up_counter_sec_io_clr; // @[up_counter_clock.scala 27:30]
  wire [31:0] up_counter_sec_io_count; // @[up_counter_clock.scala 27:30]
  wire  up_counter_min_clock; // @[up_counter_clock.scala 36:30]
  wire  up_counter_min_reset; // @[up_counter_clock.scala 36:30]
  wire  up_counter_min_io_en; // @[up_counter_clock.scala 36:30]
  wire [31:0] up_counter_min_io_count_max; // @[up_counter_clock.scala 36:30]
  wire  up_counter_min_io_clr; // @[up_counter_clock.scala 36:30]
  wire [31:0] up_counter_min_io_count; // @[up_counter_clock.scala 36:30]
  wire  up_counter_hrs_clock; // @[up_counter_clock.scala 45:30]
  wire  up_counter_hrs_reset; // @[up_counter_clock.scala 45:30]
  wire  up_counter_hrs_io_en; // @[up_counter_clock.scala 45:30]
  wire [31:0] up_counter_hrs_io_count_max; // @[up_counter_clock.scala 45:30]
  wire  up_counter_hrs_io_clr; // @[up_counter_clock.scala 45:30]
  wire [31:0] up_counter_hrs_io_count; // @[up_counter_clock.scala 45:30]
  up_counter up_counter_sec ( // @[up_counter_clock.scala 27:30]
    .clock(up_counter_sec_clock),
    .reset(up_counter_sec_reset),
    .io_en(up_counter_sec_io_en),
    .io_count_max(up_counter_sec_io_count_max),
    .io_clr(up_counter_sec_io_clr),
    .io_count(up_counter_sec_io_count)
  );
  up_counter up_counter_min ( // @[up_counter_clock.scala 36:30]
    .clock(up_counter_min_clock),
    .reset(up_counter_min_reset),
    .io_en(up_counter_min_io_en),
    .io_count_max(up_counter_min_io_count_max),
    .io_clr(up_counter_min_io_clr),
    .io_count(up_counter_min_io_count)
  );
  up_counter up_counter_hrs ( // @[up_counter_clock.scala 45:30]
    .clock(up_counter_hrs_clock),
    .reset(up_counter_hrs_reset),
    .io_en(up_counter_hrs_io_en),
    .io_count_max(up_counter_hrs_io_count_max),
    .io_clr(up_counter_hrs_io_clr),
    .io_count(up_counter_hrs_io_count)
  );
  assign io_clr_sec = up_counter_sec_io_clr; // @[up_counter_clock.scala 32:14]
  assign io_count_sec = up_counter_sec_io_count; // @[up_counter_clock.scala 33:16]
  assign io_clr_min = up_counter_min_io_clr; // @[up_counter_clock.scala 41:14]
  assign io_count_min = up_counter_min_io_count; // @[up_counter_clock.scala 42:16]
  assign io_clr_hrs = up_counter_hrs_io_clr; // @[up_counter_clock.scala 50:14]
  assign io_count_hrs = up_counter_hrs_io_count; // @[up_counter_clock.scala 51:16]
  assign up_counter_sec_clock = io_clock; // @[up_counter_clock.scala 28:27]
  assign up_counter_sec_reset = io_reset; // @[up_counter_clock.scala 29:27]
  assign up_counter_sec_io_en = io_en; // @[up_counter_clock.scala 30:28]
  assign up_counter_sec_io_count_max = io_count_max; // @[up_counter_clock.scala 31:34]
  assign up_counter_min_clock = io_clock; // @[up_counter_clock.scala 37:27]
  assign up_counter_min_reset = io_reset; // @[up_counter_clock.scala 38:27]
  assign up_counter_min_io_en = io_clr_sec; // @[up_counter_clock.scala 39:28]
  assign up_counter_min_io_count_max = io_count_max; // @[up_counter_clock.scala 40:34]
  assign up_counter_hrs_clock = io_clock; // @[up_counter_clock.scala 46:27]
  assign up_counter_hrs_reset = io_reset; // @[up_counter_clock.scala 47:27]
  assign up_counter_hrs_io_en = io_clr_min; // @[up_counter_clock.scala 48:28]
  assign up_counter_hrs_io_count_max = io_count_max_hrs; // @[up_counter_clock.scala 49:34]
endmodule
