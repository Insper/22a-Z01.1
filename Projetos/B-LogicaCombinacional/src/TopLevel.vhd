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
		SW       : in  std_logic_vector(9 downto 0);
        HEX0     : out std_logic_vector(6 downto 0); -- 7seg0
        HEX1     : out std_logic_vector(6 downto 0); -- 7seg0
        HEX2     : out std_logic_vector(6 downto 0); -- 7seg0
		LEDR     : out std_logic_vector(9 downto 0)
	);
end entity;

----------------------------
-- Implementacao do bloco --
----------------------------
architecture rtl of TopLevel is

--------------
-- signals
--------------
signal bcd_0 : std_logic_vector(3 downto 0);
signal bcd_1 : std_logic_vector(3 downto 0);
signal bcd_2 : std_logic_vector(3 downto 0);

component sevenSeg is
	port (
			bcd : in  STD_LOGIC_VECTOR(3 downto 0);
			leds: out STD_LOGIC_VECTOR(6 downto 0));
end component;

---------------
-- implementacao
---------------
begin

	sai1: sevenSeg port map(
		bcd => SW(3 downto 0),  
		leds => HEX0  
		
	);
	
	saida2: sevenSeg port map(
			bcd => SW(7 downto 4),  
			leds => HEX1  
		);
		
	saida3: sevenSeg port map(
			bcd => "00" & SW(9 downto 8),  
			leds => HEX2  
		);

end rtl;
