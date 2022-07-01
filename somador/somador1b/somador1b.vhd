----------------------------------------------------------------------------------

-- Create Date:    11:53:40 06/30/2022 
-- Design Name: 
-- Module Name:    somador1b - Behavioral 
-- Project Name: somador 1bits

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity somador1b is
	port(
		A,B : in std_logic;
		SOMA,COUT : out std_logic
	);
	
end somador1b;

architecture Behavioral of somador1b is

begin
	SOMA <= A xor B xor CIN;
	COUT <= (A and B) or (A and CIN) or (B and CIN);

end Behavioral;

