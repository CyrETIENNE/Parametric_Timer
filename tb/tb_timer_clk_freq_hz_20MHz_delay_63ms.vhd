library vunit_lib;
context vunit_lib.vunit_context;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.math_real.ALL;

entity tb_timer_clk_freq_hz_20MHz_delay_63ms is
    generic (runner_cfg : string);
end tb_timer_clk_freq_hz_20MHz_delay_63ms;

architecture Behavioral of tb_timer_clk_freq_hz_20MHz_delay_63ms is

    signal clk_i : std_ulogic := '0'; 
    signal arst_i : std_ulogic := '0';
    signal start_i : std_ulogic := '0'; 
    signal done_o : std_ulogic;
    constant clk_freq_hz_g : natural := 20e6; --20MHz
    constant delay_g : time := 63 ms;
    constant T_clock : time := (1e9/(2*clk_freq_hz_g))*1 ns;
	constant my_checker : checker_t := new_checker("my_checker");

begin

    test_runner : process
    begin
    
        test_runner_setup(runner, runner_cfg);
        
		wait until rising_edge(clk_i);
		start_i <= '1';
		wait until rising_edge(clk_i);
		start_i <= '0';
		wait until rising_edge(clk_i);
		wait for delay_g;
		wait until rising_edge(clk_i);	
		check(my_checker, done_o = '1', "Expected done_o to be logic 1 (not counting).");
    
        test_runner_cleanup(runner);
        
    end process;
    
    clk_i <= not clk_i after T_clock;
    
    timer : entity work.timer(Behavioral)
        Generic map(clk_freq_hz_g => clk_freq_hz_g, delay_g => delay_g)
        port map(clk_i => clk_i, arst_i => arst_i, start_i => start_i, done_o => done_o);


end Behavioral;
