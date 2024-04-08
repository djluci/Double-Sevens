library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity addItbench is
end addItbench;

architecture sim of addItbench is
    signal A, B: UNSIGNED(3 downto 0);
    signal C: UNSIGNED(4 downto 0);
    signal hexDisplay1, hexDisplay2: UNSIGNED(3 downto 0);

    -- Instantiate the addIt
    component addIt
        Port ( A : in  UNSIGNED (3 downto 0);
               B : in  UNSIGNED (3 downto 0);
               C : out UNSIGNED (4 downto 0));
    end component;

    -- Assuming a hexdisplay component with the following interface
    component hexdisplay
        Port ( 
               in_port : in UNSIGNED(3 downto 0);
               out_port: out UNSIGNED(6 downto 0)
             );
    end component;

begin
    -- Connect the addIt
    UUT: addIt port map (
        A => A,
        B => B,
        C => C
    );

    -- Connect the hex displays
    hexDisplay1 <= C(3 downto 0);
    hexDisplay2 <= "000" & C(4);

    hex1: hexdisplay port map (hexDisplay1);
    hex2: hexdisplay port map (hexDisplay2);

    -- Testbench stimulus process
    process
    begin
        for i in 0 to 15 loop
            for j in 0 to 15 loop
                A <= to_unsigned(i, 4);
                B <= to_unsigned(j, 4);
                wait for 10 ns;  -- Adjust the delay as needed
            end loop;
        end loop;
        wait;
    end process;

end sim;