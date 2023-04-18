module clock(
  input         clock,
  input         reset,
  input         io_clock,
  input         io_reset,
  output [31:0] io_count_sec,
  output [31:0] io_count_min,
  output [31:0] io_count_hrs
);
  wire  up_counter_sec_clock; // @[up_counter_clock.scala 50:30]
  wire  up_counter_sec_reset; // @[up_counter_clock.scala 50:30]
  wire  up_counter_sec_io_en; // @[up_counter_clock.scala 50:30]
  wire [31:0] up_counter_sec_io_count_max; // @[up_counter_clock.scala 50:30]
  wire  up_counter_sec_io_clr; // @[up_counter_clock.scala 50:30]
  wire [31:0] up_counter_sec_io_count; // @[up_counter_clock.scala 50:30]
  wire  up_counter_min_clock; // @[up_counter_clock.scala 59:30]
  wire  up_counter_min_reset; // @[up_counter_clock.scala 59:30]
  wire  up_counter_min_io_en; // @[up_counter_clock.scala 59:30]
  wire [31:0] up_counter_min_io_count_max; // @[up_counter_clock.scala 59:30]
  wire  up_counter_min_io_clr; // @[up_counter_clock.scala 59:30]
  wire [31:0] up_counter_min_io_count; // @[up_counter_clock.scala 59:30]
  wire  up_counter_hrs_clock; // @[up_counter_clock.scala 68:30]
  wire  up_counter_hrs_reset; // @[up_counter_clock.scala 68:30]
  wire  up_counter_hrs_io_en; // @[up_counter_clock.scala 68:30]
  wire [31:0] up_counter_hrs_io_count_max; // @[up_counter_clock.scala 68:30]
  wire  up_counter_hrs_io_clr; // @[up_counter_clock.scala 68:30]
  wire [31:0] up_counter_hrs_io_count; // @[up_counter_clock.scala 68:30]
  up_counter up_counter_sec ( // @[up_counter_clock.scala 50:30]
    .clock(up_counter_sec_clock),
    .reset(up_counter_sec_reset),
    .io_en(up_counter_sec_io_en),
    .io_count_max(up_counter_sec_io_count_max),
    .io_clr(up_counter_sec_io_clr),
    .io_count(up_counter_sec_io_count)
  );
  up_counter up_counter_min ( // @[up_counter_clock.scala 59:30]
    .clock(up_counter_min_clock),
    .reset(up_counter_min_reset),
    .io_en(up_counter_min_io_en),
    .io_count_max(up_counter_min_io_count_max),
    .io_clr(up_counter_min_io_clr),
    .io_count(up_counter_min_io_count)
  );
  up_counter up_counter_hrs ( // @[up_counter_clock.scala 68:30]
    .clock(up_counter_hrs_clock),
    .reset(up_counter_hrs_reset),
    .io_en(up_counter_hrs_io_en),
    .io_count_max(up_counter_hrs_io_count_max),
    .io_clr(up_counter_hrs_io_clr),
    .io_count(up_counter_hrs_io_count)
  );
  assign io_count_sec = up_counter_sec_io_count; // @[up_counter_clock.scala 56:16]
  assign io_count_min = up_counter_min_io_count; // @[up_counter_clock.scala 65:16]
  assign io_count_hrs = up_counter_hrs_io_count; // @[up_counter_clock.scala 74:16]
  assign up_counter_sec_clock = io_clock; // @[up_counter_clock.scala 51:27]
  assign up_counter_sec_reset = io_reset; // @[up_counter_clock.scala 52:27]
  assign up_counter_sec_io_en = 1'h1; // @[up_counter_clock.scala 27:16 up_counter_clock.scala 39:6]
  assign up_counter_sec_io_count_max = 32'h3b; // @[up_counter_clock.scala 29:27 up_counter_clock.scala 40:17]
  assign up_counter_min_clock = io_clock; // @[up_counter_clock.scala 60:27]
  assign up_counter_min_reset = io_reset; // @[up_counter_clock.scala 61:27]
  assign up_counter_min_io_en = up_counter_sec_io_clr; // @[up_counter_clock.scala 32:21 up_counter_clock.scala 55:11]
  assign up_counter_min_io_count_max = 32'h3b; // @[up_counter_clock.scala 30:27 up_counter_clock.scala 41:17]
  assign up_counter_hrs_clock = io_clock; // @[up_counter_clock.scala 69:27]
  assign up_counter_hrs_reset = io_reset; // @[up_counter_clock.scala 70:27]
  assign up_counter_hrs_io_en = up_counter_min_io_clr; // @[up_counter_clock.scala 33:21 up_counter_clock.scala 64:11]
  assign up_counter_hrs_io_count_max = 32'h17; // @[up_counter_clock.scala 31:27 up_counter_clock.scala 42:17]
endmodule
