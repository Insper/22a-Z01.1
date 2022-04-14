-- Elementos de Sistemas
-- FlipFlopJK.vhd

library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopJK is
	port(
		clock:  in std_logic;
		J:      in std_logic;
		K:      in std_logic;
		q:      out std_logic:= '0';
		notq:   out std_logic:= '1'
	);
end entity;

architecture arch of FlipFlopJK is


signal outsignal: std_logic:= '0';
signal notoutsignal: std_logic:= '1';


begin
	process (clock,J,K) begin
		
		if (J='1' and K='0') then
			outsignal<='1';
			notoutsignal<='0';

		elsif (J='1' and K='1') then
			outsignal<=not outsignal;
			notoutsignal<=not notoutsignal;

		elsif (J='0' and K='1') then
			outsignal<='0';
			notoutsignal<='1';
		end if;
	
	end process;
	q<=outsignal;
	notq<=notoutsignal;
end architecture;

