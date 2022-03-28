-- Elementos de Sistemas
-- bb Luciano Soares
-- Add16.vhd

-- Soma dois valores de 16 bits
-- ignorando o carrb mais significativo

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Add16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		b   :  in STD_LOGIC_VECTOR(15 downto 0);
		q   : out STD_LOGIC_VECTOR(15 downto 0);
    carry : out std_logic
	);
end entity;

architecture rtl of Add16 is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

  component FullAdder is
    port(
      a,b,c:      in STD_LOGIC;   -- entradas
      soma,vaium: out STD_LOGIC   -- sum e carry
    );
  end component;
  signal u : STD_LOGIC_VECTOR(15 downto 0);

begin
  
  f1: FullAdder port map(
    a => a(0),
    b => b(0),
    c => '0',
    soma => q(0),
    vaium => u(0)
  );

  f2: FullAdder port map(
    a => a(1),
    b => b(1),
    c => u(0),
    soma => q(1),
    vaium => u(1)
  );

  f3: FullAdder port map(
    a => a(2),
    b => b(2),
    c => u(1),
    soma => q(2),
    vaium => u(2)
  );

  f4: FullAdder port map(
    a => a(3),
    b => b(3),
    c => u(2),
    soma => q(3),
    vaium => u(3)
  );

  f5: FullAdder port map(
    a => a(4),
    b => b(4),
    c => u(3),
    soma => q(4),
    vaium => u(4)
  );

  f6: FullAdder port map(
    a => a(5),
    b => b(5),
    c => u(4),
    soma => q(5),
    vaium => u(5)
  );

  f7: FullAdder port map(
    a => a(6),
    b => b(6),
    c => u(5),
    soma => q(6),
    vaium => u(6)
  );

  f8: FullAdder port map(
    a => a(7),
    b => b(7),
    c => u(6),
    soma => q(7),
    vaium => u(7)
  );

  f9: FullAdder port map(
    a => a(8),
    b => b(8),
    c => u(7),
    soma => q(8),
    vaium => u(8)
  );

  f10: FullAdder port map(
    a => a(9),
    b => b(9),
    c => u(8),
    soma => q(9),
    vaium => u(9)
  );

  f11: FullAdder port map(
    a => a(10),
    b => b(10),
    c => u(9),
    soma => q(10),
    vaium => u(10)
  );

  f12: FullAdder port map(
    a => a(11),
    b => b(11),
    c => u(10),
    soma => q(11),
    vaium => u(11)
  );

  f13: FullAdder port map(
    a => a(12),
    b => b(12),
    c => u(11),
    soma => q(12),
    vaium => u(12)
  );

  f14: FullAdder port map(
    a => a(13),
    b => b(13),
    c => u(12),
    soma => q(13),
    vaium => u(13)
  );

  f15: FullAdder port map(
    a => a(14),
    b => b(14),
    c => u(13),
    soma => q(14),
    vaium => u(14)
  );

  f16: FullAdder port map(
    a => a(15),
    b => b(15),
    c => u(14),
    soma => q(15),
    vaium => carry
  );

end architecture;
