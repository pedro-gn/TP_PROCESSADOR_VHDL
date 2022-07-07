----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:36:28 07/07/2022 
-- Design Name: 
-- Module Name:    ula32b - Behavioral 
-- Project Name:   ula32b

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ula32b is
	port(A,B : in std_logic_vector(31 downto 0);
			OP : in std_logic_vector(3 downto 0);
			RESULTADO : out std_logic_vector(31 downto 0) );
			
end ula32b;

architecture Behavioral of ula32b is
	component ula1b is
		port (A,B,CIN,LESS : in std_logic;
				OP : in std_logic_vector(3 downto 0);
				COUT,RESULT,SET : out std_logic );
		end component;
begin
	---TODO GEN ULA

end Behavioral;

