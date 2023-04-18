module tb_clock;


reg			        clock;
reg 		        reset;
reg				    en;
reg	    [31:0]	    count_max;

reg	    [31:0]	    count_max_hrs;


wire                clr_sec;
wire    [31:0]	    count_sec;

wire                clr_min;
wire    [31:0]      count_min;

wire                clr_hrs;
wire    [31:0]      count_hrs;





clock

clock_inst(
.io_clock            (clock        ),
.io_reset            (reset        ),
.io_en            (en              ),
.io_count_max     (count_max       ),

.io_count_max_hrs (count_max_hrs  ),

.io_clr_sec       (clr_sec         ),
.io_count_sec     (count_sec       ),

.io_clr_min       (clr_min         ),
.io_count_min     (count_min       ),

.io_clr_hrs       (clr_hrs         ),
.io_count_hrs     (count_hrs       )


);

initial
begin
clock = 0;
forever
#5 clock = ~clock;
end


initial 
begin

    $dumpfile("wave.vcd");
	$dumpvars(0, tb_clock);
	
reset     = 0;
en        = 0;	
count_max = 32'd59;
count_max_hrs = 32'd23;

@(posedge clock)
reset <= #1 1;
@(posedge clock)
reset <= #1 0;

@(posedge clock);
#1 en = 1;

repeat(7200) @(posedge clock);
#1 en = 0;

repeat(20)@(posedge clock);
$finish;
   
	
end

endmodule

