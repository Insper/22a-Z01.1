--
-- Elementos de Sistemas - Aula 5 - Logica Combinacional
-- Rafael . Corsi @ insper . edu . br 
--
-- Arquivo exemplo para acionar os LEDs e ler os bottoes
-- da placa DE0-CV utilizada no curso de elementos de 
-- sistemas do 3s da eng. da computacao

----------------------------
-- Bibliotecas ieee       --
----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

----------------------------
-- Entrada e saidas do bloco
----------------------------
entity TopLevel is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(7 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(7 downto 0)
	);
end entity;

----------------------------
-- Implementacao do bloco -- 
----------------------------
architecture rtl of TopLevel is


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

---------------
-- implementacao
---------------
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


end rtl;
