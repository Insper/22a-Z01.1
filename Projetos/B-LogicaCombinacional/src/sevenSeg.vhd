library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevenSeg is
	port (
			bcd : in  STD_LOGIC_VECTOR(3 downto 0);
			leds: out STD_LOGIC_VECTOR(6 downto 0));
end entity;

architecture arch of sevenSeg is
begin
	leds <= "1000000" when bcd = "0000" else	
		"1111001" when bcd = "0001" else
		"0101000" when bcd = "0010" else
		"0110000" when bcd = "0011" else
		"0011001" when bcd = "0100" else
		"0010010" when bcd = "0101" else
		"0000010" when bcd = "0110" else
		"1111000" when bcd = "0111" else
		"0000000" when bcd = "1000" else
		"0011000" when bcd = "1001" else
		"0001000" when bcd = "1010" else
		"0000011" when bcd = "1011" else
		"1000110" when bcd = "1100" else
		"0100001" when bcd = "1101" else
		"0000110" when bcd = "1110" else
		"0001110" when bcd = "1111";
end architecture;
