;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Register_file : 
  module Register_file : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip raddr1 : UInt<5>, flip raddr2 : UInt<5>, flip waddr : UInt<5>, flip wen : UInt<1>, flip wdata : UInt<32>, rdata1 : UInt<32>, rdata2 : UInt<32>}
    
    cmem mem : UInt<32>[32] @[Register_file.scala 20:16]
    when io.wen : @[Register_file.scala 22:16]
      infer mport MPORT = mem[io.waddr], clock @[Register_file.scala 23:8]
      MPORT <= io.wdata @[Register_file.scala 23:19]
      skip @[Register_file.scala 22:16]
    infer mport MPORT_1 = mem[io.raddr1], clock @[Register_file.scala 26:19]
    io.rdata1 <= MPORT_1 @[Register_file.scala 26:13]
    infer mport MPORT_2 = mem[io.raddr2], clock @[Register_file.scala 27:19]
    io.rdata2 <= MPORT_2 @[Register_file.scala 27:13]
    
