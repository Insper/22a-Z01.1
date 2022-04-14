-- Elementos de Sistemas
-- FlipFlopT.vhd

library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopT is
	port(
		clock:  in std_logic;
		t:      in std_logic;
		q:      buffer std_logic:= '0';
		notq:   buffer std_logic:= '1'
	);
end entity;

architecture arch of FlipFlopT is


begin

	process(clock) begin
		if (rising_edge(CLOCK)) then
			if (t = '0') then
				q <= q;
				notq <= notq;
			elsif (t = '1') then
				q <= not(q);
				notq <= not(notq);
			end if;
		end if;
  end process;
end architecture;