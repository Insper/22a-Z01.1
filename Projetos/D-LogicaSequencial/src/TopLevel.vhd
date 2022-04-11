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
		input:   in STD_LOGIC_VECTOR(15 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

----------------------------
-- Implementacao do bloco -- 
----------------------------
architecture rtl of TopLevel is


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

---------------
-- implementacao
---------------
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

end rtl;
