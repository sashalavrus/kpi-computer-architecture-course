`timescale 1ns/1ps
module GPIO(input [31:0] i_DDIR,
			input i_clk, 
			input i_rst_n,
			inout [31:0] IO, // bidirectional bus of wires
			input [31:0] i_DOUT,
			input i_WER,
			input i_WEO, 
			output [31:0] o_DIN); //wire on output

reg [31:0] DDIR;
reg [31:0] DIN;
reg [31:0] DOUT;

assign o_DIN = DIN;

genvar a;
	generate
		for (a = 0; a <= 31; a = a + 1) begin : pinIO
			assign IO[a] = (~DDIR[a]) ? DOUT[a] : 1'bz;
		end
	endgenerate

always @(negedge i_clk, negedge i_rst_n) begin
	if(~i_rst_n) 
		DIN <= 0;
	else
		DIN <= IO;
end

always @(posedge i_clk,negedge i_rst_n) begin
	if(~i_rst_n) 
		DOUT <= 0;
	else if (i_WEO) DOUT <= i_DOUT;
	else  DOUT <=DOUT;
end
	
always @(posedge i_clk, negedge i_rst_n) begin
	if(~i_rst_n) 
		DDIR <= 0;
	else if(i_WER) 
		DDIR <= i_DDIR;
	else 
		DDIR <=DDIR;
end

endmodule
