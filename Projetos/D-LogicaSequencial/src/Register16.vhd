-- Elementos de Sistemas
-- by Luciano Soares
-- Register16.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Register16 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(15 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture arch of Register16 is

	component Register8 is
		port(
			clock:   in STD_LOGIC;
			input:   in STD_LOGIC_VECTOR(7 downto 0);
			load:    in STD_LOGIC;
			output: out STD_LOGIC_VECTOR(7 downto 0)
		);
	end component;
	signal input_reg: STD_LOGIC_VECTOR(15 downto 0);
	signal output_reg: STD_LOGIC_VECTOR(15 downto 0);
	signal load_reg: STD_LOGIC;
begin
	b0 : Register8 port map (
		clock => clock,
		input => input_reg(7 downto 0),
		load => load_reg,
		output => output_reg(7 downto 0)
	);
	b1 : Register8 port map (
		clock => clock,
		input => input_reg(15 downto 8),
		load => load_reg,
		output => output_reg(15 downto 8)
	);
	output<=output_reg;
	input_reg<=input;
	load_reg<=load;


end architecture;
