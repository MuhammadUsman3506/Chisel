;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit ShiftRegisterExample : 
  module ShiftRegisterExample : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<4>, out : UInt<4>}
    
    reg reg0 : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[shiftRegister.scala 10:21]
    reg reg1 : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[shiftRegister.scala 11:21]
    reg reg2 : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[shiftRegister.scala 12:21]
    reg reg3 : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[shiftRegister.scala 13:21]
    reg0 <= io.in @[shiftRegister.scala 15:8]
    reg1 <= reg0 @[shiftRegister.scala 16:8]
    reg2 <= reg1 @[shiftRegister.scala 17:8]
    reg3 <= reg2 @[shiftRegister.scala 18:8]
    io.out <= reg3 @[shiftRegister.scala 20:10]
    
