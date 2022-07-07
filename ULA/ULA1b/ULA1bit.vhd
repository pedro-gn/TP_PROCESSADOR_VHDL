----------------------------------------------------------------------------------
-- Create Date:    11:07:13 06/09/2022 
-- Design Name: 
-- Module Name:    ULA1bit - Behavioral 
-- Project Name: 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ULA1bit is
	port (	A : in std_logic;
				B : in std_logic;
				VEM1 : in std_logic;
				LESS : in std_logic;
				OP0,OP1,OP2,OP3 : in std_logic_vector(3 downto 0);
				RESULTADO : out std_logic;
				SET : out std_logic;
				VAI1 : out std_logic);
end ULA1bit;

architecture Behavioral of ULA1bit is

signal SAIDAMUX_A : std_logic;
signal SAIDAMUX_B : std_logic;
signal SAIDA_AND : std_logic;
signal SAIDA_OR : std_logic;
signal SAIDA_SOMADOR : std_logic;
signal A_INVERTE : std_logic;
signal B_INVERTE : std_logic;
signal NOT_A : std_logic;
signal NOT_B : std_logic;

begin
	
	NOT_A <= (not A);
	NOT_B <= (not B);
	
	muxA : mux2b port map( 
		A => A,
		B => NOT_A,
		SELECAO => ,
		SAIDA => SAIDAMUX_A);
	
	muxB : mux2b port map( 
		A => B,
		B => NOT_B,
		SELECAO => ,
		SAIDA => SAIDAMUX_B);
	
	SAIDA_AND <= (SAIAMUX_A and SAIDAMUX_B);
	SAIDA_OR <= (SAIAMUX_A or SAIDAMUX_B);
	
	somador : somadorcompleto port map(
		A => SAIDAMUX_A,
		B => SAIDAMUX_B,
		cin => VEM1,
		saida1 => SET,
		SAIDA_SOMADOR => saida1,
		saida2 => VAI1);
	
	mux4 : mux4b port map(
		A0 => SAIDA_AND,
		A1 => SAIDA_OR,
		A2 => SAIDA_SOMADOR,
		A3 => LESS,
		SELECAO0 => ,
		SELECAO1 => ,
		X => RESULTADO);

end Behavioral;

