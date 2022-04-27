-- Elementos de Sistemas
-- FlipFlopJK.vhd

library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopJK is
	port(
		clock:  in std_logic;
		J:      in std_logic;
		K:      in std_logic;
		q:      out std_logic:= '0';
		notq:   out std_logic:= '1'
	);
end entity;

architecture arch of FlipFlopJK is

signal entrada : STD_LOGIC_VECTOR(1 downto 0);
signal entradaq : std_logic:='0';

begin
  
	entrada<= J & K;

	process (clock) begin
		if (rising_edge(CLOCK)) then 
			
			if entrada="01" then

				entradaq<='0';

			elsif entrada="10" then

				entradaq<='1';

			elsif entrada = "11" then

				entradaq<= not entradaq;

			end if;
		end if;

	end process;

	q<= entradaq;
	notq<= not entradaq;

end architecture;
