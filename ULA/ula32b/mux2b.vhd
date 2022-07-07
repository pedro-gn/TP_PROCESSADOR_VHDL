----------------------------------------------------------------------------------

-- Create Date:    11:42:49 06/09/2022 
-- Design Name: 
-- Module Name:    mux2b - Behavioral 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux2b is
	port(A,B,SELECAO : in std_logic;
		SAIDA : out std_logic
	);
	
end mux2b;

architecture Behavioral of mux2b is

begin
	saida <= (not SELECAO and A) or (SELECAO and B);
end Behavioral;

