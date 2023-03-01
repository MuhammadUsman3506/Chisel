;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit register : 
  module register : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<1>, flip an : UInt<1>, out : UInt<1>}
    
    reg reg2 : UInt<1>, clock @[register.scala 15:18]
    reg2 <= io.in @[register.scala 16:8]
    io.out <= reg2 @[register.scala 17:10]
    
