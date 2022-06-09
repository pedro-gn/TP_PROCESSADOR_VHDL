----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:23:53 05/25/2022 
-- Design Name:    Leonardo Carneiro Freitas de Oliveira 
-- Module Name:    regDesloc_nb - Behavioral 
-- Registrador de deslocamento de 4 bits
-- A cada pulso de clock todos os bits são "empurrados" para a
-- direita e o bit da entrada é colocado na posição mais a esquerda.
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity regDesloc_nb is
	port ( entrada : in std_logic;
			 reset : in std_logic;
			 clk : in std_logic;
			 saida : out std_logic_vector(31 downto 0)
		  );			 
end regDesloc_nb;

architecture Behavioral of regDesloc_nb is
	signal s : std_logic_vector(32 downto 0);
	
	component flipflopD is
		port ( D, Reset, Clock : in std_logic ;
				 Qn : out std_logic;
				 Q : out std_logic);
	end component;	

begin

	s(32) <= entrada;
	saida <= s(31 downto 0);

	ff_generate : for i in 31 downto 0 generate
		ff : flipflopD port map (
			D => s(i+1),
			Reset => reset,
			Clock => clk,
			Q => s(i)
		);
	end generate ff_generate;


end Behavioral;
