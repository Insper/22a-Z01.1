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
		SW      : in  std_logic_vector(9 downto 0);
		LEDR    : out std_logic_vector(9 downto 0);
		HEX0	  : out std_logic_vector(6 downto 0);
		HEX1	  : out std_logic_vector(6 downto 0);
		HEX2	  : out std_logic_vector(6 downto 0);
		HEX3	  : out std_logic_vector(6 downto 0);
	);
end entity;

----------------------------
-- Implementacao do bloco --
----------------------------
architecture rtl of TopLevel is

--------------
-- signals
--------------

  signal x : std_logic_vector(15 downto 0) := x"0073"; -- 115
  signal y : std_logic_vector(15 downto 0) := x"005F"; -- 95
  signal zxout, zyout, nxout, nyout, andout, adderout, muxout, precomp : std_logic_vector(15 downto 0);
--------------
-- component
--------------


	

---------------
-- implementacao
---------------
-- SW(0) = ZX , SW(1) = ZY, SW(2) = NX, SW(3) = NY, SW(4) = f, SW(5) = no || 
begin


LEDR(0) <= ng;
LEDR(1) <= zr;

s1 : sevenSeg port map(
	bcd => precomp(3 downto 0),
	leds => HEX(0)
);

s2 : sevenSeg port map(
	bcd => precomp(7 downto 4),
	leds => HEX(1)
);

s3 : sevenSeg port map(
	bcd => precomp(11 downto 8),
	leds => HEX(2)
);

s4 : sevenSeg port map(
	bcd => precomp(15 downto 12),
	leds => HEX(3)
);

end rtl;
