`timescale 1ns/1ps
module  one_hot_div(i_clk, i_rst_n, o_event); 
 
input        i_clk; input        i_rst_n; output       o_event; 
 
parameter     N  =  5 ; 
 
reg      [ N - 1 : 0 ] one_hot_cnt; 
 
assign  o_event = one_hot_cnt[ 0 ]; 
 
always  @( posedge  i_clk,  negedge  i_rst_n)  begin     
 if (~i_rst_n)  begin         
 one_hot_cnt <=  1 ;      
 end   else   begin         
 one_hot_cnt <= {one_hot_cnt[ N - 2 : 0 ], one_hot_cnt[ N - 1 ]};    
 end end 
 
endmodule 