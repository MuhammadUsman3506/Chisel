circuit UpDownCounter :
  module UpDownCounter :
    input clock : Clock
    input reset : UInt<1>
    input io_up : UInt<1>
    input io_down : UInt<1>
    output io_out : UInt<4>

    reg count : UInt<4>, clock with :
      reset => (UInt<1>("h0"), count) @[up_down_counter.scala 18:22]
    node _T = eq(io_down, UInt<1>("h0")) @[up_down_counter.scala 20:17]
    node _T_1 = and(io_up, _T) @[up_down_counter.scala 20:14]
    node _T_2 = neq(count, UInt<4>("h9")) @[up_down_counter.scala 20:35]
    node _T_3 = and(_T_1, _T_2) @[up_down_counter.scala 20:26]
    node _T_4 = add(count, UInt<1>("h1")) @[up_down_counter.scala 21:20]
    node _T_5 = tail(_T_4, 1) @[up_down_counter.scala 21:20]
    node _T_6 = eq(io_up, UInt<1>("h0")) @[up_down_counter.scala 22:14]
    node _T_7 = and(_T_6, io_down) @[up_down_counter.scala 22:21]
    node _T_8 = neq(count, UInt<1>("h0")) @[up_down_counter.scala 22:41]
    node _T_9 = and(_T_7, _T_8) @[up_down_counter.scala 22:32]
    node _T_10 = sub(count, UInt<1>("h1")) @[up_down_counter.scala 23:20]
    node _T_11 = tail(_T_10, 1) @[up_down_counter.scala 23:20]
    node _GEN_0 = mux(_T_9, _T_11, count) @[up_down_counter.scala 22:50 up_down_counter.scala 23:11 up_down_counter.scala 18:22]
    node _GEN_1 = mux(_T_3, _T_5, _GEN_0) @[up_down_counter.scala 20:53 up_down_counter.scala 21:11]
    io_out <= count @[up_down_counter.scala 26:10]
    count <= mux(reset, UInt<4>("h0"), _GEN_1) @[up_down_counter.scala 18:22 up_down_counter.scala 18:22]
