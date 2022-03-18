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
entity ConceitoA is
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
architecture rtl of ConceitoA is

--------------
-- signals
--------------
signal bcd_0 : std_logic_vector(3 downto 0);
signal bcd_1 : std_logic_vector(3 downto 0);
signal bcd_2 : std_logic_vector(3 downto 0);

component binarioToBcd is
generic (N : integer);
  port (
        clk, reset: in std_logic;
        binary_in: in std_logic_vector(N-1 downto 0);
        bcd0, bcd1, bcd2, bcd3, bcd4: out std_logic_vector(3 downto 0)
    );
end component;

component sevenSeg is
	port (
			bcd : in  STD_LOGIC_VECTOR(3 downto 0);
			leds: out STD_LOGIC_VECTOR(6 downto 0));
end component;

---------------
-- implementacao
---------------
begin

	saida1: sevenSeg port map(
		bcd => bcd_0,  
		leds => HEX0  
	);
	
saida2: sevenSeg port map(
		bcd => bcd_1,  
		leds => HEX1  
	);
	
saida3: sevenSeg port map(
		bcd => bcd_2,  
		leds => HEX2  
	);

bintobcd: binarioToBcd generic map(N => 10) port map(
		clk => CLOCK_50, 
		reset=> '0',
		binary_in => SW,
		bcd0 => bcd_0,
		bcd1 => bcd_1,
		bcd2 => bcd_2,
		bcd3 => open,
		bcd4 => open
	);

end rtl;
