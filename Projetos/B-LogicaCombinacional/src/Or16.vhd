library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Or16 is
	port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
end entity;

architecture arch of Or16 is
begin
q(0) <= a(0) or b(0);
q(1) <= a(1) or b(1);
q(2) <= a(2) or b(2);
q(3) <= a(3) or b(3);
q(4) <= a(4) or b(4);
q(5) <= a(5) or b(5);
q(6) <= a(6) or b(6);
q(7) <= a(7) or b(7);
q(8) <= a(8) or b(8);
q(9) <= a(9) or b(9);
q(10) <= a(10) or b(10);
q(11) <= a(11) or b(11);
q(12) <= a(12) or b(12);
q(13) <= a(13) or b(13);
q(14) <= a(14) or b(14);
q(15) <= a(15) or b(15);
end architecture;
