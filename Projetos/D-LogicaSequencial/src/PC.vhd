-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: PC.vhd
-- date: 4/4/2017

-- Contador de 16bits
-- if (reset[t] == 1) out[t+1] = 0
-- else if (load[t] == 1)  out[t+1] = in[t]
-- else if (inc[t] == 1) out[t+1] = out[t] + 1
-- else out[t+1] = out[t]

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity PC is
    port(
        clock     : in  STD_LOGIC;
        increment : in  STD_LOGIC;
        load      : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        input     : in  STD_LOGIC_VECTOR(15 downto 0);

        output    : out STD_LOGIC_VECTOR(15 downto 0):="0000000000000000"

    );
end entity;

architecture arch of PC is



  component Inc16 is
      port(
          a   :  in STD_LOGIC_VECTOR(15 downto 0);
          q   : out STD_LOGIC_VECTOR(15 downto 0)
          );
  end component;

  component Register16 is
      port(
          clock:   in STD_LOGIC;
          input:   in STD_LOGIC_VECTOR(15 downto 0);
          load:    in STD_LOGIC;
          output: out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;


signal incout,incin,regisout,regisin : std_logic_vector(15 downto 0);
begin

    a0 : Register16 port map(
		clock => clock,
		input =>regisin,
		load =>'1',
		output=> regisout
	);
    s1 : Inc16 port map(
        a=> regisout,
        q=> incout
    );
    

    
    regisin <= "0000000000000000" when reset='1' else
        input when load = '1'  else
        incout when increment = '1' else
        regisout;
    output <= regisout;





end architecture;

