;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit mux_vec : 
  module mux_vec : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<32>[4], flip sel : UInt<5>, out : UInt<32>}
    
    node _T = bits(io.sel, 1, 0)
    io.out <= io.in[_T] @[chisel_vector.scala 16:10]
    
