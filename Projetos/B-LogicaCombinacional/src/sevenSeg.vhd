library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevenSeg is
	port (
			bcd : in  STD_LOGIC_VECTOR(3 downto 0);
			leds: out STD_LOGIC_VECTOR(6 downto 0));
end entity;

architecture arch of sevenSeg is
begin

	leds <= "0111111" when bcd = "0000" else
		"0000110" when bcd = "0001" else
		"1011011" when bcd = "0010" else
		"1001111" when bcd = "0011" else
		"1100110" when bcd = "0100" else
		"1101101" when bcd = "0101" else
		"1111101" when bcd = "0110" else
		"0000111" when bcd = "0111" else
		"1111111" when bcd = "1000" else
		"1100111" when bcd = "1001" else "0000000";
		
end architecture;
