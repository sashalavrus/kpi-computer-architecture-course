// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.


// Generated by Quartus II 64-Bit Version 13.0 (Build Build 232 06/12/2013)
// Created on Wed Dec 25 14:39:10 2019

counter counter_inst
(
	.i_clk(i_clk_sig) ,	// input  i_clk_sig
	.i_rst_n(i_rst_n_sig) ,	// input  i_rst_n_sig
	.i_srst(i_srst_sig) ,	// input  i_srst_sig
	.i_cnt_en(i_cnt_en_sig) ,	// input  i_cnt_en_sig
	.o_tick(o_tick_sig) ,	// output  o_tick_sig
	.o_data(o_data_sig) 	// output [WIDTH-1:0] o_data_sig
);

defparam counter_inst.MAX_VAL = 7;
defparam counter_inst.WIDTH = 4;
