import chisel3._

object Main extends App {

  println((new chisel3.stage.ChiselStage).emitVerilog(new clock(32)))
}


class clock(val width: Int) extends Module {
  val io = IO(new Bundle {
    val en = Input(Bool())
    val count_max =Input(UInt(width.W))
    val clr_sec = Output(Bool())
    val count_sec = Output(UInt(width.W))


  })

  val up_counter_sec = Module(new up_counter(width))
  up_counter_sec.io.en  := io.en
  up_counter_sec.io.count_max := io.count_max
  io.clr_sec := up_counter_sec.io.clr
  io.count_sec := up_counter_sec.io.count

}