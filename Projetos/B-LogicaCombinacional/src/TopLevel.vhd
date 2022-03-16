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
		CLOCK_50 : in  std_logic;
		SW       : in  std_logic_vector(3 downto 0);
		HEX0     : out std_logic_vector(6 downto 0)
);
end entity;

----------------------------
-- Implementacao do bloco --
----------------------------
architecture rtl of TopLevel is
	
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
		bcd => SW,
		leds => HEX0
);

end rtl;

