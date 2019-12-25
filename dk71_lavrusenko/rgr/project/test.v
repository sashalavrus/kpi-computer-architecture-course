`timescale 1ns/1ps
module test #(parameter WIDTH=32) (
  input i_clk,
  input i_arstn,
  input [WIDTH-1:0] i_div,
  output reg o_ce);

reg [WIDTH-1:0] cnt;

// count logic
always @(posedge i_clk, negedge i_arstn) begin
	if (!i_arstn) begin
		cnt <= {WIDTH{1'h0}};
	end else if (o_ce) begin
		cnt <= i_div;
	end else begin
		cnt <= cnt - 1'b1;
	end
end

always @* begin
	o_ce = ~|cnt;
end

endmodule



// dirty code....
module tb;

reg clk, arstn;
wire outce;

initial begin
	clk = 0;
	forever #1 clk = ~clk;
end

initial begin
	arstn = 0;
	#10 arstn = 1;
end

test testmod(
	.i_clk(clk),
	.i_arstn(arstn),
	.i_div(32'd5),
	.o_ce(outce)
);

initial begin
	#100 $stop();
end

endmodule
