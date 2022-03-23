-- Elementos de Sistemas
-- by Luciano Soares
-- FullAdder.vhd

-- Implementa Full Adder

Library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
	port(
		a,b,c:      in STD_LOGIC;   -- entradas
		soma,vaium: out STD_LOGIC   -- sum e carry
	);
end entity;

architecture rtl of FullAdder is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

begin
    soma <= '1' when (a and not(b) and not(c)) else
      '1' when (not(a) and b and not(c)) else
      '1' when (not(a) and not(b) and c) else
      '1' when (a and b and c) else
      '0';
    vaium <= '1' when (a and b and not(c)) else
      '1' when (not(a) and b and c) else
      '1' when (a and not(b) and c) else
      '1' when (a and b and c) else
      '0';

end architecture;
