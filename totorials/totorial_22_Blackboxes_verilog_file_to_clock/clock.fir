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
    output io : {flip clock : UInt<1>, flip reset : UInt<1>, count_sec : UInt<32>, count_min : UInt<32>, count_hrs : UInt<32>}
    
    wire en : UInt<1> @[up_counter_clock.scala 27:16]
    wire count_max_sec : UInt<32> @[up_counter_clock.scala 29:27]
    wire count_max_min : UInt<32> @[up_counter_clock.scala 30:27]
    wire count_max_hrs : UInt<32> @[up_counter_clock.scala 31:27]
    wire clr_sec : UInt<1> @[up_counter_clock.scala 32:21]
    wire clr_min : UInt<1> @[up_counter_clock.scala 33:21]
    wire clr_hrs : UInt<1> @[up_counter_clock.scala 34:21]
    en <= UInt<1>("h01") @[up_counter_clock.scala 39:6]
    count_max_sec <= UInt<6>("h03b") @[up_counter_clock.scala 40:17]
    count_max_min <= UInt<6>("h03b") @[up_counter_clock.scala 41:17]
    count_max_hrs <= UInt<5>("h017") @[up_counter_clock.scala 42:17]
    inst up_counter_sec of up_counter @[up_counter_clock.scala 50:30]
    up_counter_sec.io_count is invalid
    up_counter_sec.io_clr is invalid
    up_counter_sec.io_count_max is invalid
    up_counter_sec.io_en is invalid
    up_counter_sec.reset is invalid
    up_counter_sec.clock is invalid
    up_counter_sec.clock <= io.clock @[up_counter_clock.scala 51:27]
    up_counter_sec.reset <= io.reset @[up_counter_clock.scala 52:27]
    up_counter_sec.io_en <= en @[up_counter_clock.scala 53:28]
    up_counter_sec.io_count_max <= count_max_sec @[up_counter_clock.scala 54:34]
    clr_sec <= up_counter_sec.io_clr @[up_counter_clock.scala 55:11]
    io.count_sec <= up_counter_sec.io_count @[up_counter_clock.scala 56:16]
    inst up_counter_min of up_counter_1 @[up_counter_clock.scala 59:30]
    up_counter_min.io_count is invalid
    up_counter_min.io_clr is invalid
    up_counter_min.io_count_max is invalid
    up_counter_min.io_en is invalid
    up_counter_min.reset is invalid
    up_counter_min.clock is invalid
    up_counter_min.clock <= io.clock @[up_counter_clock.scala 60:27]
    up_counter_min.reset <= io.reset @[up_counter_clock.scala 61:27]
    up_counter_min.io_en <= clr_sec @[up_counter_clock.scala 62:28]
    up_counter_min.io_count_max <= count_max_min @[up_counter_clock.scala 63:34]
    clr_min <= up_counter_min.io_clr @[up_counter_clock.scala 64:11]
    io.count_min <= up_counter_min.io_count @[up_counter_clock.scala 65:16]
    inst up_counter_hrs of up_counter_2 @[up_counter_clock.scala 68:30]
    up_counter_hrs.io_count is invalid
    up_counter_hrs.io_clr is invalid
    up_counter_hrs.io_count_max is invalid
    up_counter_hrs.io_en is invalid
    up_counter_hrs.reset is invalid
    up_counter_hrs.clock is invalid
    up_counter_hrs.clock <= io.clock @[up_counter_clock.scala 69:27]
    up_counter_hrs.reset <= io.reset @[up_counter_clock.scala 70:27]
    up_counter_hrs.io_en <= clr_min @[up_counter_clock.scala 71:28]
    up_counter_hrs.io_count_max <= count_max_hrs @[up_counter_clock.scala 72:34]
    clr_hrs <= up_counter_hrs.io_clr @[up_counter_clock.scala 73:11]
    io.count_hrs <= up_counter_hrs.io_count @[up_counter_clock.scala 74:16]
    
