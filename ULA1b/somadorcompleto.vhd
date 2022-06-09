----------------------------------------------------------------------------------

-- Create Date:    08:32:46 04/28/2022 
-- Design Name:    Caio Souza Valente
-- Module Name:    Somador Completo

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity somadorcompleto is
	port (	a : in std_logic;
				b : in std_logic;
				cin : in std_logic;
				saida1 : out std_logic;
				saida2 : out std_logic);
end somadorcompleto;

architecture Behavioral of somadorcompleto is

begin
	saida1 <= (a xor b xor cin);
	saida2 <= (a and b) or (a and cin) or (b and cin);
end Behavioral;

