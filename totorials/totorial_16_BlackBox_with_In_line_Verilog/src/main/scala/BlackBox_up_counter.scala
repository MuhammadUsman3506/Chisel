import chisel3._
import chisel3.util.HasBlackBoxInline

class up_counter(val width: Int) extends BlackBox with HasBlackBoxInline {
  val io = IO(new Bundle {
    val clk = Input(Bool())
    val reset = Input(Bool())
    val en = Input(Bool())
    val count_max = Input(UInt(width.W))
    val clr = Output(Bool())
    val count = Output(UInt(width.W))
  })
  setInline("up_counter.v",
    s"""
      |module up_counter(
      |  input         clock,
      |  input         reset,
      |  input         io_en,
      |  input  [31:0] io_count_max,
      |  output        io_clr,
      |  output [31:0] io_count
      |);
      |  reg [31:0] _RAND_0;
      |  reg [31:0] countReg; // @[up_counter.scala 16:25]
      |  wire [31:0] _T_1 = countReg + 32'h1; // @[up_counter.scala 25:26]
      |  assign io_clr = io_en & io_count == io_count_max; // @[up_counter.scala 29:20]
      |  assign io_count = countReg; // @[up_counter.scala 28:12]
      |  always @(posedge clock) begin
      |    if (reset) begin // @[up_counter.scala 16:25]
      |      countReg <= 32'h0; // @[up_counter.scala 16:25]
      |    end else if (io_clr) begin // @[up_counter.scala 22:16]
      |      countReg <= 32'h0; // @[up_counter.scala 23:14]
      |    end else if (io_en) begin // @[up_counter.scala 24:21]
      |      countReg <= _T_1; // @[up_counter.scala 25:14]
      |    end
      |  end
      |endmodule
      |""".stripMargin
  )
}
