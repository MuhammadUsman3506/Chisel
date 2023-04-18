import chisel3._
import chisel3.util.HasBlackBoxResource


class up_counter(val width: Int) extends BlackBox with HasBlackBoxResource {
  val io = IO(new Bundle {
    val clk = Input(Bool())
    val reset = Input(Bool())
    val enable = Input(Bool())
    val count_max = Input(UInt(width.W))
    val clr = Output(Bool())
    val count = Output(UInt(width.W))
  })

  setResource ("/up_counter.v")

}