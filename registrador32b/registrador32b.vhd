----------------------------------------------------------------------------------

-- Create Date:    11:36:14 06/23/2022 
-- Design Name: 
-- Module Name:    registrador32b - Behavioral 
-- Project Name:  flipFlopD

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use IEEE.NUMERIC_STD.ALL;


entity registrador32b is
	port(
		ENABLE : in std_logic;
		CLOCK : in std_logic;
		RESET : in std_logic;
		DATAIN : in std_logic_vector(31 downto 0);
		DATAOUT : out std_logic_vector(31 downto 0)
	);

end registrador32b;

architecture Behavioral of registrador32b is
	component flipFlopD is 
		port(
			CLOCK,RESET,D,ENABLE : in std_logic;
			Q : out std_logic
		);
		end component;
		
begin

GEN_REG:
   for I in 0 to 31 generate
		REG32 : flipFlopD port map(
			D => DATAIN(I),
			Q => DATAOUT(I),
			ENABLE => ENABLE,
			CLOCK => CLOCK,
			RESET => RESET
		);
   end generate;

end Behavioral;



