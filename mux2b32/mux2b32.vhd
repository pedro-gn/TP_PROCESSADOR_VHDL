----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:02:14 06/30/2022 
-- Design Name: 
-- Module Name:    mux2b32 - Behavioral 
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


entity mux2b32 is
	port( E1 : in std_logic_vector (31 downto 0);
			E2 : in std_logic_vector (31 downto 0);
			selec : in std_logic;
			Saida : out std_logic;
end mux2b32;

architecture Behavioral of mux2b32 is
	component mux2b  is 
		port ( A,B,SELECAO : in std_logic;
				 SAIDA : out std_logic
				 );
	end component;
	
	signal ssignal : std_logic_vector (31 downto 0);
		

begin

gen_mux32:
	for I in 0 to 31 generate
		Mux32 : mux2b port map(
			A => E1(I),
			B => E2(I),
			SELECAO => selec,
			SAIDA => ssignal(I)
			);
	end generate;


end Behavioral;

