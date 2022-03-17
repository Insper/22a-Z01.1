library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DMux8Way is
	port ( 
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(2 downto 0);
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC;
			q2:  out STD_LOGIC;
			q3:  out STD_LOGIC;
			q4:  out STD_LOGIC;
			q5:  out STD_LOGIC;
			q6:  out STD_LOGIC;
			q7:  out STD_LOGIC);
end entity;

architecture arch of DMux8Way is
begin

	q0 <= a when sel = "000" else '0';
	q1 <= a when sel = "001" else '0';
	q2 <= a when sel = "010" else '0';
	q3 <= a when sel = "011" else '0';
	q4 <= a when sel = "100" else '0';
	q5 <= a when sel = "101" else '0';
	q6 <= a when sel = "110" else '0';
	q7 <= a when sel = "111" else '0';

end architecture;
