;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit register3 : 
  module register3 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<1>, flip en : UInt<1>, out : UInt<1>}
    
    reg r : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Reg.scala 27:20]
    when io.en : @[Reg.scala 28:19]
      r <= io.in @[Reg.scala 28:23]
      skip @[Reg.scala 28:19]
    io.out <= r @[r.scala 17:10]
    
