import chisel3._


class ShiftRegisterExample(width: Int) extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(width.W))
    val out = Output(UInt(width.W))
  })

  val reg0 = RegInit(0.U(width.W))
  val reg1 = RegInit(0.U(width.W))
  val reg2 = RegInit(0.U(width.W))
  val reg3 = RegInit(0.U(width.W))

  reg0 := io.in
  reg1 := reg0
  reg2 := reg1
  reg3 := reg2

  io.out := reg3
}