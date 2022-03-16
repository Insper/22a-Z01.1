library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4Way16 is
	port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			c:   in  STD_LOGIC_VECTOR(15 downto 0);
			d:   in  STD_LOGIC_VECTOR(15 downto 0);
			sel: in  STD_LOGIC_VECTOR(1 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
end entity;

architecture arch of Mux4Way16 is
begin
	with sel select
		q <= a when "00",
				b when "01",
				c when "10",
				d when others;


end architecture;
