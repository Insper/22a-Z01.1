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
  y(0) <= '0' when z = '1' else a(0);
  y(1) <= '0' when z = '1' else a(1);
  y(2) <= '0' when z = '1' else a(2);
  y(3) <= '0' when z = '1' else a(3);
  y(4) <= '0' when z = '1' else a(4);
  y(5) <= '0' when z = '1' else a(5);
  y(6) <= '0' when z = '1' else a(6);
  y(7) <= '0' when z = '1' else a(7);
  y(8) <= '0' when z = '1' else a(8);
  y(9) <= '0' when z = '1' else a(9);
  y(10) <= '0' when z = '1' else a(10);
  y(11) <= '0' when z = '1' else a(11);
  y(12) <= '0' when z = '1' else a(12);
  y(13) <= '0' when z = '1' else a(13);
  y(14) <= '0' when z = '1' else a(14);
  y(15) <= '0' when z = '1' else a(15);
end architecture;
