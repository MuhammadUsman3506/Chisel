module ShiftRegisterExample(
  input        clock,
  input        reset,
  input  [3:0] io_in,
  output [3:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] reg0; // @[shiftRegister.scala 10:21]
  reg [3:0] reg1; // @[shiftRegister.scala 11:21]
  reg [3:0] reg2; // @[shiftRegister.scala 12:21]
  reg [3:0] reg3; // @[shiftRegister.scala 13:21]
  assign io_out = reg3; // @[shiftRegister.scala 20:10]
  always @(posedge clock) begin
    if (reset) begin // @[shiftRegister.scala 10:21]
      reg0 <= 4'h0; // @[shiftRegister.scala 10:21]
    end else begin
      reg0 <= io_in; // @[shiftRegister.scala 15:8]
    end
    if (reset) begin // @[shiftRegister.scala 11:21]
      reg1 <= 4'h0; // @[shiftRegister.scala 11:21]
    end else begin
      reg1 <= reg0; // @[shiftRegister.scala 16:8]
    end
    if (reset) begin // @[shiftRegister.scala 12:21]
      reg2 <= 4'h0; // @[shiftRegister.scala 12:21]
    end else begin
      reg2 <= reg1; // @[shiftRegister.scala 17:8]
    end
    if (reset) begin // @[shiftRegister.scala 13:21]
      reg3 <= 4'h0; // @[shiftRegister.scala 13:21]
    end else begin
      reg3 <= reg2; // @[shiftRegister.scala 18:8]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg0 = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  reg1 = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  reg2 = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  reg3 = _RAND_3[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
