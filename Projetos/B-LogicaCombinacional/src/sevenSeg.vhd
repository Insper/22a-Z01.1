library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevenSeg is
	port (
			bcd : in  STD_LOGIC_VECTOR(3 downto 0);
			leds: out STD_LOGIC_VECTOR(6 downto 0));
end entity;

architecture arch of sevenSeg is
begin

	leds <= "1000000" when bcd = "0000" else -- 0
	"1111001" when bcd = "0001" else -- 1 
	"0100100" when bcd = "0010" else -- 2
	"0110000" when bcd = "0011" else -- 3
	"0011001" when bcd = "0100" else --4
	"0010010" when bcd = "0101" else --5
	"0000010" when bcd = "0110" else -- 6
	"1111000" when bcd = "0111" else --7
	"0000000" when bcd = "1000" else --8
	"0010000" when bcd = "1001" else --9
	"0001000" when bcd ="1010" else -- A (10)
	"0000011" when bcd ="1011" else -- B (11)
	"1000110" when bcd ="1100" else -- C (12)
	"0100001" when bcd ="1101" else -- D (13)
	"0000110" when bcd ="1110" else -- E (14)
	"0001110" when bcd ="1111";-- F (15)
	

		

end architecture;