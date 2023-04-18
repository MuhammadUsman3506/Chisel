;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit up_counter : 
  module up_counter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip en : UInt<1>, flip count_max : UInt<32>, clr : UInt<1>, count : UInt<32>}
    
    reg countReg : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[up_counter.scala 16:25]
    when io.clr : @[up_counter.scala 22:16]
      countReg <= UInt<1>("h00") @[up_counter.scala 23:14]
      skip @[up_counter.scala 22:16]
    else : @[up_counter.scala 24:21]
      when io.en : @[up_counter.scala 24:21]
        node _T = add(countReg, UInt<1>("h01")) @[up_counter.scala 25:26]
        node _T_1 = tail(_T, 1) @[up_counter.scala 25:26]
        countReg <= _T_1 @[up_counter.scala 25:14]
        skip @[up_counter.scala 24:21]
    io.count <= countReg @[up_counter.scala 28:12]
    node _T_2 = eq(io.count, io.count_max) @[up_counter.scala 29:33]
    node _T_3 = and(io.en, _T_2) @[up_counter.scala 29:20]
    io.clr <= _T_3 @[up_counter.scala 29:10]
    
