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
		SW      : in  std_logic_vector(9 downto 0);
		KEY     : in  std_logic_vector(3 downto 0);

		LEDR    : out std_logic_vector(9 downto 0);
		HEX0     : out std_logic_vector(6 downto 0); -- 7seg0
		HEX1     : out std_logic_vector(6 downto 0); -- 7seg0
		HEX2     : out std_logic_vector(6 downto 0);
		HEX3     : out std_logic_vector(6 downto 0)

	);
end entity;

----------------------------
-- Implementacao do bloco -- 
----------------------------
architecture rtl of TopLevel is



	component Ram8 is
		port(
			clock:   in  STD_LOGIC;
			input:   in  STD_LOGIC_VECTOR(15 downto 0);
			load:    in  STD_LOGIC;
			address: in  STD_LOGIC_VECTOR( 2 downto 0);
			output:  out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;
	component sevenSeg is
		port(
			bcd :  in  STD_LOGIC_VECTOR(3 downto 0);
			leds :  out STD_LOGIC_VECTOR(6 downto 0)
		);
	end component;

--------------
-- signals
--------------


signal clock: std_logic;
signal saida : std_logic_vector(15 downto 0);
signal x : std_logic_vector(15 downto 0) := x"0073";

---------------
-- implementacao
---------------
begin

Clock <= not KEY(0); -- os botoes quando nao apertado vale 1
                     -- e apertado 0, essa logica inverte isso



u0 : Ram8 port map (
		clock    => Clock,
		input    => x,
		load    => SW(1),
		address(0)   => SW(2),
		address(1)   => SW(3),
		address(2)    => SW(4),
		output   => saida
	);		

hex_4: sevenSeg port map (
		bcd => saida(15 downto 12),
		leds => HEX3
	);
hex_3 : sevenSeg port map (
		bcd => saida(11 downto 8),
		leds => hex2
	);
hex_2 : sevenSeg port map (
		bcd => saida(7 downto 4),
		leds => hex1
	);	

hex_1 : sevenSeg port map (
		bcd => saida(3 downto 0),
		leds => HEX0
	);


 

end rtl;