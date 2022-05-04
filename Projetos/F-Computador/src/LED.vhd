-- Elementos de Sistemas
-- developed by Rafael Corsi
-- file: led.vhd
-- date: 4/2019

library ieee;
use ieee.std_logic_1164.all;

entity led is
  port(
    data : in std_logic_vector(15 downto 0);
    load : in std_logic;
    led  : out std_logic_vector(15 downto 0)
    );
end entity;

architecture arch of led is
begin

end architecture;
