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
      	HEX2     : out std_logic_vector(6 downto 0); -- 7seg0
		HEX3     : out std_logic_vector(6 downto 0)
		);

end entity;

----------------------------
-- Implementacao do bloco -- 
----------------------------
architecture rtl of TopLevel is

component PC is
    port(
        clock     : in  STD_LOGIC;
        increment : in  STD_LOGIC;
        load      : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        input     : in  STD_LOGIC_VECTOR(15 downto 0);
        output    : out STD_LOGIC_VECTOR(15 downto 0)
    );
end component;

component sevenSeg is
	port (
			bcd : in  STD_LOGIC_VECTOR(3 downto 0);
			leds: out STD_LOGIC_VECTOR(6 downto 0));

end component;

--------------
-- signals
--------------

signal clock, increment, reset : std_logic;
signal entrada, saida  : STD_LOGIC_VECTOR(15 downto 0);

---------------
-- implementacao
---------------
begin

clock <= KEY(0); -- os botoes quando nao apertado vale 1
                     -- e apertado 0, essa logica inverte isso

entrada <= "0000000000000010";


u1: PC port map(
	clock => clock,
	increment => SW(2),
	load => Sw(0),
	reset => SW(1),
	input => entrada,
	output => saida
	);
	
	sai1: sevenSeg port map(
		bcd => saida(3 downto 0),  
		leds => HEX0  
	);
	sai2: sevenSeg port map(
		bcd => saida(7 downto 4),  
		leds => HEX1  
	);
	sai3: sevenSeg port map(
		bcd => saida(11 downto 8),  
		leds => HEX2  
	);
	sai4: sevenSeg port map(
		bcd => saida(15 downto 12),  
		leds => HEX3  
	);

end rtl;
