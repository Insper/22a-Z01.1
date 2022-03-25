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
		HEX3	  : out std_logic_vector(6 downto 0)
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
  signal precomp : std_logic_vector(15 downto 0);

--------------
-- component
--------------
	component ALU is port(
		  x, y  : in std_logic_vector(15 downto 0); -- entradas de dados da ALU
        zx    : in std_logic; -- zera a entrada x
        nx    : in std_logic; -- inverte a entrada x
        zy    : in std_logic; -- zera a entrada y
        ny    : in std_logic; -- inverte a entrada y
        f     : in std_logic; -- se 0 calcula x & y, senão x + y
        no    : in std_logic; -- inverte o valor da saída
        zr    : out std_logic; -- setado se saída igual a zero
        ng    : out std_logic; -- setado se saída é negativa
        saida : out std_logic_vector(15 downto 0) -- saída de dados da ALU
    );
	 end component;

	 component sevenSeg is	
	 port (
			bcd : in  STD_LOGIC_VECTOR(3 downto 0);
			leds: out STD_LOGIC_VECTOR(6 downto 0)
			);
			
	end component;
	

---------------
-- implementacao
---------------
-- SW(0) = ZX , SW(1) = ZY, SW(2) = NX, SW(3) = NY, SW(4) = f, SW(5) = no || 
begin

	u1 : ALU port map(
	x => x,
	y => y,
	zx => SW(0),
	zy => SW(1),
	nx => SW(2),
	ny => SW(3),
	f => SW(4),
	no => SW(5),
	zr => LEDR(0),
	ng => LEDR(1),
	saida => precomp

	);
	
		s1 : sevenSeg port map(
		bcd => precomp(3 downto 0),
		leds => HEX0
	);

	s2 : sevenSeg port map(
		bcd => precomp(7 downto 4),
		leds => HEX1
	);

	s3 : sevenSeg port map(
		bcd => precomp(11 downto 8),
		leds => HEX2
	);

	s4 : sevenSeg port map(
		bcd => precomp(15 downto 12),
		leds => HEX3
	);



end architecture;
