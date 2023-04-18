module Register_file(
  input         clock,
  input         reset,
  input  [4:0]  io_raddr1,
  input  [4:0]  io_raddr2,
  input  [4:0]  io_waddr,
  input         io_wen,
  input  [31:0] io_wdata,
  output [31:0] io_rdata1,
  output [31:0] io_rdata2
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] mem [0:31]; // @[Register_file.scala 20:16]
  wire [31:0] mem_MPORT_1_data; // @[Register_file.scala 20:16]
  wire [4:0] mem_MPORT_1_addr; // @[Register_file.scala 20:16]
  wire [31:0] mem_MPORT_2_data; // @[Register_file.scala 20:16]
  wire [4:0] mem_MPORT_2_addr; // @[Register_file.scala 20:16]
  wire [31:0] mem_MPORT_data; // @[Register_file.scala 20:16]
  wire [4:0] mem_MPORT_addr; // @[Register_file.scala 20:16]
  wire  mem_MPORT_mask; // @[Register_file.scala 20:16]
  wire  mem_MPORT_en; // @[Register_file.scala 20:16]
  assign mem_MPORT_1_addr = io_raddr1;
  assign mem_MPORT_1_data = mem[mem_MPORT_1_addr]; // @[Register_file.scala 20:16]
  assign mem_MPORT_2_addr = io_raddr2;
  assign mem_MPORT_2_data = mem[mem_MPORT_2_addr]; // @[Register_file.scala 20:16]
  assign mem_MPORT_data = io_wdata;
  assign mem_MPORT_addr = io_waddr;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_wen;
  assign io_rdata1 = mem_MPORT_1_data; // @[Register_file.scala 26:13]
  assign io_rdata2 = mem_MPORT_2_data; // @[Register_file.scala 27:13]
  always @(posedge clock) begin
    if(mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[Register_file.scala 20:16]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    mem[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
