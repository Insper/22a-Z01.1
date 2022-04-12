-- Elementos de Sistemas
-- by Luciano Soares
-- Ram8.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Ram8 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR(2 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture arch of Ram8 is

	component Register16 is
		port(
			clock:   in  STD_LOGIC;
			input:   in  STD_LOGIC_VECTOR(15 downto 0);
			load:    in  STD_LOGIC;
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
				sel: in  STD_LOGIC_VECTOR(2 downto 0);
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
			q7:  out STD_LOGIC
		);
	end component;

	signal load0, load1, load2, load3, load4, load5, load6, load7 : STD_LOGIC;
	signal output0, output1, output2, output3, output4, output5, output6, output7 : STD_LOGIC_VECTOR(15 downto 0);

begin

	dMuxPm: DMux8Way port map(
		load,
		address,
		load0,
		load1,
		load2,
		load3,
		load4,
		load5,
		load6,
		load7
	);

	reg0Pm: Register16 port map(
		clock,
		input,
		load0,
		output0
	);

	reg1Pm: Register16 port map(
		clock,
		input,
		load1,
		output1
	);

	reg2Pm: Register16 port map(
		clock,
		input,
		load2,
		output2
	);

	reg3Pm: Register16 port map(
		clock,
		input,
		load3,
		output3
	);

	reg4Pm: Register16 port map(
		clock,
		input,
		load4,
		output4
	);

	reg5Pm: Register16 port map(
		clock,
		input,
		load5,
		output5
	);

	reg6Pm: Register16 port map(
		clock,
		input,
		load6,
		output6
	);

	reg7Pm: Register16 port map(
		clock,
		input,
		load7,
		output7
	);

	mux8Pm: Mux8Way16 port map(
		output0,
		output1,
		output2,
		output3,
		output4,
		output5,
		output6,
		output7,
		address,
		output
	);


end architecture;
