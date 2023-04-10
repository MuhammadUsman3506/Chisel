import chisel3._
import chisel3.util.RegEnable

object register_module extends App {

  println((new chisel3.stage.ChiselStage).emitVerilog(new register3()))
}


class register3 extends Module {
  val io = IO(new Bundle {
    val in = Input(Bool())
    val en = Input(Bool())
    val out = Output(Bool())
  })

  io.out := RegEnable(io.in,0.B,io.en)



}