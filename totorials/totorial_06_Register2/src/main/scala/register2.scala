import chisel3._

object register_module extends App {

  println((new chisel3.stage.ChiselStage).emitVerilog(new register2()))
}

class register2 extends Module {
  val io = IO(new Bundle {
    val in = Input(Bool())
    val en = Input(Bool())
    val out = Output(Bool())
  })

  io.out := RegNext(io.in, 0.B)


}

