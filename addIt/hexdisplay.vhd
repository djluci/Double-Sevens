library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity hexdisplay is
    Port ( 
			in_port : IN UNSIGNED(3 downto 0);
			out_port: OUT UNSIGNED(6 downto 0)
		);
end hexdisplay;

architecture Behavioral of hexdisplay is
begin
process(in_port)
    variable temp : UNSIGNED(6 downto 0);
begin
    case to_integer(in_port) is
         when 0 => temp := "0111111"; -- 0
			when 1 => temp := "0000110"; -- 1
			when 2 => temp := "1011011"; -- 2
			when 3 => temp := "1001111"; -- 3
			when 4 => temp := "1100110"; -- 4
			when 5 => temp := "1101101"; -- 5
			when 6 => temp := "1111101"; -- 6
			when 7 => temp := "0000111"; -- 7
			when 8 => temp := "1111111"; -- 8
			when 9 => temp := "1101111"; -- 9
			when 10 => temp := "1110111"; -- A
			when 11 => temp := "1111100"; -- B
			when 12 => temp := "0111001"; -- C
			when 13 => temp := "1011110"; -- D
			when 14 => temp := "1111001"; -- E
			when 15 => temp := "1110001"; -- F
			when others => temp := "0000000"; -- Default to off
    end case;
    out_port <= temp;
end process;
end Behavioral;