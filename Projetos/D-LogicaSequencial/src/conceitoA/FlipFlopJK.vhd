-- Elementos de Sistemas
-- FlipFlopJK.vhd

library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopJK is
	port(
		clock:  in std_logic;
		J:      in std_logic;
		K:      in std_logic;
		q:      inout std_logic:= '0';
		notq:   inout std_logic:= '1'
	);
end entity;

architecture arch of FlipFlopJK is

begin

	process(clock, J, K) begin
		if (falling_edge(clock)) then
			if (J = '0' and K = '0') then
				q <= q;
				notq <= notq;
			
			elsif (J = '0' and K = '1') then
				q <= J;
				notq <= K;
			
			elsif (J = '1' and K = '0') then
				q <= J;
				notq <= K;
			
			elsif (J = '1' and K = '1') then
				q <= not(q);
				notq <= not(notq);
			
			end if ;			
		end if;
  end process;

end architecture;
