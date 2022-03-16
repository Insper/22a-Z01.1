library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity impressora is
	port (
    SW1,SW2,SW3,SW4 : in  STD_LOGIC;
    x : out STD_LOGIC );
end entity;

architecture arch of impressora is

begin

x <= '1' when (not SW1 = '1' AND not SW2 = '1') else 
     '1' when (not SW2 = '1' AND not SW3 = '1') else 
     '1' when (not SW1 = '1' AND not SW3 = '1') else 
     '1' when (not SW2 = '1' AND not SW4 = '1') else 
     '1' when (not SW3 = '1' AND not SW4 = '1') else 
     '0';                                    -- enable desativado


end architecture;
