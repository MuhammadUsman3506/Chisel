import chisel3._
import chisel3.util.HasBlackBoxResource

object Main extends App {

  println((new chisel3.stage.ChiselStage).emitVerilog(new clock(32)))
}

class clock(val width: Int) extends Module {
  val io = IO(new Bundle {
    val clock = Input(Bool())
    val reset = Input(Bool())




    val count_sec = Output(UInt(width.W))

    val count_min = Output(UInt(width.W))

    val count_hrs = Output(UInt(width.W))


  })
  //val clock = IO(Input(Clock()))
  //val reset = IO(Input(Reset()))




  val en = Wire(Bool())

  val count_max_sec = Wire(UInt(width.W))
  val count_max_min = Wire(UInt(width.W))
  val count_max_hrs = Wire(UInt(width.W))
  val clr_sec = Wire(Bool())
  val clr_min = Wire(Bool())
  val clr_hrs = Wire(Bool())




  en := true.B
  count_max_sec := 59.U
  count_max_min := 59.U
  count_max_hrs := 23.U







  val up_counter_sec = Module(new up_counter(width))
  up_counter_sec.io.clock := io.clock
  up_counter_sec.io.reset := io.reset
  up_counter_sec.io.io_en  := en
  up_counter_sec.io.io_count_max := count_max_sec
  clr_sec := up_counter_sec.io.io_clr
  io.count_sec := up_counter_sec.io.io_count


  val up_counter_min = Module(new up_counter(width))
  up_counter_min.io.clock := io.clock
  up_counter_min.io.reset := io.reset
  up_counter_min.io.io_en  := clr_sec
  up_counter_min.io.io_count_max := count_max_min
  clr_min := up_counter_min.io.io_clr
  io.count_min := up_counter_min.io.io_count


  val up_counter_hrs = Module(new up_counter(width))
  up_counter_hrs.io.clock := io.clock
  up_counter_hrs.io.reset := io.reset
  up_counter_hrs.io.io_en  := clr_min
  up_counter_hrs.io.io_count_max := count_max_hrs
  clr_hrs := up_counter_hrs.io.io_clr
  io.count_hrs := up_counter_hrs.io.io_count


}


class up_counter(val width: Int) extends BlackBox with HasBlackBoxResource {
  val io = IO(new Bundle {
    val clock = Input(Bool())
    val reset = Input(Bool())
    val io_en = Input(Bool())
    val io_count_max = Input(UInt(width.W))
    val io_clr = Output(Bool())
    val io_count = Output(UInt(width.W))
  })

  setResource ("/up_counter.v")

}