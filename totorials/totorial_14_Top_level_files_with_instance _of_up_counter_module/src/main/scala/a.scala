import chisel3 . _

/*object Main extends App {

  println((new chisel3.stage.ChiselStage).emitVerilog(new UpCounter(32)))
}*/

class UpCounter(val width: Int) extends Module {
  val io = IO(new Bundle {
    val enable = Input(Bool())
    val maxCount = Input(UInt(width.W))
    val count = Output(UInt(width.W))
    val clear = Output(Bool())
  })

  val countReg = RegInit(0.U(width.W))
  val clearReg = RegInit(false.B)

  when (io.enable && countReg =/= io.maxCount) {
    countReg := countReg + 1.U
  }

  when (countReg === io.maxCount) {
    clearReg := true.B
  }

  io.count := countReg
  io.clear := clearReg

  when (io.clear) {
    countReg := 0.U
    clearReg := false.B
  }
}