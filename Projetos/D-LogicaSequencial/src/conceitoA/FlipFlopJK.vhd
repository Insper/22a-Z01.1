-- Elementos de Sistemas
-- FlipFlopJK.vhd

library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopJK is
	port(
		clock:  in std_logic;
		J:      in std_logic;
		K:      in std_logic;


		q:      buffer std_logic:= '0';

		notq:   out std_logic:= '1'
	);
end entity;

architecture arch of FlipFlopJK is

begin



	process(clock) begin
        if (rising_edge(clock)) then
            if ((j='1') and (k='1')) then
                q <= not(q);
            elsif ((k='1') and ((not(j))= '1')) then
                q<='0';

            elsif ((j='1') and ((not(k))='1')) then
                q<= '1';
            
            else
                q<=q;
            
            end if;
        end if;
		notq <= not(q);
	end process;

end architecture;