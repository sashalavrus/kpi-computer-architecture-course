`timescale 1ns/1ps

//code part take from Aleksandr Shlihta

module clk_div8(clk_in, clk_out);
input clk_in;

output reg clk_out;

reg clk1, clk2;

always @(posedge clk_in) clk1 <= ~clk1;
always @(posedge clk1) clk2 <= ~clk2;
always @(posedge clk2) clk_out <= ~clk_out;

endmodule
