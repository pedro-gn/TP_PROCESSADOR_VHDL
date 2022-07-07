----------------------------------------------------------------------------------

-- Create Date:    14:37:45 07/01/2022 
-- Design Name: 
-- Module Name:    ula1b - Behavioral 
-- Project Name: ula1b

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ula1b is
	port (
		A,B,CIN,LESS : in std_logic;
		OP : in std_logic_vector(3 downto 0);
		COUT,RESULT,SET : out std_logic
	);
end ula1b;

architecture Behavioral of ula1b is

	component mux4b is 
		port( A0,A1,A2,A3,SELECAO0,SELECAO1 : in std_logic;
		X : out std_logic);
	end component;
	
	component mux2b is
		port(A,B,SELECAO : in std_logic;
		SAIDA : out std_logic);
	end component;
	
	component  somador1b is 
		port(A,B,CIN : in std_logic;
			SOMA,COUT : out std_logic);
	end component;
	
	
	
	--Sinal de a depois de passar pelo mux.Pode ser A ou !A
	signal SA :  std_logic;
	--Sinal de B depois de passar pelo mux.Pode ser B ou !B
	signal SB :  std_logic;
	--Sinal das expressoes logicas AandB  AorB
	signal SAANDB : std_logic;
	signal SAORB : std_logic;
	--Resultado do samador de 1 bit
	signal SSOMA :  std_logic;
	
	
begin

	SAANDB <= SA and SB;
	SAORB <= SA or SB;

	mux2bA : mux2b port map(
		A => A,
		B => not A,
		SELECAO => OP(3),
		SAIDA => SA
	);
	mux2bB : mux2b port map(
		A => B,
		B => not B,
		SELECAO => OP(2),
		SAIDA => SB
	);
	
	
	somador1b0 : somador1b port map(
		A => SA,
		B => SB,
		CIN => CIN,
		COUT => COUT,
		SOMA => SSOMA
	
	);

	mux4b0 : mux4b port map(
		A0 => SAANDB,
		A1 => SAORB,
		A2 => SSOMA,
		A3 => LESS,
		SELECAO0 => OP(0),
		SELECAO1 => OP(1),
		X=> RESULT
		);
	
	
end Behavioral;

