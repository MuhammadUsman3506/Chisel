;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit MyTopLevelModule : 
  module UpCounter : 
    input clock : Clock
    input reset : Reset
    output io : {flip enable : UInt<1>, flip maxCount : UInt<32>, count : UInt<32>, clear : UInt<1>}
    
    reg countReg : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[a.scala 16:25]
    reg clearReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[a.scala 17:25]
    node _T = neq(countReg, io.maxCount) @[a.scala 19:31]
    node _T_1 = and(io.enable, _T) @[a.scala 19:19]
    when _T_1 : @[a.scala 19:48]
      node _T_2 = add(countReg, UInt<1>("h01")) @[a.scala 20:26]
      node _T_3 = tail(_T_2, 1) @[a.scala 20:26]
      countReg <= _T_3 @[a.scala 20:14]
      skip @[a.scala 19:48]
    node _T_4 = eq(countReg, io.maxCount) @[a.scala 23:18]
    when _T_4 : @[a.scala 23:35]
      clearReg <= UInt<1>("h01") @[a.scala 24:14]
      skip @[a.scala 23:35]
    io.count <= countReg @[a.scala 27:12]
    io.clear <= clearReg @[a.scala 28:12]
    when io.clear : @[a.scala 30:19]
      countReg <= UInt<1>("h00") @[a.scala 31:14]
      clearReg <= UInt<1>("h00") @[a.scala 32:14]
      skip @[a.scala 30:19]
    
  module MyTopLevelModule : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip enable : UInt<1>, flip countMax : UInt<32>, count : UInt<32>, clear : UInt<1>}
    
    inst counterInstance of UpCounter @[b.scala 15:31]
    counterInstance.clock <= clock
    counterInstance.reset <= reset
    counterInstance.io.enable <= io.enable @[b.scala 17:29]
    counterInstance.io.maxCount <= io.countMax @[b.scala 18:31]
    io.count <= counterInstance.io.count @[b.scala 19:12]
    io.clear <= counterInstance.io.clear @[b.scala 20:12]
    
