-- Elementos de Sistemas
-- FlipFlopJK.vhd

library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopJK is
	port(
		clock:  in std_logic;
		J:      in std_logic;
		K:      in std_logic;
		q:      buffer std_logic:= '0';
		notq:   buffer std_logic:= '1'
	);
end entity;

architecture arch of FlipFlopJK is

begin

	process (clock) begin
		if (rising_edge(clock) and J = '0' and K ='0') then
			q <= q;
			notq <= notq;
		elsif (rising_edge(clock) and J = '0' and K ='1') then
			q <= '0';
			notq <= '1';
		elsif (rising_edge(clock) and J = '1' and K ='0') then	
			q <= '1';
			notq <= '0';
		elsif (rising_edge(clock) and J = '1' and K ='1') then	
			q <= notq;
			notq <= q;
		end if;
	end process;

end architecture;
