import Chisel.log2Ceil
import chisel3._

object Main extends App {

  println((new chisel3.stage.ChiselStage).emitVerilog(new mux_vec(4,32)))
}

class mux_vec(n: Int, width: Int) extends Module{
  val io = IO(new Bundle{
    val in = Input(Vec(n, UInt(width.W)))
    val sel = Input(UInt(log2Ceil(width).W))
    val out = Output(UInt(width.W))

  })
  io.out := io.in(io.sel)
}