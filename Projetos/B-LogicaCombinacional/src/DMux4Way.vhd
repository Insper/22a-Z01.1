library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DMux4Way is
	port ( 
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(1 downto 0);
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC;
			q2:  out STD_LOGIC;
			q3:  out STD_LOGIC);
end entity;

architecture rtl of DMux4Way is
begin
process(s, a)
begin
case s is
when "00" => q0 <= "0001";
when "01" => q1 <= "0010";
when "10" => q2 <= "0100";
when "11" => q3 <= "1000";
when "others" => 


end architecture;

