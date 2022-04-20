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
			clock: in std_logic;
			t:    in std_logic;
			q: out std_logic;
			notq: out std_logic
		);
	end component;

	signal not_q: std_logic_vector(2 downto 0);
	signal a_q: std_logic_vector(2 downto 0);
begin


s1: FlipFlopT port map(
	clock => clock,
	t => '1',
	q => a_q(0),
	notq => not_q(0)
);


s2: FlipFlopT port map(
	clock => a_q(0),
	t => '1',
	q => a_q(1),
	notq => not_q(1)
);

s3: FlipFlopT port map(
	clock => a_q(1),
	t => '1',
	q => a_q(2),
	notq => not_q(2)
);
q<= a_q;




end architecture;
