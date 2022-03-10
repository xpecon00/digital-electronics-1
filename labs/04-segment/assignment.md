# Lab 4: David Pěčonka

## 1. Preparation
### The connection of 7-segment displays
![](https://github.com/xpecon00/digital-electronics-1/blob/main/labs/04-segment/images/7seg2.PNG)
![](https://github.com/xpecon00/digital-electronics-1/blob/main/labs/04-segment/images/7seg.PNG) 




### The decoder truth table for **common anode** 7-segment display.
 | **Hex** | **Inputs** | **A** | **B** | **C** | **D** | **E** | **F** | **G** |
   | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
   | 0 | 0000 | 0 | 0 | 0 | 0 | 0 | 0 | 1 |
   | 1 | 0001 | 1 | 0 | 0 | 1 | 1 | 1 | 1 |
   | 2 | 0010 | 0 | 0 | 1 | 0 | 0 | 1 | 0 |
   | 3 | 0011 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
   | 4 | 0100 | 1 | 0 | 0 | 1 | 1 | 0 | 0 |
   | 5 | 0101 | 0 | 1 | 0 | 0 | 1 | 0 | 0 |
   | 6 | 0110 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
   | 7 | 0111 | 0 | 0 | 0 | 1 | 1 | 1 | 1 |
   | 8 | 1000 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
   | 9 | 1001 | 0 | 0 | 0 | 0 | 1 | 0 | 0 |
   | A | 1010 | 0 | 0 | 0 | 1 | 0 | 0 | 1 |
   | b | 1011 | 1 | 1 | 0 | 0 | 0 | 0 | 0 |
   | C | 1100 | 0 | 1 | 1 | 0 | 0 | 0 | 1 |
   | d | 1101 | 1 | 0 | 0 | 0 | 0 | 1 | 0 |
   | E | 1110 | 0 | 1 | 1 | 0 | 0 | 0 | 0 |
   | F | 1111 | 0 | 1 | 1 | 1 | 0 | 0 | 0 |



### Seven-segment display decoder

1. Listing of VHDL stimulus process from testbench file (`tb_hex_7seg.vhd`) with asserts. Verify all input combinations. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;

        -- First test case
        s_hex <= "0000"; wait for 50 ns;
        assert (s_seg = "0000001")
        report "Input combination 0000 FAILED" severity error;
        
        -- Second test case
        s_hex <= "0001"; wait for 50 ns;
        assert (s_seg = "100111")
        report "Input combination 0000 FAILED" severity error;
        
        -- Third test case
        s_hex <= "0010"; wait for 50 ns;
        assert (s_seg = "0010010")
        report "Input combination 0000 FAILED" severity error;
        
        -- Fourth test case
        s_hex <= "0011"; wait for 50 ns;
        assert (s_seg = "0000110")
        report "Input combination 0000 FAILED" severity error;
        
        -- Fifth test case
        s_hex <= "0100"; wait for 50 ns;
        assert (s_seg = "1001100")
        report "Input combination 0000 FAILED" severity error;

        -- Sixth test case
        s_hex <= "0101"; wait for 50 ns;
        assert (s_seg = "0100100")
        report "Input combination 0000 FAILED" severity error;
        
        -- Seventh test case
        s_hex <= "0110"; wait for 50 ns;
        assert (s_seg = "0100000")
        report "Input combination 0000 FAILED" severity error;
        
        -- Eigth test case
        s_hex <= "0111"; wait for 50 ns;
        assert (s_seg = "0001111")
        report "Input combination 0000 FAILED" severity error;
        
        -- Ninth test case
        s_hex <= "1000"; wait for 50 ns;
        assert (s_seg = "0000000")
        report "Input combination 0000 FAILED" severity error;
        
        -- Tenth test case
        s_hex <= "1001"; wait for 50 ns;
        assert (s_seg = "0000100")
        report "Input combination 0000 FAILED" severity error;

        -- Eleventh test case
        s_hex <= "1010"; wait for 50 ns;
        assert (s_seg = "0001001")
        report "Input combination 0000 FAILED" severity error;
        
        -- Twelfth test case
        s_hex <= "1011"; wait for 50 ns;
        assert (s_seg = "1100000")
        report "Input combination 0000 FAILED" severity error;

        -- Thirteenth test case
        s_hex <= "1100"; wait for 50 ns;
        assert (s_seg = "0110001")
        report "Input combination 0000 FAILED" severity error;
        
        -- Fourteenth test case
        s_hex <= "1101"; wait for 50 ns;
        assert (s_seg = "1000010")
        report "Input combination 0000 FAILED" severity error;
        
        -- Fiveteenth test case
        s_hex <= "1110"; wait for 50 ns;
        assert (s_seg = "0110000")
        report "Input combination 0000 FAILED" severity error;
        
        -- Sixteenth test case
        s_hex <= "1111"; wait for 50 ns;
        assert (s_seg = "0111000")
        report "Input combination 0000 FAILED" severity error;

        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;

```

2. Screenshot with simulated time waveforms. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![your figure](https://github.com/xpecon00/digital-electronics-1/blob/main/labs/04-segment/images/display.PNG)

### LED(7:4) indicators

1. Listing of LEDs(7:4) part of VHDL architecture from source file `top.vhd`. Try to write logic functions as simple as possible. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   ```vhdl
   --------------------------------------------------------------------
--------------------------------------------------------------------
-- Experiments on your own: LED(7:4) indicators

-- Turn LED(4) on if input value is equal to 0, ie "0000"
LED(4) <= '1' when (SW = "0000") else '0';

 -- Turn LED(5) on if input value is greater than "1001", ie 10, 11, 12, ...
 LED(5) <= '1' when (SW > "1001") else '0';

 -- Turn LED(6) on if input value is odd, ie 1, 3, 5, ...
 LED(6) <= '1' when (SW(0) = '1') else '0';

 -- Turn LED(7) on if input value is a power of two, ie 1, 2, 4, or 8
 LED(7) <= '1' when (SW = "0001") else
           '1' when (SW = "0010") else
           '1' when (SW = "0100") else  
           '1' when (SW = "1000") else  
           '0';
