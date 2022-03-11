Library ieee;
use ieee.std_logic_1164.all;

entity Nand2 is
   port(
          a : in  std_logic;
	      b : in  std_logic;
	      q : out std_logic
   );
end entity;

architecture rtl of Nand2 is
begin
   q <=  not (a and b);
end rtl;
