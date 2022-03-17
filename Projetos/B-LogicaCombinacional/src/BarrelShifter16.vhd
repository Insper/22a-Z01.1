library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
entity BarrelShifter16 is
	port ( 
			a:    in  STD_LOGIC_VECTOR(15 downto 0);   -- input vector
			dir:  in  std_logic;                       -- 0=>left 1=>right
			size: in  std_logic_vector(2 downto 0);    -- shift amount
			q:    out STD_LOGIC_VECTOR(15 downto 0));  -- output vector (shifted)
end entity;

architecture rtl of BarrelShifter16 is
signal b : unsigned(15 downto 0);
signal sizeb : unsigned(2 downto 0);
begin
	b <= unsigned(a);
	sizeb <= unsigned(size);
	q <= STD_LOGIC_VECTOR(shift_left(b,to_integer(sizeb))) when dir = '0' else STD_LOGIC_VECTOR(shift_right(b,to_integer(sizeb))) ;

end architecture;

