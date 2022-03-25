library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor16 is
	port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
end entity;

architecture arch of xor16 is
begin

q(0) <= a(0) xor b(0);
q(1) <= a(1) xor b(1);
q(2) <= a(2) xor b(2);
q(3) <= a(3) xor b(3);
q(4) <= a(4) xor b(4);
q(5) <= a(5) xor b(5);
q(6) <= a(6) xor b(6);
q(7) <= a(7) xor b(7);
q(8) <= a(8) xor b(8);
q(9) <= a(9) xor b(9);
q(10) <= a(10) xor b(10);
q(11) <= a(11) xor b(11);
q(12) <= a(12) xor b(12);
q(13) <= a(13) xor b(13);
q(14) <= a(14) xor b(14);
q(15) <= a(15) xor b(15);

end architecture;
