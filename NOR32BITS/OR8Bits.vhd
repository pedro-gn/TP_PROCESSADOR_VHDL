----------------------------------------------------------------------------------

-- Module Name:    norde8 - Behavioral 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR8Bits is

	port( A : in std_logic_vector (7 downto 0);
		 SAIDA : out std_logic);
		 
end OR8Bits;

architecture Behavioral of OR8Bits is

component OR4Bits is

	port(A0 : in std_logic;
		A1 : in std_logic;
		A2 : in std_logic;
		A3 : in std_logic;
		SAIDA : out std_logic);

	end component;
	
	signal SINALSAIDA0: std_logic;
	signal SINALSAIDA1 : std_logic;

begin

	or4b0: OR4Bits port map(
		A0 => A(0),
		A1 => A(1),
		A2 => A(2),
	   A3 => A(3),
		SAIDA => SINALSAIDA0
	); 
	
	or4b1: OR4Bits port map(
		A0 => A(4),
		A1 => A(5),
		A2 => A(6),
	   A3 => A(7),
		SAIDA => SINALSAIDA1
	); 
	
	SAIDA <= SINALSAIDA0 or SINALSAIDA1;
	

end Behavioral;
