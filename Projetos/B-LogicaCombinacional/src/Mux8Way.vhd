library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux8Way is
	port ( 
			a:   in  STD_LOGIC;
			b:   in  STD_LOGIC;
			c:   in  STD_LOGIC;
			d:   in  STD_LOGIC;
			e:   in  STD_LOGIC;
			f:   in  STD_LOGIC;
			g:   in  STD_LOGIC;
			h:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(2 downto 0);
			q:   out STD_LOGIC);
end entity;

architecture arch of Mux8Way is
begin
	process (a,b,c,d,e,f,g,h,sel)
		begin
			case sel is

				when "000" => q<= a;
				when "001" => q<= b;
				when "010" => q<= c;
				when "011" => q<= d;
				when "100" => q<= e;
				when "101" => q<= f;
				when "110" => q<= g;
				when "111" => q<= h;
				when others => q<= '0';
			end case;
	end process;

end architecture;
