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
	-- if para q0
	q0 <= '0' when (a = '0' AND sel = '0') else
		'0' when (a = '0' AND sel = '1') else
		'0' when (a = '1' AND sel = '1') else
		'1';
	
	-- if para q1
	q1 <= '0' when (a = '0' AND sel = '0') else
		'0' when (a = '1' AND sel = '0') else
		'0' when (a = '0' AND sel = '1') else
		'1';
	

end architecture;