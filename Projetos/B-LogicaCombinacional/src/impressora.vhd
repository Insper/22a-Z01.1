library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity impressora is
	port (
    SW1,SW2,SW3,SW4 : in  STD_LOGIC;
    x : out STD_LOGIC );
end entity;

architecture arch of impressora is

begin
    x <= ((NOT SW1) AND (NOT SW2)) OR ((NOT SW1) AND (NOT SW3)) OR ((NOT SW3) AND (NOT SW4)) OR ((NOT SW2) AND (NOT SW3)) OR ((NOT SW2) AND (NOT SW4));
    
end architecture;
