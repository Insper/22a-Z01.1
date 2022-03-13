library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Or8Way is
	port (
			a:   in  STD_LOGIC;
			b:   in  STD_LOGIC;
			c:   in  STD_LOGIC;
			d:   in  STD_LOGIC;
			e:   in  STD_LOGIC;
			f:   in  STD_LOGIC;
			g:   in  STD_LOGIC;
			h:   in  STD_LOGIC;
			q:   out STD_LOGIC);
end entity;

architecture arch of Or8Way is
	when a = '1' or b = '1' or c = '1' or d = '1' or e = '1' or f = '1' or g = '1' or h = '1'
		then q <= '1';
	when others
		then q <= '0';
begin


end architecture;
