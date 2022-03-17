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

---------------
-- implementacao
---------------
begin

	HEX0 <= "1000000" when SW(3 downto 0) = "0000" else	
		"1111001" when SW(3 downto 0) = "0001" else
		"0100100" when SW(3 downto 0) = "0010" else
		"0110000" when SW(3 downto 0) = "0011" else
		"0011001" when SW(3 downto 0) = "0100" else
		"0010010" when SW(3 downto 0) = "0101" else
		"0000010" when SW(3 downto 0) = "0110" else
		"1111000" when SW(3 downto 0) = "0111" else
		"0000000" when SW(3 downto 0) = "1000" else
		"0011000" when SW(3 downto 0) = "1001" else
		"0001000" when SW(3 downto 0) = "1010" else
		"0000011" when SW(3 downto 0) = "1011" else
		"1000110" when SW(3 downto 0) = "1100" else
		"0100001" when SW(3 downto 0) = "1101" else
		"0000110" when SW(3 downto 0) = "1110" else
		"0001110" when SW(3 downto 0) = "1111";
		
	HEX1 <= "1000000" when SW(7 downto 4) = "0000" else	
		"1111001" when SW(7 downto 4) = "0001" else
		"0100100" when SW(7 downto 4) = "0010" else
		"0110000" when SW(7 downto 4) = "0011" else
		"0011001" when SW(7 downto 4) = "0100" else
		"0010010" when SW(7 downto 4) = "0101" else
		"0000010" when SW(7 downto 4) = "0110" else
		"1111000" when SW(7 downto 4) = "0111" else
		"0000000" when SW(7 downto 4) = "1000" else
		"0011000" when SW(7 downto 4) = "1001" else
		"0001000" when SW(7 downto 4) = "1010" else
		"0000011" when SW(7 downto 4) = "1011" else
		"1000110" when SW(7 downto 4) = "1100" else
		"0100001" when SW(7 downto 4) = "1101" else
		"0000110" when SW(7 downto 4) = "1110" else
		"0001110" when SW(7 downto 4) = "1111";
	
	HEX2 <= "1000000" when SW(9 downto 8) = "00" else	
		"1111001" when SW(9 downto 8) = "01" else
		"0100100" when SW(9 downto 8) = "10" else
		"0110000" when SW(9 downto 8) = "11";

end rtl;
