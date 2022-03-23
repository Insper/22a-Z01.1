-- Elementos de Sistemas
-- by Luciano Soares
-- ALU.vhd

-- Unidade Lógica Aritmética (ULA)
-- Recebe dois valores de 16bits e
-- calcula uma das seguintes funções:
-- X+y, x-y, y-x, 0, 1, -1, x, y, -x, -y,
-- X+1, y+1, x-1, y-1, x&y, x|y
-- De acordo com os 6 bits de entrada denotados:
-- zx, nx, zy, ny, f, no.
-- Também calcula duas saídas de 1 bit:
-- Se a saída == 0, zr é definida como 1, senão 0;
-- Se a saída <0, ng é definida como 1, senão 0.
-- a ULA opera sobre os valores, da seguinte forma:
-- se (zx == 1) então x = 0
-- se (nx == 1) então x =! X
-- se (zy == 1) então y = 0
-- se (ny == 1) então y =! Y
-- se (f == 1) então saída = x + y
-- se (f == 0) então saída = x & y
-- se (no == 1) então saída = !saída
-- se (out == 0) então zr = 1
-- se (out <0) então ng = 1

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ALU is
    port (
        x, y  : in std_logic_vector(15 downto 0); -- entradas de dados da ALU
        zx    : in std_logic; -- zera a entrada x
        nx    : in std_logic; -- inverte a entrada x
        zy    : in std_logic; -- zera a entrada y
        ny    : in std_logic; -- inverte a entrada y
        f     : in std_logic; -- se 0 calcula x & y, senão x + y
        no    : in std_logic; -- inverte o valor da saída
        zr    : out std_logic; -- setado se saída igual a zero
        ng    : out std_logic; -- setado se saída é negativa
        saida : out std_logic_vector(15 downto 0) -- saída de dados da ALU
    );
end entity;

architecture rtl of alu is
    -- Aqui declaramos sinais (fios auxiliares)
    -- e componentes (outros módulos) que serao
    -- utilizados nesse modulo.

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

    signal zxout, zyout, nxout, nyout, andout, adderout, muxout, precomp : std_logic_vector(15 downto 0);

begin
    zerx : zerador16 port map(
        z => zx,
        a => x,
        y => zxout
    );
    zery : zerador16 port map(
        z => zy,
        a => y,
        y => zyout
    );
    invx : inversor16 port map(
        z => nx,
        a => zxout,
        y => nxout

    );
    invy : inversor16 port map(
        z => ny,
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
		sel => f,
		q => muxout
    );
	invf : inversor16 port map(
		z => no,
		a => muxout,
		y => precomp
	);
	
	compf : comparador16 port map(
		a => precomp,
		zr => zr,
		ng => ng
	);
	saida <= precomp;
end architecture;