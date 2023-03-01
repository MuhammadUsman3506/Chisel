;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit register2 : 
  module register2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<1>, flip en : UInt<1>, out : UInt<1>}
    
    reg REG : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[register2.scala 15:20]
    REG <= io.in @[register2.scala 15:20]
    io.out <= REG @[register2.scala 15:10]
    
