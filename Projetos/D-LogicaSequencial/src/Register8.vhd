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
	signal input_reg: STD_LOGIC_VECTOR(7 downto 0);
	signal output_reg: STD_LOGIC_VECTOR(7 downto 0);
	signal load_reg: STD_LOGIC;
begin
	b0: BinaryDigit port map (
		clock => clock,
		input => input_reg(0),
		load => load_reg,
		output => output_reg(0)
	);
	b1: BinaryDigit port map (
		clock => clock,
		input => input_reg(1),
		load => load_reg,
		output => output_reg(1)
	);
	b2: BinaryDigit port map (
		clock => clock,
		input => input_reg(2),
		load => load_reg,
		output => output_reg(2)
	);
	b3: BinaryDigit port map (
		clock => clock,
		input => input_reg(3),
		load => load_reg,
		output => output_reg(3)
	);
	b4: BinaryDigit port map (
		clock => clock,
		input => input_reg(4),
		load => load_reg,
		output => output_reg(4)
	);
	b5: BinaryDigit port map (
		clock => clock,
		input => input_reg(5),
		load => load_reg,
		output => output_reg(5)
	);
	b6: BinaryDigit port map (
		clock => clock,
		input => input_reg(6),
		load => load_reg,
		output => output_reg(6)
	);
	b7: BinaryDigit port map (
		clock => clock,
		input => input_reg(7),
		load => load_reg,
		output => output_reg(7)
	);
	input_reg <= input;
	load_reg <= load;	
	output <= output_reg;


end architecture;
