-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: tb_Add16.vhd
-- date: 4/4/2017

library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_Add16 is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_Add16 is

component Add16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		b   :  in STD_LOGIC_VECTOR(15 downto 0);
		q   : out STD_LOGIC_VECTOR(15 downto 0) 
	); 
end component; 

   signal  inA, inB, outQ : STD_LOGIC_VECTOR(15 downto 0);

begin

	mapping: Add16 port map(inA, inB, outQ);

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

      -- Teste: 1
      inA <= "0000000000000000"; inB<= "0000000000000001";
      wait for 200 ps;
      assert(outQ = "0000000000000001")  report "Falha em teste: 1" severity error;

      -- Teste: 2
      inA <= "0000000000000000"; inB<= "1111111111111111";
      wait for 200 ps;
      assert(outQ = "1111111111111111")  report "Falha em teste: 2" severity error;

      -- Teste: 3
      inA <= "1111111111111111"; inB<= "1111111111111111";
      wait for 200 ps;
      assert(outQ = "1111111111111110")  report "Falha em teste: 3" severity error;

      -- Teste: 4
      inA <= "1010101010101010"; inB<= "0101010101010101";
      wait for 200 ps;
      assert(outQ = "1111111111111111")  report "Falha em teste: 4" severity error;

      -- Teste: 5
      inA <= "0011110011000011"; inB<= "0000111111110000";
      wait for 200 ps;
      assert(outQ = "0100110010110011")  report "Falha em teste: 5" severity error;

      -- Teste: 6
      inA <= "0001001000110100"; inB<= "1001100001110110";
      wait for 200 ps;
      assert(outQ = "1010101010101010")  report "Falha em teste: 6" severity error;

    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
