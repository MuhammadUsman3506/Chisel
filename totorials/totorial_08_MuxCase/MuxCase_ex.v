module MuxCase_ex(
  input        clock,
  input        reset,
  input        io_in0,
  input        io_in1,
  input        io_in2,
  input        io_in3,
  input        io_in4,
  input        io_in5,
  input        io_in6,
  input        io_in7,
  input  [2:0] io_sel,
  output       io_out
);
  wire  _T = io_sel == 3'h0; // @[muxcase.scala 23:16]
  wire  _T_1 = io_sel == 3'h1; // @[muxcase.scala 24:16]
  wire  _T_2 = io_sel == 3'h2; // @[muxcase.scala 25:16]
  wire  _T_3 = io_sel == 3'h3; // @[muxcase.scala 26:16]
  wire  _T_4 = io_sel == 3'h4; // @[muxcase.scala 27:16]
  wire  _T_5 = io_sel == 3'h5; // @[muxcase.scala 28:16]
  wire  _T_6 = io_sel == 3'h6; // @[muxcase.scala 29:16]
  wire  _T_7 = io_sel == 3'h7; // @[muxcase.scala 30:16]
  wire  _T_9 = _T_6 ? io_in6 : _T_7 & io_in7; // @[Mux.scala 98:16]
  wire  _T_10 = _T_5 ? io_in5 : _T_9; // @[Mux.scala 98:16]
  wire  _T_11 = _T_4 ? io_in4 : _T_10; // @[Mux.scala 98:16]
  wire  _T_12 = _T_3 ? io_in3 : _T_11; // @[Mux.scala 98:16]
  wire  _T_13 = _T_2 ? io_in2 : _T_12; // @[Mux.scala 98:16]
  wire  _T_14 = _T_1 ? io_in1 : _T_13; // @[Mux.scala 98:16]
  assign io_out = _T ? io_in0 : _T_14; // @[Mux.scala 98:16]
endmodule
