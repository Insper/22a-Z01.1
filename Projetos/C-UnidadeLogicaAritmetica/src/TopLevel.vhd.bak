--
-- Elementos de Sistemas - Aula 5 - Logica Combinacional
-- Rafael . Corsi @ insper . edu . br
--
-- Arquivo exemplo para acionar os LEDs e ler os bottoes
-- da placa DE0-CV utilizada no curso de elementos de
-- sistemas do 3s da eng. da computacao

----------------------------
-- Bibliotecas ieee       --
----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------
-- Entrada e saidas do bloco
----------------------------
entity TopLevel is
	port(
		SW      : in  std_logic_vector(9 downto 0);
		LEDR    : out std_logic_vector(9 downto 0)
	);
end entity;

----------------------------
-- Implementacao do bloco --
----------------------------
architecture rtl of TopLevel is

--------------
-- signals
--------------

  signal x : std_logic_vector(15 downto 0) := x"0073"; -- 115
  signal y : std_logic_vector(15 downto 0) := x"005F"; -- 95

--------------
-- component
--------------
  component HalfAdder is
    port(
      a,b:         in STD_LOGIC;   -- entradas
      soma,vaium: out STD_LOGIC   -- sum e carry
      );
  end component;

  component FullAdder is
      port(
          a,b,c:      in STD_LOGIC;   -- entradas
          soma,vaium: out STD_LOGIC   -- sum e carry
          );
    end component;

---------------
-- implementacao
---------------
begin

  u1 : HalfAdder port map(a => SW(0), b=> SW(1), soma => LEDR(0), vaium => LEDR(1));

end rtl;
