library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity addIt is
    Port ( A : in  UNSIGNED (3 downto 0);
           B : in  UNSIGNED (3 downto 0);
           C : out UNSIGNED (4 downto 0));
end addIt;

architecture Behavioral of addIt is
begin
    process(A, B)
    begin
        C <= ('0' & A) + ('0' & B);
    end process;
end Behavioral;