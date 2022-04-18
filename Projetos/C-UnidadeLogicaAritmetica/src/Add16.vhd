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
		q   : out STD_LOGIC_VECTOR(15 downto 0);
		carry: out STD_LOGIC
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
   
	SIGNAL car: std_logic_vector(15 downto 0);
	
begin
  -- Implementação vem aqui!

	fa0: FullAdder port map(
		a => a(0),
		b =>b(0),
		c => '0',
		soma => q(0),
		vaium => car(0)
		);
	fa1: FullAdder port map(
		a => a(1),
		b =>b(1),
		c => car(0),
		soma => q(1),
		vaium => car(1)
		);
	fa2: FullAdder port map(
		a => a(2),
		b =>b(2),
		c => car(1),
		soma => q(2),
		vaium => car(2)
		);
	fa3: FullAdder port map(
		a => a(3),
		b =>b(3),
		c => car(2),
		soma => q(3),
		vaium => car(3)
		);
	fa4: FullAdder port map(
		a => a(4),
		b =>b(4),
		c => car(3),
		soma => q(4),
		vaium => car(4)
		);
	fa5: FullAdder port map(
		a => a(5),
		b =>b(5),
		c => car(4),
		soma => q(5),
		vaium => car(5)
		);
	fa6: FullAdder port map(
		a => a(6),
		b =>b(6),
		c => car(5),
		soma => q(6),
		vaium => car(6)
		);
	fa7: FullAdder port map(
		a => a(7),
		b =>b(7),
		c => car(6),
		soma => q(7),
		vaium => car(7)
		);
	fa8: FullAdder port map(
		a => a(8),
		b =>b(8),
		c => car(7),
		soma => q(8),
		vaium => car(8)
		);
	fa9: FullAdder port map(
		a => a(9),
		b =>b(9),
		c => car(8),
		soma => q(9),
		vaium => car(9)
		);
	fa10: FullAdder port map(
		a => a(10),
		b =>b(10),
		c => car(9),
		soma => q(10),
		vaium => car(10)
		);
	fa11: FullAdder port map(
		a => a(11),
		b =>b(11),
		c => car(10),
		soma => q(11),
		vaium => car(11)
		);
	fa12: FullAdder port map(
		a => a(12),
		b =>b(12),
		c => car(11),
		soma => q(12),
		vaium => car(12)
		);
	fa13: FullAdder port map(
		a => a(13),
		b =>b(13),
		c => car(12),
		soma => q(13),
		vaium => car(13)
		);
	fa14: FullAdder port map(
		a => a(14),
		b =>b(14),
		c => car(13),
		soma => q(14),
		vaium => car(14)
		);
	fa15: FullAdder port map(
		a => a(15),
		b =>b(15),
		c => car(14),
		soma => q(15),
		vaium => carry
		);
  

end architecture;
