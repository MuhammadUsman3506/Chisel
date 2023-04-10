module MyModule(
  input         clock,
  input         reset,
  input         io_in1,
  output [31:0] io_out1,
  output [31:0] io_out2,
  output [31:0] io_out3
);
  wire  _T_2 = io_in1 ^ 1'h1; // @[chisel_data_types.scala 26:21]
  assign io_out1 = 32'h17; // @[chisel_data_types.scala 24:17]
  assign io_out2 = 32'h17; // @[chisel_data_types.scala 25:17]
  assign io_out3 = {{31'd0}, _T_2}; // @[chisel_data_types.scala 26:21]
endmodule
