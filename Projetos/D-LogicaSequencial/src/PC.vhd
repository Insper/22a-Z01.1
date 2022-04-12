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
        output    : out STD_LOGIC_VECTOR(15 downto 0)
    );
end entity;

architecture arch of PC is

 signal muxOut : std_logic_vector(15 downto 0);

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

    component Mux16 is
    port (
        a: in STD_LOGIC_VECTOR(15 downto 0);
        b: in STD_LOGIC_VECTOR(15 downto 0);
        sel: in STD_LOGIC;
        q: out STD_LOGIC_VECTOR(15 downto 0)
    );
    end component;

  signal inc_out, mux1_out, mux2_out, mux3_out,o_t: STD_LOGIC_VECTOR(15 downto 0);

begin

    inc: Inc16 port map (         
        a => o_t,             -- saída o(t)
        q => inc_out          -- saída incrementada
    );

   
    mux1: Mux16 port map (    -- Multiplexador incremental
        a => o_t,             
        b => inc_out,         -- Caso increment = 0
        sel => increment,     -- Caso increment = 1  / o(t+1) = o(t)+1 (saída incrementada)
        q => mux1_out
    );

    mux2: Mux16 port map(
        a => mux1_out,            -- Caso load = 0         
        b => input,               -- Caso load = 1 / o(t+1) = in(t)
        sel => load,
        q => mux2_out 
    );

    mux3: Mux16 port map(
        a => mux2_out,          -- Caso reset = 0      
        b => x"0000",           -- Caso reset = 1   
        sel => reset,
        q => mux3_out 
    );

    registrador : Register16 port map (     -- Registrador
        clock => clock,
        input => mux3_out,
        load  => '1',                       
        output => o_t
    );

    output <= o_t;                          -- saída

end architecture;
