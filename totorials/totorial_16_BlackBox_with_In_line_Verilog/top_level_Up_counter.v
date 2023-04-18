module top_level_Up_counter(
  input         clock,
  input         reset,
  input         io_clk,
  input         io_reset,
  input         io_en,
  input  [31:0] io_count_max,
  output        io_clr_sec,
  output [31:0] io_count_sec
);
  wire  up_counter_sec_clk; // @[top_level_Up_counter.scala 19:30]
  wire  up_counter_sec_reset; // @[top_level_Up_counter.scala 19:30]
  wire  up_counter_sec_en; // @[top_level_Up_counter.scala 19:30]
  wire [31:0] up_counter_sec_count_max; // @[top_level_Up_counter.scala 19:30]
  wire  up_counter_sec_clr; // @[top_level_Up_counter.scala 19:30]
  wire [31:0] up_counter_sec_count; // @[top_level_Up_counter.scala 19:30]
  up_counter up_counter_sec ( // @[top_level_Up_counter.scala 19:30]
    .clk(up_counter_sec_clk),
    .reset(up_counter_sec_reset),
    .en(up_counter_sec_en),
    .count_max(up_counter_sec_count_max),
    .clr(up_counter_sec_clr),
    .count(up_counter_sec_count)
  );
  assign io_clr_sec = up_counter_sec_clr; // @[top_level_Up_counter.scala 24:14]
  assign io_count_sec = up_counter_sec_count; // @[top_level_Up_counter.scala 25:16]
  assign up_counter_sec_clk = io_clk; // @[top_level_Up_counter.scala 20:25]
  assign up_counter_sec_reset = io_reset; // @[top_level_Up_counter.scala 21:27]
  assign up_counter_sec_en = io_en; // @[top_level_Up_counter.scala 22:24]
  assign up_counter_sec_count_max = io_count_max; // @[top_level_Up_counter.scala 23:31]
endmodule
