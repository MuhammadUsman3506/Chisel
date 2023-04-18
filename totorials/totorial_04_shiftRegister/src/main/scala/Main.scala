
import chisel3._

object Main extends App {

  println((new chisel3.stage.ChiselStage).emitVerilog(new ShiftRegisterExample(4)))
}