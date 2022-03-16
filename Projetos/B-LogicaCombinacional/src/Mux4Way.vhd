library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4Way is
	port ( 
			a:   in  STD_LOGIC;
			b:   in  STD_LOGIC;
			c:   in  STD_LOGIC;
			d:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(1 downto 0);
			q:   out STD_LOGIC);
end entity;

architecture arch of Mux4Way is
begin
	process (a,b,c,d,sel)
	begin
		case sel is
			when "00" => q <= a ;
			when "01" => q <= b ;
			when "10" => q <= c ;
			when "11" => q <= d ;
			when others => q <= '0' ;
		end case;
	end process;

end architecture;
