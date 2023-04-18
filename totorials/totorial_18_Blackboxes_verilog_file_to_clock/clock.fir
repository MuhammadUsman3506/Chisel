;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit clock : 
  extmodule up_counter : 
    input clock : UInt<1>
    input reset : UInt<1>
    input io_en : UInt<1>
    input io_count_max : UInt<32>
    output io_clr : UInt<1>
    output io_count : UInt<32>
    
    defname = up_counter
    
    
  extmodule up_counter_1 : 
    input clock : UInt<1>
    input reset : UInt<1>
    input io_en : UInt<1>
    input io_count_max : UInt<32>
    output io_clr : UInt<1>
    output io_count : UInt<32>
    
    defname = up_counter
    
    
  extmodule up_counter_2 : 
    input clock : UInt<1>
    input reset : UInt<1>
    input io_en : UInt<1>
    input io_count_max : UInt<32>
    output io_clr : UInt<1>
    output io_count : UInt<32>
    
    defname = up_counter
    
    
  module clock : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip clock : UInt<1>, flip reset : UInt<1>, flip en : UInt<1>, flip count_max : UInt<32>, flip count_max_hrs : UInt<32>, clr_sec : UInt<1>, count_sec : UInt<32>, clr_min : UInt<1>, count_min : UInt<32>, clr_hrs : UInt<1>, count_hrs : UInt<32>}
    
    inst up_counter_sec of up_counter @[up_counter_clock.scala 27:30]
    up_counter_sec.io_count is invalid
    up_counter_sec.io_clr is invalid
    up_counter_sec.io_count_max is invalid
    up_counter_sec.io_en is invalid
    up_counter_sec.reset is invalid
    up_counter_sec.clock is invalid
    up_counter_sec.clock <= io.clock @[up_counter_clock.scala 28:27]
    up_counter_sec.reset <= io.reset @[up_counter_clock.scala 29:27]
    up_counter_sec.io_en <= io.en @[up_counter_clock.scala 30:28]
    up_counter_sec.io_count_max <= io.count_max @[up_counter_clock.scala 31:34]
    io.clr_sec <= up_counter_sec.io_clr @[up_counter_clock.scala 32:14]
    io.count_sec <= up_counter_sec.io_count @[up_counter_clock.scala 33:16]
    inst up_counter_min of up_counter_1 @[up_counter_clock.scala 36:30]
    up_counter_min.io_count is invalid
    up_counter_min.io_clr is invalid
    up_counter_min.io_count_max is invalid
    up_counter_min.io_en is invalid
    up_counter_min.reset is invalid
    up_counter_min.clock is invalid
    up_counter_min.clock <= io.clock @[up_counter_clock.scala 37:27]
    up_counter_min.reset <= io.reset @[up_counter_clock.scala 38:27]
    up_counter_min.io_en <= io.clr_sec @[up_counter_clock.scala 39:28]
    up_counter_min.io_count_max <= io.count_max @[up_counter_clock.scala 40:34]
    io.clr_min <= up_counter_min.io_clr @[up_counter_clock.scala 41:14]
    io.count_min <= up_counter_min.io_count @[up_counter_clock.scala 42:16]
    inst up_counter_hrs of up_counter_2 @[up_counter_clock.scala 45:30]
    up_counter_hrs.io_count is invalid
    up_counter_hrs.io_clr is invalid
    up_counter_hrs.io_count_max is invalid
    up_counter_hrs.io_en is invalid
    up_counter_hrs.reset is invalid
    up_counter_hrs.clock is invalid
    up_counter_hrs.clock <= io.clock @[up_counter_clock.scala 46:27]
    up_counter_hrs.reset <= io.reset @[up_counter_clock.scala 47:27]
    up_counter_hrs.io_en <= io.clr_min @[up_counter_clock.scala 48:28]
    up_counter_hrs.io_count_max <= io.count_max_hrs @[up_counter_clock.scala 49:34]
    io.clr_hrs <= up_counter_hrs.io_clr @[up_counter_clock.scala 50:14]
    io.count_hrs <= up_counter_hrs.io_count @[up_counter_clock.scala 51:16]
    
