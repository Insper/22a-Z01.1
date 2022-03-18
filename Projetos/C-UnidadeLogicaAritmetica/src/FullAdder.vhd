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
  -- Implementação vem aqui!
  soma <= ((a and not(c) and not(b)) or (not(a) and c and not(b)) or (not(a) and not(C) and b) or (a and b and c) ); -- A + B + C; "check board configuration", vide video na página de aritmetica binaria

  vaium <= ((a and b) or (a and c) or (c and b));

end architecture;
