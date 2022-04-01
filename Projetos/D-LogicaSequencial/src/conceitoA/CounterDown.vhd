-- Elementos de Sistemas
-- CounterDown.vhd

library ieee;
use ieee.std_logic_1164.all;

entity CounterDown is
	port(
		clock:  in std_logic;
		q:      out std_logic_vector(2 downto 0) :=(others => '0')
	);
end entity;

architecture arch of CounterDown is

component FlipFlopT is
	port(
		clock:  in std_logic;
		t:      in std_logic;
		q:      inout std_logic:= '0';
		notq:   inout std_logic:= '1'
	);
end component;

	signal sq : std_logic_vector(2 downto 0);

begin

	flip0 : FlipFlopT port map(clock => clock, t => '1', q => sq(0), notq => Open);
	flip1 : FlipFlopT port map(clock => sq(0), t => '1', q => sq(1), notq => Open);
	flip2 : FlipFlopT port map(clock => sq(1), t => '1', q => sq(2), notq => Open);

	q <= sq;
end architecture;
