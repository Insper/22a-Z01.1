library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevenSeg is
	port (
			bcd : in  STD_LOGIC_VECTOR(3 downto 0);
			leds: out STD_LOGIC_VECTOR(6 downto 0));
end entity;

architecture arch of sevenSeg is
signal led: STD_LOGIC_VECTOR(6 downto 0);
begin
	with bcd select

		led <= "0111111" when "0000",
				"0000110" when "0001",
				"0000110" when "0010",
				"1001111" when "0011",
				"1100110" when "0100",
				"1101101" when "0101",
				"1111101" when "0110",
				"0000111" when "0111",
				"1111111" when "1000",
				"1101111" when "1001",
				"1110111" when "1010",
				"1111100" when "1011",
				"0111001" when "1100",
				"1011110" when "1101",
				"1111001" when "1110",
				"1110001" when others;
		leds <= not led;
				
end architecture;
