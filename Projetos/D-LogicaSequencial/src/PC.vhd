-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: PC.vhd
-- date: 4/4/2017

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

 signal regIn : std_logic_vector(15 downto 0);
 signal regOut : std_logic_vector(15 downto 0);
 signal icrOut : std_logic_vector(15 downto 0);
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
      port(
          a: in STD_LOGIC_VECTOR(15 downto 0);
          b: in STD_LOGIC_VECTOR(15 downto 0);
          sel: in STD_LOGIC;
          q: out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

begin

    icr16 : Inc16 port map(
        a => regOut,
        q => icrOut
    );
    
    reg16 : Register16 port map(
        clock => clock,
        input => regIn,
        load => '1',
        output => regOut
    );
    
    mux1 : Mux16 port map(
        a => regOut,
        b => icrOut,
        sel => increment,
        q => muxOut
    );

    mux2 : Mux16 port map(
        a => muxOut,
        b => input,
        sel => load,
        q => regIn
    );

    mux3 : Mux16 port map(
        a => regOut,
        b => "0000000000000000",
        sel => reset,
        q => output
    );

end architecture;
