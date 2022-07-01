----------------------------------------------------------------------------------

-- Create Date:    11:42:49 06/09/2022 
-- Design Name: 
-- Module Name:    mux2b - Behavioral MUX 2 ENTRADAS DE 5 BITS

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUSX2E5B is
	port(A : in std_logic_vector ( 4 downto 0);
		B : in std_logic_vector ( 4 downto 0);
		SELECAO : in std_logic;
		SAIDA : out std_logic_vector ( 4 downto 0)
	);
	
end MUSX2E5B;

architecture Behavioral of MUSX2E5B is

begin
process(SELECAO, A, B )
	begin
	case(SELECAO) is
		when'0' => SAIDA <= A;
		when'1' => SAIDA <= B;
		when others => SAIDA <= A; 
		
	end case;
end process;


end Behavioral;
