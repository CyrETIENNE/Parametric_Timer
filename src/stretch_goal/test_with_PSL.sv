//timeunit 1ns / 1ns;
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2026 12:56:37
// Design Name: 
// Module Name: test_with_PSL
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


module test_with_PSL

#(  parameter integer clk_freq_hz_g = 100e6,
	parameter integer delay_g = 10 //in ms
)
(
	input logic clk_i,
	input logic arst_i,
	input logic start_i,
	output logic done_o
);

	localparam integer nb = delay_g*clk_freq_hz_g/1e3;
	integer cpt = 0;
	
	typedef enum logic [0:0] {
	   INIT = 1'b0,
	   START = 1'b1
	   } state_t;   

    state_t present_state = INIT;

    always_ff @(posedge clk_i or posedge arst_i)
    begin
	
		if (arst_i)
		begin
			present_state <= INIT;
			done_o <= 1;
			cpt <= 0;
        end
        
        else
        begin
            case(present_state)
            
                INIT:
                begin
                    done_o <= 1;
                    cpt <= 0;
                    if (start_i)
                        present_state <= START;
                end
                
                START:
                begin
                    done_o <= 0;
                    if (cpt >= nb)
                    begin
                        done_o <= 1;
                        present_state <= INIT;
						assert property(@(posedge(clk_i)) done_o == 1)
                    end
                    else
                        cpt <= cpt + 1;
                        present_state <= START;
                end
                
                default:
                begin
                    done_o <= 1;
                end 
            endcase
        end     
    end		
endmodule
