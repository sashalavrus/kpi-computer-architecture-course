`timescale 1ns/1ps
module Block1_inst;

reg CLOCK_50_sig;
reg KEY0_sig;
wire overflow_sig;
wire  pin_name1_sig;




Block1 Block1_inst
(
	.CLOCK_50(CLOCK_50_sig) ,	// input  CLOCK_50_sig
	.KEY0(KEY0_sig) ,	// input  KEY0_sig
	.ovrflow(ovrflow_sig) ,	// output  ovrflow_sig
	.pin_name1(pin_name1_sig) 	// output  pin_name1_sig
);

initial begin
	CLOCK_50_sig = 0;
	forever #1 CLOCK_50_sig = ~CLOCK_50_sig;
end



initial begin
	KEY0_sig = 0;
	#3 KEY0_sig = 1;
end

initial begin
	#10000000 $stop();
end

endmodule



