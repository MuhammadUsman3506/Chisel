;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit top_level_Up_counter : 
  extmodule up_counter : 
    input clk : UInt<1>
    input reset : UInt<1>
    input enable : UInt<1>
    input count_max : UInt<32>
    output clr : UInt<1>
    output count : UInt<32>
    
    defname = up_counter
    
    
  module top_level_Up_counter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip clk : UInt<1>, flip reset : UInt<1>, flip en : UInt<1>, flip count_max : UInt<32>, clr_sec : UInt<1>, count_sec : UInt<32>}
    
    inst up_counter_sec of up_counter @[top_level_up_counter.scala 19:30]
    up_counter_sec.count is invalid
    up_counter_sec.clr is invalid
    up_counter_sec.count_max is invalid
    up_counter_sec.enable is invalid
    up_counter_sec.reset is invalid
    up_counter_sec.clk is invalid
    up_counter_sec.clk <= io.clk @[top_level_up_counter.scala 20:25]
    up_counter_sec.reset <= io.reset @[top_level_up_counter.scala 21:27]
    up_counter_sec.enable <= io.en @[top_level_up_counter.scala 22:28]
    up_counter_sec.count_max <= io.count_max @[top_level_up_counter.scala 23:31]
    io.clr_sec <= up_counter_sec.clr @[top_level_up_counter.scala 24:14]
    io.count_sec <= up_counter_sec.count @[top_level_up_counter.scala 25:16]
    
