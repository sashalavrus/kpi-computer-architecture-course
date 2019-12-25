
`timescale 1ns/1ps 

module GPIO_inst;

reg i_clk_sig;
reg i_rst_n_sig;



wire [31:0] IO_sig;
reg  [31:0] i_DOUT_sig;
reg  [31:0] i_DDIR_sig;
reg i_WER_sig;
reg i_WEO_sig;
wire  [31:0] o_DIN_sig;

wire [31:0] temp;
wire [31:0] outputwire;

assign temp = i_DDIR_sig;
assign outputwire = o_DIN_sig;

assign  IO_sig = (~temp) ? 31'bz: i_DOUT_sig;
assign o_DIN_sig = IO_sig;



GPIO GPIO_inst
(
	.i_DDIR(i_DDIR_sig) ,	// input [31:0] i_DDIR_sig
	.i_clk(i_clk_sig) ,	// input  i_clk_sig
	.i_rst_n(i_rst_n_sig) ,	// input  i_rst_n_sig
	.IO(IO_sig) ,	// inout [31:0] IO_sig
	.i_DOUT(i_DOUT_sig) ,	// input [31:0] i_DOUT_sig
	.i_WER(i_WER_sig) ,	// input  i_WER_sig
	.i_WEO(i_WEO_sig) ,	// input  i_WEO_sig
	.o_DIN(o_DIN_sig) 	// output [31:0] o_DIN_sig
);

initial begin
	i_clk_sig = 0;
	forever #1 i_clk_sig = ~i_clk_sig;
end

initial begin
	i_DDIR_sig = 32'b00000000000000000000000000000011;
	
	i_DOUT_sig = 32'b00000000000000000000000000001011;
	
	i_WEO_sig = 1'b1;
	
	i_WER_sig = 1'b1;
	

end



initial begin
	i_rst_n_sig = 0;
	#3 i_rst_n_sig = 1;
end


initial begin
	#1000 $stop();
end

endmodule