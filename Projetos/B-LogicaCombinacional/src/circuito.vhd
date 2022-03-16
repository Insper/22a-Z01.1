library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity circuito is
	port (
    A,B,C : in  STD_LOGIC;
    x     : out STD_LOGIC);
end entity;

architecture arch of circuito is

begin

	x <= B and A and not( not(A) or (B and C));

end architecture;
