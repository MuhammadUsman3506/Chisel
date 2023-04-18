module Register_file_tb();

    // Inputs
	reg clock;
	reg reset;
    reg [4:0] raddr1_tb;
    reg [4:0] raddr2_tb;
    reg [4:0] waddr_tb;
    reg wen_tb;
    reg [31:0] wdata_tb;

    // Outputs
    wire [31:0] rdata1_tb;
    wire [31:0] rdata2_tb;

    // Instantiate the Register File module
    Register_file register_file_inst(
	    .clock (clock),
		.reset (reset),
        .io_raddr1(raddr1_tb),
        .io_raddr2(raddr2_tb),
        .io_waddr(waddr_tb),
        .io_wen(wen_tb),
        .io_wdata(wdata_tb),
        .io_rdata1(rdata1_tb),
        .io_rdata2(rdata2_tb)
    );
	
	initial
begin
clock = 0;
forever
#5 clock = ~clock;
end

    initial begin
	 $dumpfile("wave.vcd");
	 $dumpvars(0, Register_file_tb);
        // Initialize inputs
        raddr1_tb = 0;
        raddr2_tb = 0;
        waddr_tb = 0;
        wen_tb = 0;
        wdata_tb = 0;
@(posedge clock)
reset <= #1 1;
@(posedge clock)
reset <= #1 0;
    
       

        @(posedge clock);
        waddr_tb = 1;
        wen_tb = 1;
        wdata_tb = 123;

        // Read data from register file
        raddr1_tb = 1;
        raddr2_tb = 2;

        // Wait for 10ns for the Register File module to update its outputs
       repeat(10) @(posedge clock);
	   wen_tb = 0;
	   
	   

        repeat(20)@(posedge clock);
        // Stop the simulation
        $finish;
    end

endmodule