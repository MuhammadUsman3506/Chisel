;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit MuxCase_ex : 
  module MuxCase_ex : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in0 : UInt<1>, flip in1 : UInt<1>, flip in2 : UInt<1>, flip in3 : UInt<1>, flip in4 : UInt<1>, flip in5 : UInt<1>, flip in6 : UInt<1>, flip in7 : UInt<1>, flip sel : UInt<3>, out : UInt<1>}
    
    node _T = eq(io.sel, UInt<1>("h00")) @[muxcase.scala 23:16]
    node _T_1 = eq(io.sel, UInt<1>("h01")) @[muxcase.scala 24:16]
    node _T_2 = eq(io.sel, UInt<2>("h02")) @[muxcase.scala 25:16]
    node _T_3 = eq(io.sel, UInt<2>("h03")) @[muxcase.scala 26:16]
    node _T_4 = eq(io.sel, UInt<3>("h04")) @[muxcase.scala 27:16]
    node _T_5 = eq(io.sel, UInt<3>("h05")) @[muxcase.scala 28:16]
    node _T_6 = eq(io.sel, UInt<3>("h06")) @[muxcase.scala 29:16]
    node _T_7 = eq(io.sel, UInt<3>("h07")) @[muxcase.scala 30:16]
    node _T_8 = mux(_T_7, io.in7, UInt<1>("h00")) @[Mux.scala 98:16]
    node _T_9 = mux(_T_6, io.in6, _T_8) @[Mux.scala 98:16]
    node _T_10 = mux(_T_5, io.in5, _T_9) @[Mux.scala 98:16]
    node _T_11 = mux(_T_4, io.in4, _T_10) @[Mux.scala 98:16]
    node _T_12 = mux(_T_3, io.in3, _T_11) @[Mux.scala 98:16]
    node _T_13 = mux(_T_2, io.in2, _T_12) @[Mux.scala 98:16]
    node _T_14 = mux(_T_1, io.in1, _T_13) @[Mux.scala 98:16]
    node _T_15 = mux(_T, io.in0, _T_14) @[Mux.scala 98:16]
    io.out <= _T_15 @[muxcase.scala 22:12]
    
