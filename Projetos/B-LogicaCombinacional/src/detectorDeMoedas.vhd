library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detectorDeMoedas is
	port (
    Q,D,N : in  STD_LOGIC;
    cents     : out STD_LOGIC_VECTOR(4 downto 0));
end entity;

architecture arch of detectorDeMoedas is

begin
    

    cents(0)<= Q or N;
    cents(1)<= D;
    cents(2)<= N;
    cents(3)<= Q or D;
    cents(4)<= Q;


end architecture;
