`timescale 1ns/1ps
module counter_year(i_clk, i_rst_n, i_srst, i_cnt_en, o_tick, o_data);

parameter MAX_VAL = 4096;
parameter WIDTH   = 12;

input               i_clk;
input               i_rst_n;
input               i_srst;
input               i_cnt_en;
output  [WIDTH-1:0] o_data;
output  reg         o_tick;

reg     [WIDTH-1:0] cnt;

wire    cnt_overflow = ((MAX_VAL == cnt) & i_cnt_en);

assign  o_data = cnt;

always @(posedge i_clk, negedge i_rst_n) begin
    if(!i_rst_n) begin
        o_tick <= 1'b0;
    end else begin
        if (cnt_overflow)
            o_tick <= 1'b1;
        else
            o_tick <= 1'b0;
    end
end

always @(posedge i_clk, negedge i_rst_n) begin
    if(!i_rst_n) begin
        cnt <= 12'b011110110010;
    end else begin
        if (cnt_overflow | i_srst)
            cnt <= 12'b011110110010;
        else if (i_cnt_en)
            cnt <= cnt + 1'b1;
    end
end

endmodule
