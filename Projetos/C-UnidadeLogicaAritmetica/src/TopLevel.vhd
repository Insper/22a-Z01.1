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
		HEX0     : out std_logic_vector(6 downto 0); -- 7seg0
    HEX1     : out std_logic_vector(6 downto 0); -- 7seg0
    HEX2     : out std_logic_vector(6 downto 0); -- 7seg0
		HEX3     : out std_logic_vector(6 downto 0);
    x_top,y_top:   in STD_LOGIC_VECTOR(15 downto 0); -- entradas de dados da ALU
    zx:    in STD_LOGIC;                     -- zera a entrada x
    nx:    in STD_LOGIC;                     -- inverte a entrada x
    zy:    in STD_LOGIC;                     -- zera a entrada y
    ny:    in STD_LOGIC;                     -- inverte a entrada y
    f1:    in STD_LOGIC;                     -- se 0 calcula x & y, senão x + y
    f2:	   in STD_LOGIC;                     -- retorna o resultado o mux1 (caso 0) ou retorna X xor Y;
    s:     in STD_LOGIC;  					 -- shifter /left/right/
    ss:    in  std_logic_vector(2 downto 0); -- shift amount
    no:    in STD_LOGIC;                     -- inverte o valor da saída
    zr:    out STD_LOGIC;                    -- setado se saída igual a zero
    ng:    out STD_LOGIC;                    -- setado se saída é negativa
    saida: out STD_LOGIC_VECTOR(15 downto 0) -- saída de dados da ALU
		
	);
end entity;

----------------------------
-- Implementacao do bloco --
----------------------------
architecture rtl of TopLevel is
  signal x_Zerador : STD_LOGIC_VECTOR(15 downto 0);
	signal y_Zerador : STD_LOGIC_VECTOR(15 downto 0);
	signal x_Inversor : STD_LOGIC_VECTOR(15 downto 0);
	signal y_Inversor : STD_LOGIC_VECTOR(15 downto 0);
	signal operacaoMux1 : STD_LOGIC_VECTOR(15 downto 0);
	signal operacaoMux2 : STD_LOGIC_VECTOR(15 downto 0);
	signal saidaADD: STD_LOGIC_VECTOR(15 downto 0);
	signal saidaAND: STD_LOGIC_VECTOR(15 downto 0);


--------------
-- signals
--------------

  signal x : std_logic_vector(15 downto 0) := x"0073"; -- 115
  signal y : std_logic_vector(15 downto 0) := x"005F"; -- 95
	
--------------
-- component
--------------

    component zerador16 IS
    port(z   : in STD_LOGIC;
      a   : in STD_LOGIC_VECTOR(15 downto 0);
      y   : out STD_LOGIC_VECTOR(15 downto 0)
      );
    end component;

    component inversor16 is
    port(z   : in STD_LOGIC;
      a   : in STD_LOGIC_VECTOR(15 downto 0);
      y   : out STD_LOGIC_VECTOR(15 downto 0)
    );
    end component;

    component Add16B is
    port(
      a   :  in STD_LOGIC_VECTOR(15 downto 0);
      b   :  in STD_LOGIC_VECTOR(15 downto 0);
      q   : out STD_LOGIC_VECTOR(15 downto 0);
      carry_out : out STD_LOGIC_VECTOR(15 downto 0)                                                 --Adicioanndo Carry de saúda
    );
    end component;

    component And16 is
    port (
      a:   in  STD_LOGIC_VECTOR(15 downto 0);
      b:   in  STD_LOGIC_VECTOR(15 downto 0);
      q:   out STD_LOGIC_VECTOR(15 downto 0)
    );
    end component;

    component comparador16 is
    port(
      a   : in STD_LOGIC_VECTOR(15 downto 0);
      zr   : out STD_LOGIC;
      ng   : out STD_LOGIC
    );
    end component;

    component Mux16 is
    port (
      a:   in  STD_LOGIC_VECTOR(15 downto 0);
      b:   in  STD_LOGIC_VECTOR(15 downto 0);
      sel: in  STD_LOGIC;
      q:   out STD_LOGIC_VECTOR(15 downto 0)
    );
    end component;

    SIGNAL zxout,zyout,nxout,nyout,andout,adderout,muxout,precomp: std_logic_vector(15 downto 0);


  component HalfAdder is
    port(
      a,b:         in STD_LOGIC;   -- entradas
      soma,vaium: out STD_LOGIC   -- sum e carry
      );
  end component;

  component FullAdder is
      port(
          a,b,c:      in STD_LOGIC;   -- entradas
          soma,vaium: out STD_LOGIC   -- sum e carry
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
begin



-- Zerador x:	
      zeradorX: zerador16 port map (
        z => zx,
        a => x,
        y => x_Zerador
        );

    -- Zerador y:	
    zeradorY: zerador16 port map (
    z => zy,
    a => y,
    y => y_Zerador
  );
	
	-- Inversorsor X
	  inversorX: inversor16 port map (
		z  => nx,
		a  => x_Zerador,
		y  => x_Inversor 
	);

	--Inversor Y
	  inversorY: inversor16 port map (
		z  => ny,
		a  => y_Zerador,
		y  => y_Inversor 
	);

	-- And
	  andPort: And16 port map (
		a =>  x_Inversor,
		b =>  y_Inversor,
		q => saidaAND
	);

	-- Add

	  addPort: Add16B port map (
		a =>  x_Inversor,
		b =>  y_Inversor,
		q => saidaADD
	);

	-- Multiplexador:

	  mux1: Mux16 port map (
		a =>   saidaAND,
		b =>   saidaADD,
		sel => f1, 
		q => operacaoMux1 
	);

	  mux2: Mux16 port map (
		a =>   operacaoMux1,
		b =>  (x xor y),
		sel => f2, 
		q => operacaoMux2
	);

	--Inversor/ Saída:
	  inversor: inversor16 port map(
		z  => no,
		a  => operacaoMux2,                       
		y  => precomp 
	);

  
end architecture;
