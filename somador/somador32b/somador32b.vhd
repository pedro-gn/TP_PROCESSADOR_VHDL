----------------------------------------------------------------------------------

-- Create Date:    12:42:48 07/01/2022 
-- Design Name: 
-- Module Name:    somador32b - Behavioral 
-- Project Name:   somador32b

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity somador32b is
	port( A, B : in std_logic_vector(31 downto 0);
			SOMA : out std_logic_vector(31 downto 0);
			COUT : out std_logic);
end somador32b;

architecture Behavioral of somador32b is
	component somador1b is
			port ( A,B,CIN : in std_logic;
				SOMA,COUT : out std_logic);
	end component;
	
	
	signal SCOUTS : std_logic_vector(31 downto 0 );

	
begin


	--Relaciona o registrador 0 e 31
	SOMADOR0 : somador1b port map (
		A => A(0),
		B => B(0),
		CIN => '0',
		SOMA => SOMA(0),
		COUT => SCOUTS(0)
	);
	
	SOMADOR31 : somador1b port map (
		A => A(31),
		B => B(31),
		CIN => SCOUTS(30),
		SOMA => SOMA(31),
		COUT => SCOUTS(31)
	);


	GEN_SOMADOR:
		for I in 1 to 30 generate 
				SOMADORES30TO1 : somador1b port map(
					A => A(I),
					B => B(I),
					SOMA => SOMA(I),
					CIN => SCOUTS(I- 1),
					COUT => SCOUTS(I)
				);
		end generate;
	
end Behavioral;

