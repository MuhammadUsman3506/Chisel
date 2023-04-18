import chisel3._
object Main extends App {

  println((new chisel3.stage.ChiselStage).emitVerilog(new up_counter(32)))
}


class up_counter(val width: Int) extends Module{
  val io = IO(new Bundle {
    val en         = Input(Bool())
    val count_max  = Input(UInt(width.W))
    val clr        = Output(Bool())
    val count      = Output(UInt(width.W))
  })

  val countReg = RegInit(0.U(width.W))
  //io.clr := io.en & (count === count_max)




  when(io.clr) {
    countReg :=  0.U
  }.elsewhen(io.en) {
    countReg := countReg + 1.U
  }

  io.count := countReg
  io.clr := (io.en && (io.count === io.count_max))


}


