--
-- Elementos de Sistemas - Aula 5 - Logica Combinacional
-- Rafael . Corsi @ insper . edu . br
--
-- Arquivo exemplo para acionar os LEDs e ler os bottoes
-- da placa DE0-CV utilizada no curso de elementos de
-- sistemas do 3s da eng. da computacao

----------------------------
-- Bibliotecas ieee       --
----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------
-- Entrada e saidas do bloco
----------------------------
entity TopLevel is
	port(
		SW      : in  std_logic_vector(9 downto 0);
		LEDR    : out std_logic_vector(9 downto 0);
		HEX0	  : out std_logic_vector(6 downto 0);
		HEX1	  : out std_logic_vector(6 downto 0);
		HEX2	  : out std_logic_vector(6 downto 0);
		HEX3	  : out std_logic_vector(6 downto 0);
	);
end entity;

----------------------------
-- Implementacao do bloco --
----------------------------
architecture rtl of TopLevel is

--------------
-- signals
--------------

  signal x : std_logic_vector(15 downto 0) := x"0073"; -- 115
  signal y : std_logic_vector(15 downto 0) := x"005F"; -- 95
  signal zxout, zyout, nxout, nyout, andout, adderout, muxout, precomp : std_logic_vector(15 downto 0);
--------------
-- component
--------------
    component zerador16 is
        port (
            z : in std_logic;
            a : in std_logic_vector(15 downto 0);
            y : out std_logic_vector(15 downto 0)
        );
    end component;

    component inversor16 is
        port (
            z : in std_logic;
            a : in std_logic_vector(15 downto 0);
            y : out std_logic_vector(15 downto 0)
        );
    end component;

    component Add16 is
        port (
            a : in std_logic_vector(15 downto 0);
            b : in std_logic_vector(15 downto 0);
            q : out std_logic_vector(15 downto 0)
        );
    end component;

    component And16 is
        port (
            a : in std_logic_vector(15 downto 0);
            b : in std_logic_vector(15 downto 0);
            q : out std_logic_vector(15 downto 0)
        );
    end component;

    component comparador16 is
        port (
            a  : in std_logic_vector(15 downto 0);
            zr : out std_logic;
            ng : out std_logic
        );
    end component;

    component Mux16 is
        port (
            a   : in std_logic_vector(15 downto 0);
            b   : in std_logic_vector(15 downto 0);
            sel : in std_logic;
            q   : out std_logic_vector(15 downto 0)
        );
    end component;
	 component sevenSeg is	
	 port (
			bcd : in  STD_LOGIC_VECTOR(3 downto 0);
			leds: out STD_LOGIC_VECTOR(6 downto 0));
end component;
	

---------------
-- implementacao
---------------
-- SW(0) = ZX , SW(1) = ZY, SW(2) = NX, SW(3) = NY, SW(4) = f, SW(5) = no || 
begin
    zerx : zerador16 port map(
        z => SW(0),
        a => x,
        y => zxout
    );
    zery : zerador16 port map(
        z => SW(1),
        a => y,
        y => zyout
    );
    invx : inversor16 port map(
        z => SW(2),
        a => zxout,
        y => nxout

    );
    invy : inversor16 port map(
        z => SW(3),
        a => zyout,
        y => nyout

    );
    and_16 : and16 port map(
        a => nxout,
        b => nyout,
        q => andout
    );
    add_16 : add16 port map(
        a => nxout,
        b => nyout,
        q => adderout
    );
    mux : Mux16 port map(
        a => andout,
        b => adderout,
		sel => SW(4),
		q => muxout
    );
	invf : inversor16 port map(
		z => SW(5),
		a => muxout,
		y => precomp
	);
	
	compf : comparador16 port map(
		a => precomp,
		zr => zr,
		ng => ng
	);

LEDR(0) <= ng;
LEDR(1) <= zr;

s1 : sevenSeg port map(
	bcd => precomp(3 downto 0),
	leds => HEX(0)
);

s2 : sevenSeg port map(
	bcd => precomp(7 downto 4),
	leds => HEX(1)
);

s3 : sevenSeg port map(
	bcd => precomp(11 downto 8),
	leds => HEX(2)
);

s4 : sevenSeg port map(
	bcd => precomp(15 downto 12),
	leds => HEX(3)
);

end rtl;
