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
			q:      out std_logic:= '0';
			notq:   out std_logic:= '1'
		);
	end component;

signal q0, q1, q2: STD_LOGIC:='0';

begin
FFT1:	FlipFlopT port map(
	clock => clock,
	t => '1',
	q => q0,
	notq => open
);

FFT2:	FlipFlopT port map(
	clock => q0,
	t => '1',
	q => q1,
	notq =>  open
);

FFT3:	FlipFlopT port map(
	clock =>  q1,
	t => '1',
	q => q2,
	notq => open
);
q(0) <= q0;
q(1) <= q1;
q(2) <= q2;

end architecture;
