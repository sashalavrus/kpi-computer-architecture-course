`timescale 1ns/1ps

module clock(MAX10_CLK1_50, KEY, out_year, out_month, out_day, out_hour, out_min );

parameter       DIV_CONST = 50;

input           MAX10_CLK1_50;
input   		    KEY;
output  [11:0] out_year; 
output  [3:0] out_month; 
output  [7:0] out_day; 
output  [7:0] out_hour; 
output  [7:0] out_min;  

wire    [3:0]   sec0, sec1, min0, min1, hour0, hour1, day0, day1, month0, year0;
wire            sec0_to_sec1, sec1_to_min0, min0_to_min1, min1_to_hour0, hour0_to_hour1, day0_to_day1, day1_to_month, month_to_year;
wire            tick_1hz;

wire sys_clk    = MAX10_CLK1_50;
wire sys_rst_n  = KEY;
wire clr_hrs    = (8'h24 == {hour1, hour0});


assign out_year = year0;

assign out_month = month0;

assign out_day = {day1,day0};

assign out_hour = {hour1,hour0};

assign out_min = {min1,min0};




// Creating 1 Hz reference signal

counter #(.MAX_VAL(DIV_CONST-1), .WIDTH(26) ) freq_div(.i_clk (sys_clk), 
                                                        .i_rst_n (sys_rst_n), 
                                                        .i_srst (1'b0),
                                                        .i_cnt_en (1'b1), 
                                                        .o_data (),
                                                        .o_tick (tick_1hz)
                                                       );

// Counters for secs, mins, hours

counter #(.MAX_VAL(9), .WIDTH(4) ) sec_0(.i_clk (sys_clk), 
                                          .i_rst_n (sys_rst_n), 
                                          .i_srst (1'b0),
                                          .i_cnt_en (tick_1hz), 
                                          .o_data (sec0),
                                          .o_tick (sec0_to_sec1)
                                        );

counter #(.MAX_VAL(5), .WIDTH(4) ) sec_1(.i_clk (sys_clk), 
                                          .i_rst_n (sys_rst_n), 
                                          .i_srst (1'b0),
                                          .i_cnt_en (sec0_to_sec1),
                                          .o_data(sec1), 
                                          .o_tick (sec1_to_min0)
                                        );

counter #(.MAX_VAL(9), .WIDTH(4) ) min_0(.i_clk (sys_clk), 
                                          .i_rst_n (sys_rst_n), 
                                          .i_srst (1'b0),
                                          .i_cnt_en (sec1_to_min0), 
                                          .o_data(min0),
                                          .o_tick (min0_to_min1)
                                        );

counter #(.MAX_VAL(5), .WIDTH(4) ) min_1(.i_clk (sys_clk), 
                                          .i_rst_n (sys_rst_n), 
                                          .i_srst (1'b0),
                                          .i_cnt_en (min0_to_min1), 
                                          .o_data(min1),
                                          .o_tick (min1_to_hour0)
                                        );

counter #(.MAX_VAL(9), .WIDTH(4) ) hour_0(.i_clk (sys_clk), 
                                          .i_rst_n (sys_rst_n), 
                                          .i_srst (clr_hrs),
                                          .i_cnt_en (min1_to_hour0), 
                                          .o_data(hour0),
                                          .o_tick (hour0_to_hour1)
                                        );

counter #(.MAX_VAL(5), .WIDTH(4) ) hour_1(.i_clk (sys_clk), 
                                          .i_rst_n (sys_rst_n), 
                                          .i_srst (clr_hrs),
                                          .i_cnt_en (hour0_to_hour1), 
                                          .o_data(hour1),
                                          .o_tick ()
                                        );
													 
counter #(.MAX_VAL(9), .WIDTH(4) ) day_0(.i_clk (sys_clk), 
                                          .i_rst_n (sys_rst_n), 
                                          .i_srst (1'b0),
                                          .i_cnt_en (clr_hrs), 
                                          .o_data(day0),
                                          .o_tick (day0_to_day1)
                                        );													 

counter #(.MAX_VAL(3), .WIDTH(4) ) day_1(.i_clk (sys_clk), 
                                          .i_rst_n (sys_rst_n), 
                                          .i_srst (1'b0),
                                          .i_cnt_en (day0_to_day1), 
                                          .o_data(day1),
                                          .o_tick (day1_to_month)
                                        );	
													 
counter #(.MAX_VAL(12), .WIDTH(4) ) month(.i_clk (sys_clk), 
                                          .i_rst_n (sys_rst_n), 
                                          .i_srst (1'b0),
                                          .i_cnt_en (day1_to_month), 
                                          .o_data(month0),
                                          .o_tick (month_to_year)
                                        );

													 
													 
													 
counter_year #(.MAX_VAL(4096), .WIDTH(12) ) year(.i_clk (sys_clk), 
                                          .i_rst_n (sys_rst_n), 
                                          .i_srst (1'b0),
                                          .i_cnt_en (month_to_year), 
                                          .o_data(year0),
                                          .o_tick ()
                                        );
// Decoding secs, mins, hours from bin to 7-seg control signals


endmodule
