import chisel3 . _

object Main extends App {

  println((new chisel3.stage.ChiselStage).emitVerilog(new MyTopLevelModule()))
}
class MyTopLevelModule extends Module {
  val io = IO(new Bundle {
    val enable = Input(Bool())
    val countMax = Input(UInt(32.W))
    val count = Output(UInt(32.W))
    val clear = Output(Bool())
  })

  val counterInstance = Module(new UpCounter(32))

  counterInstance.io.enable := io.enable
  counterInstance.io.maxCount := io.countMax
  io.count := counterInstance.io.count
  io.clear := counterInstance.io.clear
}
