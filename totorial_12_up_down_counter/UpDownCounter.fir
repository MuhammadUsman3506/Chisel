;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit UpDownCounter : 
  module UpDownCounter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip up : UInt<1>, flip down : UInt<1>, out : UInt<4>}
    
    reg count : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[up_down_counter.scala 18:22]
    node _T = eq(io.down, UInt<1>("h00")) @[up_down_counter.scala 20:17]
    node _T_1 = and(io.up, _T) @[up_down_counter.scala 20:14]
    node _T_2 = neq(count, UInt<4>("h09")) @[up_down_counter.scala 20:35]
    node _T_3 = and(_T_1, _T_2) @[up_down_counter.scala 20:26]
    when _T_3 : @[up_down_counter.scala 20:53]
      node _T_4 = add(count, UInt<1>("h01")) @[up_down_counter.scala 21:20]
      node _T_5 = tail(_T_4, 1) @[up_down_counter.scala 21:20]
      count <= _T_5 @[up_down_counter.scala 21:11]
      skip @[up_down_counter.scala 20:53]
    else : @[up_down_counter.scala 22:50]
      node _T_6 = eq(io.up, UInt<1>("h00")) @[up_down_counter.scala 22:14]
      node _T_7 = and(_T_6, io.down) @[up_down_counter.scala 22:21]
      node _T_8 = neq(count, UInt<1>("h00")) @[up_down_counter.scala 22:41]
      node _T_9 = and(_T_7, _T_8) @[up_down_counter.scala 22:32]
      when _T_9 : @[up_down_counter.scala 22:50]
        node _T_10 = sub(count, UInt<1>("h01")) @[up_down_counter.scala 23:20]
        node _T_11 = tail(_T_10, 1) @[up_down_counter.scala 23:20]
        count <= _T_11 @[up_down_counter.scala 23:11]
        skip @[up_down_counter.scala 22:50]
    io.out <= count @[up_down_counter.scala 26:10]
    
