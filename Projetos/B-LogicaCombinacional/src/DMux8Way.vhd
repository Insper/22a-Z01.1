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
process (sel, a)
begin
case sel is
	when "000" => y <= "00000001";
	when "001" => y <= "00000010";
	when "010" => y <= "00000100";
	when "011" => y <= "00001000";
	when "100" => y <= "00010000";
	when "101" => y <= "00100000";
	when "110" => y <= "01000000";
	when "111" => y <= "10000000";
	when "others" => y <= xxxxxxxx;

end case;
