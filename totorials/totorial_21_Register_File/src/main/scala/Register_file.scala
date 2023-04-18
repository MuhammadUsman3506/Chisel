import chisel3._

object Main extends App {

  println((new chisel3.stage.ChiselStage).emitVerilog(new Register_file()))
}


class Register_file extends Module {
  val io = IO(new Bundle{
    val raddr1 = Input(UInt(5.W))
    val raddr2 = Input(UInt(5.W))
    val waddr = Input(UInt(5.W))
    val wen = Input(Bool())
    val wdata = Input(UInt(32.W))
    val rdata1 = Output(UInt(32.W))
    val rdata2 = Output(UInt(32.W))
  })

  val mem = Mem(32, UInt(32.W))

  when(io.wen) {
    mem(io.waddr) := io.wdata
  }

  io.rdata1 := mem(io.raddr1)
  io.rdata2 := mem(io.raddr2)

}