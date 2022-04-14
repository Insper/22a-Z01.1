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

signal out0:std_logic:='0';
signal out1:std_logic:='0';


	component FlipFlopT is
		port(
			clock:  in std_logic;
			t:      in std_logic;
			q:      out std_logic:= '0';
			notq:   out std_logic:= '1'
		);
	end component;
	
begin

	q(0)<=out0;
	q(1)<=out1;
	
	fft1: FlipFlopT port map (
		clock=>clock,
		t=>'1',
		q=>out0
	);

	fft2: FlipFlopT port map (
		clock=>out0,
		t=>'1',
		q=>out1
	);

	fft3: FlipFlopT port map (
		clock=>out1,
		t=>'1',
		q=>q(2)
	);

end architecture;
