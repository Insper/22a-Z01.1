-- Elementos de Sistemas
-- by Luciano Soares
-- zerador16.vhd

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity zerador16 is
  port(
        z   : in STD_LOGIC;
	      a   : in STD_LOGIC_VECTOR(15 downto 0);
        y   : out STD_LOGIC_VECTOR(15 downto 0)
      );
end zerador16;

architecture rtl of zerador16 is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

begin
  -- Implementação vem aqui!
  y <= '0000000000000000' when z = '1' else a; --creio que seja isso
  
end architecture;
