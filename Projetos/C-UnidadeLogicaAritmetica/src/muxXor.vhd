library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity muxXor is
	port ( 
        a:   in  STD_LOGIC_VECTOR(15 downto 0);
        b:   in  STD_LOGIC_VECTOR(15 downto 0);
        c:   in  STD_LOGIC_VECTOR(15 downto 0);
        sel: in  STD_LOGIC_VECTOR(1 downto 0);
        q:   out STD_LOGIC_VECTOR(15 downto 0));
end entity;

architecture arch of muxXor is
begin
    q <= a when (sel = "00") else
         b when (sel = "01") else
         c;
end architecture;
