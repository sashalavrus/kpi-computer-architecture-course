`timescale 1ns/1ps

`define REG_WIDTH 32

//code part take from Aleksandr Shlihta

module incrementer #(parameter WIDTH = 1)(d_in, d_out);

input [WIDTH-1:0] d_in;

output [WIDTH-1:0] d_out;

assign d_out = d_in + 1;

endmodule

