library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detectorDeMoedas is
	port (
    Q,D,N     : in  STD_LOGIC;
    cents     : out STD_LOGIC_VECTOR(4 downto 0));
end entity;

architecture arch of detectorDeMoedas is

begin
    cents <= "00101" when ((not Q) and (not D) and N) else
             "01010" when ((not Q) and D and (not N)) else
             "11001" when (Q and (not D) and (not N)) else
             "00000"; 

end architecture;
