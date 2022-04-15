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

signal saida_q: STD_LOGIC:= '0';
signal saida_notq: STD_LOGIC:= '1';

begin

	process(clock) begin
		if (t='1') then
			if (rising_edge(clock)) then
				saida_q <= not saida_q;
				saida_notq <= not saida_notq;
			end if;
		end if;
  	end process;
q <= saida_q;
notq <= saida_notq;

end architecture;
