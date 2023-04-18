;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit clock : 
  module up_counter : 
    input clock : Clock
    input reset : Reset
    output io : {flip en : UInt<1>, flip count_max : UInt<32>, clr : UInt<1>, count : UInt<32>}
    
    reg countReg : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[up_counter.scala 18:25]
    when io.clr : @[up_counter.scala 24:16]
      countReg <= UInt<1>("h00") @[up_counter.scala 25:14]
      skip @[up_counter.scala 24:16]
    else : @[up_counter.scala 26:21]
      when io.en : @[up_counter.scala 26:21]
        node _T = add(countReg, UInt<1>("h01")) @[up_counter.scala 27:26]
        node _T_1 = tail(_T, 1) @[up_counter.scala 27:26]
        countReg <= _T_1 @[up_counter.scala 27:14]
        skip @[up_counter.scala 26:21]
    io.count <= countReg @[up_counter.scala 30:12]
    node _T_2 = eq(io.count, io.count_max) @[up_counter.scala 31:33]
    node _T_3 = and(io.en, _T_2) @[up_counter.scala 31:20]
    io.clr <= _T_3 @[up_counter.scala 31:10]
    
  module clock : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip en : UInt<1>, flip count_max : UInt<32>, clr_sec : UInt<1>, count_sec : UInt<32>}
    
    inst up_counter_sec of up_counter @[clock.scala 19:30]
    up_counter_sec.clock <= clock
    up_counter_sec.reset <= reset
    up_counter_sec.io.en <= io.en @[clock.scala 20:25]
    up_counter_sec.io.count_max <= io.count_max @[clock.scala 21:31]
    io.clr_sec <= up_counter_sec.io.clr @[clock.scala 22:14]
    io.count_sec <= up_counter_sec.io.count @[clock.scala 23:16]
    
