
library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity mux_3bit_4to1 is
    -- Entity of testbench is always empty
end entity mux_3bit_4to1;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of mux_3bit_4to1 is

       signal s_a           : in  std_logic_vector(1 downto 0);
       signal s_b           : in  std_logic_vector(1 downto 0);
       signal s_c           : in  std_logic_vector(1 downto 0);
       signal s_d           : in  std_logic_vector(1 downto 0);
       signal s_sel         : out std_logic_vector(2 downto 0);
       signal s_f           : in  std_logic_vector(1 downto 0);

begin
    -- Connecting testbench signals with mux_3bit_4to1
    -- entity (Unit Under Test)
    uut_comparator_4bit : entity work.mux_3bit_4to1
        port map(
            a_i           => s_a,
            b_i           => s_b,
            c_i           => s_c,
            d_i           => s_d,
            s_sel         => sel_i,
            s_f           => f_o
        );

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

        -- First test case ...
        s_a <= "1001"; 
        s_b <= "1001"; 
        s_c <= "1001"; 
        s_d <= "1000"; wait for 100 ns;





        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait; -- Data generation process is suspended forever
    end process p_stimulus;

end architecture testbench;
