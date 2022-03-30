-- Elementos de Sistemas
-- by Luciano Soares
-- Register8.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Register8 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(7 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(7 downto 0)
	);
end entity;

architecture arch of Register8 is

	component BinaryDigit is
		port(
			clock:   in STD_LOGIC;
			input:   in STD_LOGIC;
			load:    in STD_LOGIC;
			output: out STD_LOGIC
		);
	end component;

begin
	dmux: DMux8Way port map (
		a => load,
		sel => address(2 downto 0),
		q0 => load0,
		q1 => load1,
		q2 => load2, 
		q3 => load3,
		q4 => load4,
		q5 => load5,
		q6 => load6,
		q7 => load7
		);

		mux: Mux8Way16 port map ( 
		a =>output0,
		b =>output1,
		c =>output2,
		d =>output3,
		e =>output4,
		f =>output5,
		g =>output6,
		h =>output7,
		sel => address(2 downto 0),
		q=>output 
		);


	R16_0 : Register16 port map (
		clock => clock,
		input => input,
		load => load0,
		output => output0	
		);

	R16_1 : Register16 port map (
		clock => clock,
		input => input,
		load => load1,
		output => output1	
		);

	R16_2 : Register16 port map (
		clock => clock,
		input => input,
		load => load2,
		output => output2	
		);

	R16_3 : Register16 port map (
		clock => clock,
		input => input,
		load => load3,
		output => output3	
		);
	
	R16_4 : Register16 port map (
		clock => clock,
		input => input,
		load => load4,
		output => output4	
		);
		
	R16_5 : Register16 port map (
		clock => clock,
		input => input,
		load => load5,
		output => output5	
		);
		
	R16_6 : Register16 port map (
		clock => clock,
		input => input,
		load => load6,
		output => output6	
		);
		
	R16_7 : Register16 port map (
		clock => clock,
		input => input,
		load => load7,
		output => output7	
		);


end architecture;
