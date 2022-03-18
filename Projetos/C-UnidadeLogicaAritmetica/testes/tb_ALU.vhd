-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: tb_ALU.vhd
-- date: 4/4/2017

library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_ALU is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_ALU is

component ALU is
	port (
			x,y:   in STD_LOGIC_VECTOR(15 downto 0); -- entradas de dados da ALU
			zx:    in STD_LOGIC;                     -- zera a entrada x
			nx:    in STD_LOGIC;                     -- inverte a entrada x
			zy:    in STD_LOGIC;                     -- zera a entrada y
			ny:    in STD_LOGIC;                     -- inverte a entrada y
			f:     in STD_LOGIC;                     -- se 0 calcula x & y, senão x + y
			no:    in STD_LOGIC;                     -- inverte o valor da saída
			zr:    out STD_LOGIC;                    -- setado se saída igual a zero
			ng:    out STD_LOGIC;                    -- setado se saída é negativa
			saida: out STD_LOGIC_VECTOR(15 downto 0) -- saída de dados da ALU
	);
end component;

   signal  inX, inY : STD_LOGIC_VECTOR(15 downto 0);
   signal  inZX, inNX, inZY, inNY, inF, inNO, outZR, outNG : STD_LOGIC;
   signal  outSaida : STD_LOGIC_VECTOR(15 downto 0);

begin

	mapping: ALU port map(
    x  => inX,
    y  => inY,
    zx => inZx,
    nx => inNx,
    zy => inZy,
    ny => inNy,
    f  => inF,
    no => inNo,
    zr => outZr,
    ng => outNg,
    saida => outsaida);

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

      -- Teste: 1
      inX <= "0000000000000000"; inY <= "1111111111111111";
      inZX <= '1'; inNX <= '0'; inZY <= '1'; inNY <= '0'; inF <= '1'; inNO <= '0';
      wait for 100 ps;
      assert(outZR = '1' and outNG = '0' and outSaida= "0000000000000000")  report "Falha em teste: 1" severity error;

      -- Teste: 2
      inX <= "0000000000000000"; inY <= "1111111111111111";
      inZX <= '1'; inNX <= '1'; inZY <= '1'; inNY <= '1'; inF <= '1'; inNO <= '1';
      wait for 200 ps;
      assert(outZR = '0' and outNG = '0' and outSaida= "0000000000000001")  report "Falha em teste: 2" severity error;

      -- Teste: 3
      inX <= "0000000000000000"; inY <= "1111111111111111";
      inZX <= '1'; inNX <= '1'; inZY <= '1'; inNY <= '0'; inF <= '1'; inNO <= '0';
      wait for 200 ps;
      assert(outZR = '0' and outNG = '1' and outSaida= "1111111111111111")  report "Falha em teste: 3" severity error;

      -- Teste: 4
      inX <= "0000000000000000"; inY <= "1111111111111111";
      inZX <= '0'; inNX <= '0'; inZY <= '1'; inNY <= '1'; inF <= '0'; inNO <= '0';
      wait for 200 ps;
      assert(outZR = '1' and outNG = '0' and outSaida= "0000000000000000")  report "Falha em teste: 4" severity error;

      -- Teste: 5
      inX <= "0000000000000000"; inY <= "1111111111111111";
      inZX <= '1'; inNX <= '1'; inZY <= '0'; inNY <= '0'; inF <= '0'; inNO <= '0';
      wait for 200 ps;
      assert(outZR = '0' and outNG = '1' and outSaida= "1111111111111111")  report "Falha em teste: 5" severity error;

      -- Teste: 6
      inX <= "0000000000000000"; inY <= "1111111111111111";
      inZX <= '1'; inNX <= '1'; inZY <= '0'; inNY <= '0'; inF <= '0'; inNO <= '0';
      wait for 200 ps;
      assert(outZR = '0' and outNG = '1' and outSaida= "1111111111111111")  report "Falha em teste: 6" severity error;

      -- Teste: 7
      inX <= "0000000000000000"; inY <= "1111111111111111";
      inZX <= '0'; inNX <= '0'; inZY <= '1'; inNY <= '1'; inF <= '0'; inNO <= '1';
      wait for 200 ps;
      assert(outZR = '0' and outNG = '1' and outSaida= "1111111111111111")  report "Falha em teste: 7" severity error;

      -- Teste: 8
      inX <= "0000000000000000"; inY <= "1111111111111111";
      inZX <= '1'; inNX <= '1'; inZY <= '0'; inNY <= '0'; inF <= '0'; inNO <= '1';
      wait for 200 ps;
      assert(outZR = '1' and outNG = '0' and outSaida= "0000000000000000")  report "Falha em teste: 8" severity error;

      -- Teste: 9
      inX <= "0000000000000000"; inY <= "1111111111111111";
      inZX <= '0'; inNX <= '0'; inZY <= '1'; inNY <= '1'; inF <= '1'; inNO <= '1';
      wait for 200 ps;
      assert(outZR = '1' and outNG = '0' and outSaida= "0000000000000000")  report "Falha em teste: 9" severity error;

      -- Teste: 10
      inX <= "0000000000000000"; inY <= "1111111111111111";
      inZX <= '1'; inNX <= '1'; inZY <= '0'; inNY <= '0'; inF <= '1'; inNO <= '1';
      wait for 200 ps;
      assert(outZR = '0' and outNG = '0' and outSaida= "0000000000000001")  report "Falha em teste: 10" severity error;

      -- Teste: 11
      inX <= "0000000000000000"; inY <= "1111111111111111";
      inZX <= '0'; inNX <= '1'; inZY <= '1'; inNY <= '1'; inF <= '1'; inNO <= '1';
      wait for 200 ps;
      assert(outZR = '0' and outNG = '0' and outSaida= "0000000000000001")  report "Falha em teste: 11" severity error;

      -- Teste: 12
      inX <= "0000000000000000"; inY <= "1111111111111111";
      inZX <= '1'; inNX <= '1'; inZY <= '0'; inNY <= '1'; inF <= '1'; inNO <= '1';
      wait for 200 ps;
      assert(outZR = '1' and outNG = '0' and outSaida= "0000000000000000")  report "Falha em teste: 12" severity error;

      -- Teste: 13
      inX <= "0000000000000000"; inY <= "1111111111111111";
      inZX <= '0'; inNX <= '0'; inZY <= '1'; inNY <= '1'; inF <= '1'; inNO <= '0';
      wait for 200 ps;
      assert(outZR = '0' and outNG = '1' and outSaida= "1111111111111111")  report "Falha em teste: 13" severity error;

      -- Teste: 14
      inX <= "0000000000000000"; inY <= "1111111111111111";
      inZX <= '1'; inNX <= '1'; inZY <= '0'; inNY <= '0'; inF <= '1'; inNO <= '0';
      wait for 200 ps;
      assert(outZR = '0' and outNG = '1' and outSaida= "1111111111111110")  report "Falha em teste: 14" severity error;

      -- Teste: 15
      inX <= "0000000000000000"; inY <= "1111111111111111";
      inZX <= '0'; inNX <= '0'; inZY <= '0'; inNY <= '0'; inF <= '1'; inNO <= '0';
      wait for 200 ps;
      assert(outZR = '0' and outNG = '1' and outSaida= "1111111111111111")  report "Falha em teste: 15" severity error;

      -- Teste: 16
      inX <= "0000000000000000"; inY <= "1111111111111111";
      inZX <= '0'; inNX <= '1'; inZY <= '0'; inNY <= '0'; inF <= '1'; inNO <= '1';
      wait for 200 ps;
      assert(outZR = '0' and outNG = '0' and outSaida= "0000000000000001")  report "Falha em teste: 16" severity error;

      -- Teste: 17
      inX <= "0000000000000000"; inY <= "1111111111111111";
      inZX <= '0'; inNX <= '0'; inZY <= '0'; inNY <= '1'; inF <= '1'; inNO <= '1';
      wait for 200 ps;
      assert(outZR = '0' and outNG = '1' and outSaida= "1111111111111111")  report "Falha em teste: 17" severity error;

      -- Teste: 18
      inX <= "0000000000000000"; inY <= "1111111111111111";
      inZX <= '0'; inNX <= '0'; inZY <= '0'; inNY <= '0'; inF <= '0'; inNO <= '0';
      wait for 200 ps;
      assert(outZR = '1' and outNG = '0' and outSaida= "0000000000000000")  report "Falha em teste: 18" severity error;

      -- Teste: 19
      inX <= "0000000000000000"; inY <= "1111111111111111";
      inZX <= '0'; inNX <= '1'; inZY <= '0'; inNY <= '1'; inF <= '0'; inNO <= '1';
      wait for 200 ps;
      assert(outZR = '0' and outNG = '1' and outSaida= "1111111111111111")  report "Falha em teste: 19" severity error;

    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
