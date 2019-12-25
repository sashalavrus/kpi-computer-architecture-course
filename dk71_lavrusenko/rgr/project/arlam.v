`timescale 1ns/1ps
module arlam (i_arlam_time, clock_time, clk, arlm_en, o_arlm_int, i_arst_n);

input [31:0] i_arlam_time;
input  clk;
input arlm_en;
input i_arst_n;
input [31:0] clock_time;
output  o_arlm_int;

reg [31:0] out_arlam_mem;

assign o_arlm_int = (out_arlam_mem == clock_time);

always @(posedge clk or negedge i_arst_n) begin
	if (!i_arst_n) begin
		out_arlam_mem <= {32{1'b0}};
	end else if (arlm_en) begin
		out_arlam_mem <= i_arlam_time;
	end else begin
		out_arlam_mem <= out_arlam_mem;
	end
	
	end
	
	
endmodule
