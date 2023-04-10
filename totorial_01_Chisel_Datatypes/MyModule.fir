;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit MyModule : 
  module MyModule : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in1 : UInt<1>, out1 : UInt<32>, out2 : UInt<32>, out3 : UInt<32>}
    
    node x2 = asSInt(UInt<5>("h017")) @[chisel_data_types.scala 20:19]
    wire x3 : UInt<1>
    x3 <= UInt<1>("h01")
    node _T = asUInt(asSInt(UInt<32>("h017"))) @[chisel_data_types.scala 24:17]
    io.out1 <= _T @[chisel_data_types.scala 24:11]
    node _T_1 = asUInt(x2) @[chisel_data_types.scala 25:17]
    io.out2 <= _T_1 @[chisel_data_types.scala 25:11]
    node _T_2 = xor(io.in1, x3) @[chisel_data_types.scala 26:21]
    io.out3 <= _T_2 @[chisel_data_types.scala 26:11]
    
