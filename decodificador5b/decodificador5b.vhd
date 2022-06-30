----------------------------------------------------------------------------------

-- Create Date:    11:59:15 06/23/2022 
-- Design Name: 
-- Module Name:    decodificador5b - Behavioral 
-- Project Name: 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decodificador5b is
	port(
		ENDERECOESC : in std_logic_vector(4 downto 0);
		SAIDA : out std_logic_vector(31 downto 0)
	);
end decodificador5b;

architecture Behavioral of decodificador5b is

begin

process(ENDERECOESC)
begin
	for i in 0 to 31 loop
		if(to_integer(unsigned(ENDERECOESC)) = i) then
			SAIDA(to_integer(unsigned(ENDERECOESC))) <= '1';
		else
			SAIDA(to_integer(unsigned(ENDERECOESC))) <= '0';
		end if;
	end loop;
end process;

end Behavioral;


