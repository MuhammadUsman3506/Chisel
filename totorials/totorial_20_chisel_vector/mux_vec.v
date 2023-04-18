module mux_vec(
  input         clock,
  input         reset,
  input  [31:0] io_in_0,
  input  [31:0] io_in_1,
  input  [31:0] io_in_2,
  input  [31:0] io_in_3,
  input  [4:0]  io_sel,
  output [31:0] io_out
);
  wire [31:0] _GEN_1 = 2'h1 == io_sel[1:0] ? io_in_1 : io_in_0; // @[chisel_vector.scala 16:10 chisel_vector.scala 16:10]
  wire [31:0] _GEN_2 = 2'h2 == io_sel[1:0] ? io_in_2 : _GEN_1; // @[chisel_vector.scala 16:10 chisel_vector.scala 16:10]
  assign io_out = 2'h3 == io_sel[1:0] ? io_in_3 : _GEN_2; // @[chisel_vector.scala 16:10 chisel_vector.scala 16:10]
endmodule
