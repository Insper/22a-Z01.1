-- Elementos de Sistemas
-- by Luciano Soares
-- Ram4K.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Ram4K is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR(11 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture arch of Ram4K is

	component Ram512 is
		port(
			clock:   in  STD_LOGIC;
			input:   in  STD_LOGIC_VECTOR(15 downto 0);
			load:    in  STD_LOGIC;
			address: in  STD_LOGIC_VECTOR( 8 downto 0);
			output:  out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component Mux8Way16 is
		port (
				a:   in  STD_LOGIC_VECTOR(15 downto 0);
				b:   in  STD_LOGIC_VECTOR(15 downto 0);
				c:   in  STD_LOGIC_VECTOR(15 downto 0);
				d:   in  STD_LOGIC_VECTOR(15 downto 0);
				e:   in  STD_LOGIC_VECTOR(15 downto 0);
				f:   in  STD_LOGIC_VECTOR(15 downto 0);
				g:   in  STD_LOGIC_VECTOR(15 downto 0);
				h:   in  STD_LOGIC_VECTOR(15 downto 0);
				sel: in  STD_LOGIC_VECTOR( 2 downto 0);
				q:   out STD_LOGIC_VECTOR(15 downto 0));
	end component;

	component DMux8Way is
		port (
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(2 downto 0);
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC;
			q2:  out STD_LOGIC;
			q3:  out STD_LOGIC;
			q4:  out STD_LOGIC;
			q5:  out STD_LOGIC;
			q6:  out STD_LOGIC;
			q7:  out STD_LOGIC);
	end component;

	signal load0, load1, load2, load3, load4, load5, load6, load7 : STD_LOGIC;
	signal output0, output1, output2, output3, output4, output5, output6, output7 : STD_LOGIC_VECTOR(15 downto 0);

begin

	demux8way : DMux8Way port map(load, address (11 downto 9), load0, load1, load2, load3, load4, load5, load6, load7);
    ram0 : Ram512 port map(clock, input, load0, address(8 downto 0), output0);
    ram1 : Ram512 port map(clock, input, load1, address(8 downto 0), output1);
    ram2 : Ram512 port map(clock, input, load2, address(8 downto 0), output2);
    ram3 : Ram512 port map(clock, input, load3, address(8 downto 0), output3);
    ram4 : Ram512 port map(clock, input, load4, address(8 downto 0), output4);
    ram5 : Ram512 port map(clock, input, load5, address(8 downto 0), output5);
    ram6 : Ram512 port map(clock, input, load6, address(8 downto 0), output6);
    ram7 : Ram512 port map(clock, input, load7, address(8 downto 0), output7);
    mux8w16 : Mux8Way16 port map(output0, output1, output2, output3, output4, output5, output6, output7, address(11 downto 9), output);
	
end architecture;
