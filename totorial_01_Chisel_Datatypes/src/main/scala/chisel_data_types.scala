import chisel3._

object Main extends App {

  println((new chisel3.stage.ChiselStage).emitVerilog(new MyModule() ))
}


import chisel3._

class MyModule extends Module {
  val io = IO(new Bundle {
    val in1 = Input(Bool())
    val out1 = Output(UInt(32.W))
    val out2 = Output(UInt(32.W))
    val out3 = Output(UInt(32.W))

  })
  val x1 = 23.S(32.W)
  val x2 = (23.U).asSInt
  val x3 = WireInit(true.B)


  io.out1 := x1.asUInt
  io.out2 := x2.asUInt
  io.out3 := io.in1 ^ x3
}