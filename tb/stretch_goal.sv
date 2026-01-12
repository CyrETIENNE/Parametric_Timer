timeunit 1ns / 1ns;
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2026 14:42:02
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb;
    
    parameter integer clk_freq_hz_g = 25e6;
	parameter integer delay = 17;
    logic clk_i;
    logic arst_i = 0;
    logic start_i;
    logic done_o;
    parameter clk_period = (1e9/clk_freq_hz_g)*1ns; 
        
    initial begin
        clk_i <= 0;
        forever #(clk_period/2) clk_i <= ~clk_i;
    end
    
    initial begin
        #(clk_period/2);
        start_i <= 1;
        #(2*clk_period);
        start_i <= 0;
        #(clk_period/2);
        #(delay);
        #(clk_period/2);
    end
    
    test_with_PSL #(.clk_freq_hz_g(clk_freq_hz_g), .delay_g(delay)) testeur(
        .clk_i (clk_i),
        .arst_i (arst_i),
        .start_i (start_i),
        .done_o (done_o)
        );
        
endmodule
