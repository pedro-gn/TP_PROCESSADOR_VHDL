----------------------------------------------------------------------------------

-- Create Date:    11:23:33 06/23/2022 
-- Design Name: 
-- Module Name:    flipFlopD - Behavioral 
-- Project Name: flipFlopD

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use IEEE.NUMERIC_STD.ALL;


entity flipFlopD is
	port (
		CLOCK,RESET,D,ENABLE : in std_logic;
		Q : out std_logic
	);
end flipFlopD;

architecture Behavioral of flipFlopD is
	
begin

process (CLOCK, RESET)
	begin
		if RESET='1' then   
			Q <= '0';
		elsif (rising_edge(CLOCK)) then 
			if ENABLE = '1' then 
				Q <= D;
			end if; 
		end if;
end process;

end Behavioral;



