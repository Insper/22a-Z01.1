library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DMux2Way is
	port ( 
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC;
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC);
end entity;

architecture rtl of DMux2Way is
begin
q0 <= a when (sel = '0') else '0':
q1 <= a when (sel = '1') else '0';

end architecture;
