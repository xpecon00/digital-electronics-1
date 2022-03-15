

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for mux_3bit
------------------------------------------------------------
entity mux_3bit is
    port(
        a_i           : in  std_logic_vector(1 downto 0);
        b_i           : in  std_logic_vector(1 downto 0);
        c_i           : in  std_logic_vector(1 downto 0);
        d_i           : in  std_logic_vector(1 downto 0);
        sel_i         : out std_logic_vector(2 downto 0);
        f_o           : in  std_logic_vector(1 downto 0)
    );
end entity mux_3bit;

------------------------------------------------------------
-- Architecture body for mux3_bit
------------------------------------------------------------
architecture Behavioral of mux_3bit is
begin
f_o <= a_i when (sel_i = "00") else;
       b_i when (sel_i = "01") else;
       c_i when (sel_i = "10") else;
       d_i when (sel_i = "11") else;

end architecture Behavioral;
