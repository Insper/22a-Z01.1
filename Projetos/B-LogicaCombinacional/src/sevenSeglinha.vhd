library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevenSeglinha is
	port (
			bcdlinha : in  STD_LOGIC_VECTOR(1 downto 0);
			ledslinha: out STD_LOGIC_VECTOR(6 downto 0));
end entity;

architecture arch of sevenSeglinha is
begin
	with bcdlinha select
		ledslinha<="1000000" when "00", -- 0
				"1111001" when "01", -- 1 
				"0100100" when "10", -- 2
				"0110000" when "11", -- 3
				"1111111" when others; -- Nada caso seja nada :)
end architecture;