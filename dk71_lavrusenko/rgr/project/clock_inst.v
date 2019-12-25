
`timescale 1ns/1ps 

module clock_inst;

parameter PERIOD = 20;
parameter DELAY_CYCLES = 60*60*24*10;


reg MAX10_CLK1_50_sig;
reg KEY_sig;


clock clock_inst
(
	.MAX10_CLK1_50(MAX10_CLK1_50_sig) ,	// input  MAX10_CLK1_50_sig
	.KEY(KEY_sig) ,	// input  KEY_sig
	.out_year(out_year_sig) ,	// output  out_year_sig
	.out_month(out_month_sig) ,	// output  out_month_sig
	.out_day(out_day_sig) ,	// output  out_day_sig
	.out_hour(out_hour_sig) ,	// output  out_hour_sig
	.out_min(out_min_sig) 	// output  out_min_sig
);

defparam clock_inst.DIV_CONST = 10;

initial begin
    MAX10_CLK1_50_sig = 0;
	forever #1 MAX10_CLK1_50_sig = ~MAX10_CLK1_50_sig;
end


initial begin

    KEY_sig = 0;
	#3 KEY_sig = 1;
end



initial begin
	#10000 $stop();
end
endmodule