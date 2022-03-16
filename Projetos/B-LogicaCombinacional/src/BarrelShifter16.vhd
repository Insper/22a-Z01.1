library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;   

entity BarrelShifter16 is
	port ( 
			a:    in  STD_LOGIC_VECTOR(15 downto 0);   -- input vector
			dir:  in  std_logic;                       -- 0=>left 1=>right
			size: in  std_logic_vector(2 downto 0);    -- shift amount
			q:    out STD_LOGIC_VECTOR(15 downto 0));  -- output vector (shifted)
end entity;

architecture rtl of BarrelShifter16 is
begin

	with dir select
		q<= STD_LOGIC_VECTOR(shift_left(unsigned(a), to_integer(unsigned(size)))) when '0',
			 STD_LOGIC_VECTOR(shift_right(unsigned(a), to_integer(unsigned(size)))) when others;
			 
			

end architecture;

