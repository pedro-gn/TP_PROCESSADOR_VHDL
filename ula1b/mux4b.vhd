----------------------------------------------------------------------------------

-- Module Name:    mux4b - Behavioral 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux4b is
	port(A0,A1,A2,A3,SELECAO0,SELECAO1 : in std_logic;
		X : out std_logic);
end mux4b;

architecture Behavioral of mux4b is
	
	component mux2b is
		port(A,B,SELECAO : in std_logic;
		SAIDA : out std_logic);
	end component;
	
	signal SSAIDA0 : std_logic;
	signal SSAIDA1 : std_logic;
	
begin

	mux0 : mux2b port map (
		A => A0,
		B => A1,
		SELECAO => SELECAO0,
		SAIDA => SSAIDA0 );

	mux1 : mux2b port map (
		A => A2,
		B => A3,
		SELECAO => SELECAO0,
		SAIDA => SSAIDA1 );
		
	mux2 : mux2b port map (
		A => SSAIDA0,
		B => SSAIDA1,
		SELECAO => SELECAO1,
		SAIDA => X );
		
end Behavioral;

