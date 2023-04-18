module tb_clock;

reg clk;
reg reset;
wire [31:0] count_sec;
wire [31:0] count_min;
wire [31:0] count_hrs;


clock clock_inst(
.io_clock           (clk            ),
.io_reset           (reset            ),
.io_count_sec       (count_sec         ),
.io_count_min       (count_min         ),
.io_count_hrs       (count_hrs         )
);


initial
begin
clk = 0;
forever
#5 clk = ~clk;
end




initial 
begin

    $dumpfile("wave.vcd");
	$dumpvars(0, tb_clock);
	
reset     = 0;
@(posedge clk)
reset <= #1 1;
@(posedge clk)
reset <= #1 0;

@(posedge clk);


repeat(7200) @(posedge clk);


repeat(20)@(posedge clk);
$finish;
   
	
end

endmodule
