library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity hexdisplay_tb is
end hexdisplay_tb;

architecture sim of hexdisplay_tb is
    signal clk : STD_LOGIC := '0';
    signal count : UNSIGNED(3 downto 0) := "0000";
    signal seg_out : UNSIGNED(6 downto 0);

    -- Clock period definition
    constant clk_period : time := 10 ns;

    -- Instantiate the hexdisplay entity
    component hexdisplay
        Port ( in : in UNSIGNED(3 downto 0);
               out : out UNSIGNED(6 downto 0));
    end component;

begin
    -- Clock process
    clk_process : process
    begin
        wait for clk_period/2;
        clk <= not clk;
    end process;

    -- Instantiate hexdisplay
    UUT: hexdisplay
        port map (
            in => count,
            out => seg_out
        );

    -- Counting process
    count_process : process(clk)
    begin
        if rising_edge(clk) then
            if count = "1111" then
                count <= "0000";
            else
                count <= count + 1;
            end if;
        end if;
    end process;

    -- Monitor process to display output
    monitor_process : process
    begin
        wait until rising_edge(clk);
        report "Input: " & std_logic_vector(count) & " Output: " & std_logic_vector(seg_out);
    end process;

end sim;