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

signal q_conection, notq_conection : std_logic;

begin

	process(clock) begin
		if (rising_edge(CLOCK)) then
			if (t = '0') then
				q_conection <= q_conection;
				notq_conection <= notq_conection;
			elsif (t = '1') then
				q_conection <= not(q_conection);
				notq_conection <= not(notq_conection);
			end if;
		end if;
	end process;
	q <= q_conection;
	notq <= notq_conection;

end architecture;
