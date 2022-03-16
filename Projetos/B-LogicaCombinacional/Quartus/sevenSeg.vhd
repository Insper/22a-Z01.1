library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevenSeg is
	port (
			bcd : in  STD_LOGIC_VECTOR(3 downto 0);
			leds: out STD_LOGIC_VECTOR(6 downto 0));
end entity;

architecture arch of sevenSeg is
begin
	with bcd (3 downto 0) select
	leds <= "1111001" when "0001", 
			"0100100" when "0010", 
			"0110000" when "0011", 
			"0011001" when "0100", 
			"0010010" when "0101", 
			"0000010" when "0110", 
			"1111000" when "0111", 
			"0000000" when "1000", 
			"0010000" when "1001", 
			"0001000" when "1010",
			"0000011" when "1011",
			"1000110" when "1100",
			"0100001" when "1101",
			"0000110" when "1110",
			"0001110" when "1111",
			"1000000" when others;
end architecture;
