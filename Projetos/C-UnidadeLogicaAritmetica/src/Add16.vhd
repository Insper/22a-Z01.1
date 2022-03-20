-- Elementos de Sistemas
-- by Luciano Soares
-- Add16.vhd

-- Soma dois valores de 16 bits
-- ignorando o carry mais significativo

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Add16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		b   :  in STD_LOGIC_VECTOR(15 downto 0);
		q   : out STD_LOGIC_VECTOR(15 downto 0)
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
  signal c : std_logic;
  signal d : std_logic;

begin
  c <= '0';
  d <= '0';
  f1: FullAdder port map(
    a => a(0),
    b => b(0),
    c => c,
    soma => q(0),
    vaium => d
  );
  c <= d;
  f2: FullAdder port map(
    a => a(1),
    b => b(1),
    c => c,
    soma => q(1),
    vaium => d
  );
  c <= d;
  f3: FullAdder port map(
    a => a(2),
    b => b(2),
    c => c,
    soma => q(2),
    vaium => d
  );
  c <= d;
  f4: FullAdder port map(
    a => a(3),
    b => b(3),
    c => c,
    soma => q(3),
    vaium => d
  );
  c <= d;
  f5: FullAdder port map(
    a => a(4),
    b => b(4),
    c => c,
    soma => q(4),
    vaium => d
  );
  c <= d;
  f6: FullAdder port map(
    a => a(5),
    b => b(5),
    c => c,
    soma => q(5),
    vaium => d
  );
  c <= d;
  f7: FullAdder port map(
    a => a(6),
    b => b(6),
    c => c,
    soma => q(6),
    vaium => d
  );
  c <= d;
  f8: FullAdder port map(
    a => a(7),
    b => b(7),
    c => c,
    soma => q(7),
    vaium => d
  );
  c <= d;
  f9: FullAdder port map(
    a => a(8),
    b => b(8),
    c => c,
    soma => q(8),
    vaium => d
  );
  c <= d;
  f10: FullAdder port map(
    a => a(9),
    b => b(9),
    c => c,
    soma => q(9),
    vaium => d
  );
  c <= d;
  f11: FullAdder port map(
    a => a(10),
    b => b(10),
    c => c,
    soma => q(10),
    vaium => d
  );
  c <= d;
  f12: FullAdder port map(
    a => a(11),
    b => b(11),
    c => c,
    soma => q(11),
    vaium => d
  );
  c <= d;
  f13: FullAdder port map(
    a => a(12),
    b => b(12),
    c => c,
    soma => q(12),
    vaium => d
  );
  c <= d;
  f14: FullAdder port map(
    a => a(13),
    b => b(13),
    c => c,
    soma => q(13),
    vaium => d
  );
  c <= d;
  f15: FullAdder port map(
    a => a(14),
    b => b(14),
    c => c,
    soma => q(14),
    vaium => d
  );
  c <= d;
  f16: FullAdder port map(
    a => a(15),
    b => b(15),
    c => c,
    soma => q(15),
    vaium => d
  );





end architecture;
