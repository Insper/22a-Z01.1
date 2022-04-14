-- Elementos de Sistemas
-- FlipFlopT.vhd

library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopT is
	port(
		clock:  in std_logic;
		t:      in std_logic;
		q:      out std_logic:= '0';
		notq:   out std_logic:= '1'
	);
end entity;

architecture arch of FlipFlopT is
	
	signal outsignal:std_logic:= '0';
	signal notoutsignal:std_logic:= '1';


begin
	process(clock,t) begin
		if (rising_edge(clock)) then
			if (t='1') then
			outsignal<=not outsignal;
			notoutsignal<=not notoutsignal;
			end if;
		end if;
		
	end process;
	q<=outsignal;
	notq<=notoutsignal;
end architecture;
