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

----------------------------
-- Entrada e saidas do bloco
----------------------------
entity TopLevel is
	port(
		CLOCK_50 : in  std_logic;
		SW       : in  std_logic_vector(9 downto 0);
		HEX0     : out std_logic_vector(6 downto 0);
		HEX1     : out std_logic_vector(6 downto 0);
		HEX2     : out std_logic_vector(6 downto 0);
		HEX3     : out std_logic_vector(6 downto 0);
		-- HEX5     : out std_logic_vector(6 downto 0);
		LEDR    : out std_logic_vector(9 downto 0) -- definindo os leds para ligar zr e 
);
end entity;

----------------------------
-- Implementacao do bloco --
---------------------------

architecture rtl of TopLevel is

--------------
-- component
--------------

--- IMPORTAR A ULA

	component ALUb is
		port(
			x,y:   in STD_LOGIC_VECTOR(15 downto 0); -- entradas de dados da ALU
			zx:    in STD_LOGIC;                     -- zera a entrada x
			nx:    in STD_LOGIC;                     -- inverte a entrada x
			zy:    in STD_LOGIC;                     -- zera a entrada y
			ny:    in STD_LOGIC;                     -- inverte a entrada y
			f:     in STD_LOGIC_VECTOR(1 downto 0);  -- se 0 calcula x & y, se 1 x + y se nãp x xor y
			no:    in STD_LOGIC;                     -- inverte o valor da saída
			zr:    out STD_LOGIC;                    -- setado se saída igual a zero
			ng:    out STD_LOGIC;                    -- setado se saída é negativa
			saida: out STD_LOGIC_VECTOR(15 downto 0) -- saída de dados da ALU
		);
	end component;

	component sevenSeg is
		port (
			bcd : in  STD_LOGIC_VECTOR(3 downto 0);
			leds : out STD_LOGIC_VECTOR(6 downto 0));
	end component;


--------------
-- signals
--------------
signal entrada0,entrada1,aluout : std_logic_vector(15 downto 0);
---------------
-- implementacao
---------------

-----------------

-- !5555(16) = AAAA (16)
-- !FF(16) = ff00 (16)
-- -FF(16) = ff01 (16)
-- -5555(16) = AAAB
-- 5555(16) + 1(16) = 5556 (16)
-- FF(16) + 1(16) = 100 (16)
-- FF - 1 = fe (16)
-- 5555(16) + FF(16) = 5654 (16)
-- FF(16) - 5555(16) = ABAA (16)
-- 0101010101010101 AND 0000000011111111 == 55 (16)
-- 5555(16) OR FF(16) = 55FF
-- 0101010101010101 XOR 0000000011111111 == 55AA (16)



----------------

begin
	entrada0 <= "0101010101010101"; -- 5555 (16)
	entrada1 <= "0000000011111111"; -- FF (16)
	alu : ALUb port map(
		x => entrada0,
		y => entrada1,
		zx => SW(0),
		nx => SW(1),
		zy => SW(2),
		ny => SW(3),
		f  => SW(5 downto 4),
		no => SW(6),
		zr => LEDR(0),
		ng => LEDR(1),
		saida => aluout
	);

	u1 : sevenSeg port map(
	bcd => aluout(3 downto 0),
	leds => HEX0 -- LIGAR A SAIDA DA ULA
	);
	
	u2 : sevenSeg port map(
	bcd => aluout(7 downto 4),
	leds => HEX1 -- LIGAR A SAIDA DA ULA
	);

	u3 : sevenSeg port map(
		bcd => aluout(11 downto 8),
		leds => HEX2 -- LIGAR A SAIDA DA ULA
	);

	u4 : sevenSeg port map(
	bcd => aluout(15 downto 12),
	leds => HEX3 -- LIGAR A SAIDA DA ULA
	);

	-- u5 : sevenSeg port map(
	-- bcd => aluout(15 downto 12),
	-- leds => HEX5 -- LIGAR A SAIDA DA ULA
	-- );

end rtl;