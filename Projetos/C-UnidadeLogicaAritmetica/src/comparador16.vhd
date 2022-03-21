-- Elementos de Sistemas
-- by Luciano Soares
-- comparador16.vhd

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity comparador16 is
   port(
	     a    : in STD_LOGIC_VECTOR(15 downto 0);
       zr   : out STD_LOGIC;
       ng   : out STD_LOGIC
   );
end comparador16;

architecture rtl of comparador16 is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

begin
  -- Implementação vem aqui!
  ng <= a(15);

  zr <= not(a(15) or a(14) or a(13) or a(12) or 
        a(11) or a(10) or a(9) or a(8) or 
        a(7) or a(6) or a(5) or a(4) or 
        a(3) or a(2) or a(1) or a(0));
end architecture;
