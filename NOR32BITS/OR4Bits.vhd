----------------------------------------------------------------------------------

-- Module Name:    or4b - Behavioral 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR4Bits is

	port ( A0 : in std_logic;
		A1 : in std_logic;
		A2 : in std_logic;
		A3 : in std_logic;
		SAIDA : out std_logic );

end OR4Bits;

architecture Behavioral of OR4Bits is

begin

	saida <= A0 or A1 or A2 or A3;

end Behavioral;