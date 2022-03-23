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

signal rty : std_logic;
signal rty2 : std_logic;
signal rty3 : std_logic;
signal rty4 : std_logic;
signal rty5 : std_logic;
signal rty6 : std_logic;
signal rty7 : std_logic;
signal rty8 : std_logic;
signal rty9 : std_logic;
signal rty10 : std_logic;
signal rty11 : std_logic;
signal rty12 : std_logic;
signal rty13 : std_logic;
signal rty14 : std_logic;
signal rty15 : std_logic;
signal rty16 : std_logic;

begin
s0 : FullAdder port map(
  a => a(0),
  b => b(0),
  c => '0',
  vaium => rty,
  soma => q(0) );


s1 : FullAdder port map(
  a => a(1),
  b => b(1),
  c => rty,
  vaium => rty2,
  soma => q(1) );

s2 : FullAdder port map(
  a => a(2),
  b => b(2),
  c => rty2,
  vaium => rty3,
  soma => q(2) );
s3 : FullAdder port map(
  a => a(3),
  b => b(3),
  c => rty3,
  vaium => rty4,
  soma => q(3) );
s4 : FullAdder port map(
  a => a(4),
  b => b(4),
  c => rty4,
  vaium => rty5,
  soma => q(4) );
s5 : FullAdder port map(
  a => a(5),
  b => b(5),
  c => rty5,
  vaium => rty6,
  soma => q(5) );
s6 : FullAdder port map(
  a => a(6),
  b => b(6),
  c => rty6,
  vaium => rty7,
  soma => q(6) );
s7 : FullAdder port map(
  a => a(7),
  b => b(7),
  c => rty7,
  vaium => rty8,
  soma => q(7) );
s8 : FullAdder port map(
  a => a(8),
  b => b(8),
  c => rty8,
  vaium => rty9,
  soma => q(8) );

s9 : FullAdder port map(
  a => a(9),
  b => b(9),
  c => rty9,
  vaium => rty10,
  soma => q(9) );
s10 : FullAdder port map(
  a => a(10),
  b => b(10),
  c => rty10,
  vaium => rty11,
  soma => q(10) );

s11 : FullAdder port map(
  a => a(11),
  b => b(11),
  c => rty11,
  vaium => rty12,
  soma => q(11) );
s12 : FullAdder port map(
  a => a(12),
  b => b(12),
  c => rty12,
  vaium => rty13,
  soma => q(12) );
s13 : FullAdder port map(
  a => a(13),
  b => b(13),
  c => rty13,
  vaium => rty14,
  soma => q(13) );


s14 : FullAdder port map(
  a => a(14),
  b => b(14),
  c => rty14,
  vaium => rty15,
  soma => q(14) );

s15 : FullAdder port map(
  a => a(15),
  b => b(15),
  c => rty15,
  vaium => rty16,
  soma => q(15) );


end architecture;
