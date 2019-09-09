
// Generated by Quartus II 64-Bit Version 13.0 (Build Build 232 06/12/2013)
// Created on Sun Sep  8 22:20:06 2019
`timescale 1ns/1ps
module test;

reg arstn_sig, srstn_sig, clk_sig, we_sig;
reg [31:0] data_sig;
wire [31:0] q_sig;



reg32_sync_reset reg32_sync_reset_inst
(
	.arstn(arstn_sig) ,	// input  arstn_sig
	.srstn(srstn_sig) ,	// input  srstn_sig
	.clk(clk_sig) ,	// input  clk_sig
	.we(we_sig) ,	// input  we_sig
	.data(data_sig) ,	// input [31:0] data_sig
	.q(q_sig) 	// output [31:0] q_sig
);

initial begin
	clk_sig=1'b0;
	forever #1 clk_sig=~clk_sig;
end


initial begin 
	arstn_sig = 1'b1;
	srstn_sig = 1'b1;
	we_sig = 1'b1;

	#2 arstn_sig = ~arstn_sig;
	#2 arstn_sig = ~arstn_sig;

	#50 srstn_sig=~srstn_sig;
	#10 srstn_sig=~srstn_sig;
end

initial begin 
	data_sig=32'h12345678;
	#20 data_sig=32'habcdef00;
	#60 data_sig=32'hdeadbeef;
end

initial begin 
	#100 $stop();
end



endmodule 
