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

signal q_linha, q_barrado_linha: std_logic;

begin

	q <= q_linha;
	notq <= q_barrado_linha;

	process (clock) begin
		if (rising_edge(clock) and J = '0' and K ='0') then
			q <= q_linha;
			notq <= q_barrado_linha;
		elsif (rising_edge(clock) and J = '0' and K ='1') then
			q <= '0';
			notq <= '1';
		elsif (rising_edge(clock) and J = '1' and K ='0') then	
			q <= '1';
			notq <= '0';
		elsif (rising_edge(clock) and J = '1' and K ='1') then	
			q <= q_barrado_linha;
			notq <= q_linha;
		end if;
	end process;
end architecture;
