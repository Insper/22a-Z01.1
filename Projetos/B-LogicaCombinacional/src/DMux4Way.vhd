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
		process(a,sel)
		begin
		case sel is 
			when "00" => q0 <= a; q1 <= '0'; q2 <= '0'; q3 <= '0';
			when "01" => q1 <= a; q0 <= '0'; q2 <= '0'; q3 <= '0';
			when "10" => q2 <= a; q0 <= '0'; q1 <= '0'; q3 <= '0';
			when others => q3 <= a; q0 <= '0'; q1 <= '0'; q2 <= '0';
		end case;
		end process;
end architecture;

