----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:56:49 06/30/2022 
-- Design Name: 
-- Module Name:    mux2e5b - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2e5b is
	port(
		E1 : in std_logic_vector (4 downto 0);
		E2 : in std_logic_vector (4 downto 0);
		selec : in std_logic;
		S : out std_logic
		
	);
end mux2e5b;

architecture Behavioral of mux2e5b is

component mux2b is

	port(
		A,B,SELECAO : in std_logic;
		SAIDA : out std_logic
	);
	end component;
	
		signal ssignal0:std_logic;
		signal ssignal1:std_logic; 
		signal ssignal2:std_logic; 
		signal ssignal3:std_logic; 
		signal ssignal4:std_logic; 

begin

	mux2b0 : mux2b port map(
		A => E1(0),
		
		B => E2(0),
		
		SELECAO => selec,
		SAIDA => ssignal0
	);
	mux2b1 : mux2b port map(
		A => E1(1),
		
		B => E2(1),
		
		SELECAO => selec,
		SAIDA => ssignal1
	);
	mux2b2 : mux2b port map(
		A => E1(2),
		
		B => E2(2),
		
		SELECAO => selec,
		SAIDA => ssignal2
	);
	mux2b3 : mux2b port map(
		A => E1(3),
		
		B => E2(3),
		
		SELECAO => selec,
		SAIDA => ssignal3
	);
	mux2b4 : mux2b port map(
		A => E1(4),
		
		B => E2(4),
		
		SELECAO => selec,
		SAIDA => ssignal4
	);
	
	s <= ssignal0 or ssignal1 or ssignal2 or ssignal3 or ssignal4;

end Behavioral;

