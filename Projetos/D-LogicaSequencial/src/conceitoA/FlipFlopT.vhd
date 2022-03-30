-- Elementos de Sistemas
-- FlipFlopT.vhd

library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopT is
	port(
		clock:  in std_logic;
		t:      in std_logic;
		q:      inout std_logic:= '0';
		notq:   inout std_logic:= '1'
	);
end entity;

architecture arch of FlipFlopT is

	signal sq : std_logic:= '0';
	signal snotq : std_logic:= '1';

begin

	process(clock, t) begin
		if (falling_edge(clock)) then
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
