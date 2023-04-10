import chisel3._

object register_module extends App {

  println((new chisel3.stage.ChiselStage).emitVerilog(new register()))
}

class register extends Module {
  val io = IO(new Bundle {
    val in = Input(Bool())
    val an = Input(Bool())
    val out = Output(Bool())
  })

  val reg2 = Reg ( Bool () )
  reg2 := io.in
  io.out := reg2

  //io.out := io.in

}
