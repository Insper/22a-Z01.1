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
		HEX3     : out std_logic_vector(6 downto 0)
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

	component ALU is
		port(
			x,y:   in STD_LOGIC_VECTOR(15 downto 0); -- entradas de dados da ALU
			zx:    in STD_LOGIC;                     -- zera a entrada x
			nx:    in STD_LOGIC;                     -- inverte a entrada x
			zy:    in STD_LOGIC;                     -- zera a entrada y
			ny:    in STD_LOGIC;                     -- inverte a entrada y
			f:     in STD_LOGIC;                     -- se 0 calcula x & y, senão x + y
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

---------------
-- implementacao
---------------
begin

	u1 : sevenSeg port map(
	bcd => SW(3 downto 0),
	leds => HEX0 -- LIGAR A SAIDA DA ULA
	);
	
	u2 : sevenSeg port map(
	bcd => SW(7 downto 4),
	leds => HEX1
	);

	u3 : sevenSeg port map(
	bcd => SW(7 downto 4),
	leds => HEX2
	);

	u4 : sevenSeg port map(
	bcd => SW(7 downto 4),
	leds => HEX3
	);

end rtl;
