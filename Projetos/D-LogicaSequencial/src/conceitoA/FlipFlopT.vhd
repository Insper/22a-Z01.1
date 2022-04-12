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

signal q_internal: std_logic:= '0';
signal notq_internal: std_logic:= '1';

begin
	process(clock, t) begin
		if rising_edge(clock) then
			if (t = '0') then
				q <= '0';
				notq <= '1';
			elsif (t = '1') then
				q <= '1';
				notq <= '0';
			end if;
		end if;
	end process;
end architecture;
