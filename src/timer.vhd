----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Cyril ETIENNE
-- 
-- Create Date: 05.01.2026 00:56:03
-- Design Name: Parametric timer
-- Module Name: timer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.math_real.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timer is
    Generic (
        clk_freq_hz_g : natural := 100e6;    -- Clock Frequency. Must be in Hz
        delay_g : time := 100 ms             -- Delay duration. Must be in ms and natural.
    );
    
    Port ( 
        clk_i : in std_ulogic;      -- System clock
        arst_i : in std_ulogic;     -- Asynchronous reset
        start_i : in std_ulogic;    -- No effect if (not done_o)        
        done_o : out std_ulogic     -- '1' when not counting ("not busy")
    );
end timer;

architecture Behavioral of timer is

    constant nb_clock_cycles : natural := (delay_g/1 ms)*clk_freq_hz_g/1e3;
    signal cpt_clock_cycles : natural := 0;
    type timer_step is (INIT, START);
    signal current_timer_step : timer_step := INIT;
    
begin

    timer_FSM : process(clk_i, current_timer_step, arst_i)
    begin
        
        if arst_i = '1' then
            done_o <= '1';
            current_timer_step <= INIT;
            
        elsif rising_edge(clk_i) then
        
            case current_timer_step is
                
                -- 'INIT' : first state of the timer. Waiting until "start_i" = '1' to begin counting.
                when INIT =>
                    done_o <= '1';                 
                    if start_i = '1' then                                   
                        current_timer_step <= START;
                    else
                        current_timer_step <= INIT;  
                    end if;   
                                
                -- 'START' : counting the number of clock cycles according to the delay "delay_g" (in ms)
                -- and the clock frequency "clk_freq_hz_g" (in Hz)
                when START =>
                    done_o <= '0';
                    if cpt_clock_cycles >= nb_clock_cycles then
                        done_o <= '1';
                        cpt_clock_cycles <= 0;
                        current_timer_step <= INIT; 
                    else 
                        cpt_clock_cycles <= cpt_clock_cycles + 1;
                        current_timer_step <= START;
                    end if;
                    
                when others =>
                    done_o <= '1';
                    
            end case;
        end if;
   end process timer_FSM;                  
                            
end Behavioral;
