-- Elementos de Sistemas
-- FlipFlopT.vhd

library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopT is
	port(
		clock:  in std_logic;
		t:      in std_logic;
		q:      buffer std_logic:= '0';
		notq:   out std_logic:= '1'
	);
end entity;

architecture arch of FlipFlopT is
	signal saida: std_logic;
begin
	process(clock ) begin
        if (rising_edge(clock)) then
            if (not(t) = '1') then
                q <= q;
            elsif (t ='1')then
                q<=not(q);
            end if;
        end if;
notq <= not(q);
end process;
end architecture;
