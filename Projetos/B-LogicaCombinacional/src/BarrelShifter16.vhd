library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BarrelShifter16 is
	port ( 
			a:    in  STD_LOGIC_VECTOR(15 downto 0);   -- input vector
			dir:  in  std_logic;                       -- 0=>left 1=>right
			size: in  std_logic_vector(2 downto 0);    -- shift amount
			q:    out STD_LOGIC_VECTOR(15 downto 0));  -- output vector (shifted)
end entity;

architecture rtl of BarrelShifter16 is
begin

	q<=a when size ="000" else
		a(14 downto 0)&"0" when (dir='0' and size="001") else
		a(13 downto 0)&"00" when (dir='0' and size="010") else
		a(12 downto 0)&"000" when (dir='0' and size="011") else
		a(11 downto 0)&"0000" when (dir='0' and size="100")else
		a(10 downto 0)&"00000" when (dir='0' and size="101")else
		a(9 downto 0)& "000000" when (dir='0' and size="110")else
		a(8 downto 0)& "0000000" when (dir='0' and size="111")else
		
		
		"0" & a(15 downto 1) when (dir='1' and size="001") else
		"00" & a(15 downto 2) when (dir='1' and size="010") else
		"000" & a(15 downto 3) when (dir='1' and size="011") else
		"0000" & a(15 downto 4) when (dir='1' and size="100")else
		"00000" & a(15 downto 5) when (dir='1' and size="101")else
		"000000" & a(15 downto 6) when (dir='1' and size="110")else
		"0000000" & a(15 downto 7) when (dir='1' and size="111");
		
		

end architecture;

