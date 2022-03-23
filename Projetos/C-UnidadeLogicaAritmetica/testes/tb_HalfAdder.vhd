-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: tb_HalfAdder.vhd
-- date: 4/4/2017

library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_HalfAdder is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_HalfAdder is

component HalfAdder is
	port(
		a,b:         in STD_LOGIC;   -- entradas
		soma,vaium: out STD_LOGIC   -- sum e carry
	);
end component;

   signal  inA, inB, soma, vaium : STD_LOGIC;

begin

	u1HalfAdder: HalfAdder port map(inA, inB, soma, vaium);

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    -- Teste: 1
    -- 0 + 0
    inA <= '0'; inB<= '0';
    wait for 200 ps;
    assert(soma = '0' and vaium = '0')  report "Falha em teste: 1" severity error;

    -- Teste: 2
    -- 0 + 1
    inA <= '0'; inB<= '1';
    wait for 200 ps;
    assert(soma = '1' and vaium = '0')  report "Falha em teste: 2" severity error;

    -- Teste: 3
    -- 1 + 0
    inA <= '1'; inB<= '0';
    wait for 200 ps;
    assert(soma = '1' and vaium = '0')  report "Falha em teste: 3" severity error;



    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
