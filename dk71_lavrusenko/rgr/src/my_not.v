`timescale 1ns/1ps
module my_not(i_d, o_data);

input [31:0] i_d;
output [31:0] o_data;

assign o_data = ~i_d;

endmodule
