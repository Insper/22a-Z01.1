-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: tb_FullAdder.vhd
-- date: 4/4/2017

library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_FullAdder is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_FullAdder is

component FullAdder is
	port(
		a,b,c:      in STD_LOGIC;   -- entradas
		soma,vaium: out STD_LOGIC   -- sum e carry
	);
end component;

   signal  inA, inB, inC, soma, vaium : STD_LOGIC;

begin

	mapping: FullAdder port map(inA, inB, inC, soma, vaium);

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

      -- Teste: 1
      inA <= '0'; inB <= '0'; inC <= '0';
      wait for 200 ps;
      assert(soma = '0' and vaium = '0')  report "Falha em teste: 1" severity error;

      -- Teste: 2
      inA <= '0'; inB <= '0'; inC <= '1';
      wait for 200 ps;
      assert(soma = '1' and vaium = '0')  report "Falha em teste: 2" severity error;

      -- Teste: 3
      inA <= '0'; inB <= '1'; inC <= '0';
      wait for 200 ps;
      assert(soma = '1' and vaium = '0')  report "Falha em teste: 3" severity error;

      -- Teste: 4
      inA <= '0'; inB <= '1'; inC <= '1';
      wait for 200 ps;
      assert(soma = '0' and vaium = '1')  report "Falha em teste: 4" severity error;

      -- Teste: 5
      inA <= '1'; inB <= '0'; inC <= '0';
      wait for 200 ps;
      assert(soma = '1' and vaium = '0')  report "Falha em teste: 5" severity error;

      -- Teste: 6
      inA <= '1'; inB <= '0'; inC <= '1';
      wait for 200 ps;
      assert(soma = '0' and vaium = '1')  report "Falha em teste: 6" severity error;

      -- Teste: 7
      inA <= '1'; inB <= '1'; inC <= '0';
      wait for 200 ps;
      assert(soma = '0' and vaium = '1')  report "Falha em teste: 7" severity error;

      -- Teste: 8
      inA <= '1'; inB <= '1'; inC <= '1';
      wait for 200 ps;
      assert(soma = '1' and vaium = '1')  report "Falha em teste: 8" severity error;


    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;