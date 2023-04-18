import chisel3._
import chisel3.util._

object Main extends App {

  println((new chisel3.stage.ChiselStage).emitVerilog(new UpDownCounter(10)))
}



class UpDownCounter(maxVal: Int) extends Module {
  val io = IO(new Bundle {
    val up = Input(Bool())
    val down = Input(Bool())
    val out = Output(UInt(log2Ceil(maxVal).W))
  })

  val count = RegInit(0.U(log2Ceil(maxVal).W))

  when(io.up && !io.down && count =/= (maxVal-1).U) {
    count := count + 1.U
  }.elsewhen(!io.up && io.down && count =/= 0.U) {
    count := count -1.U
  }

  io.out := count

}





