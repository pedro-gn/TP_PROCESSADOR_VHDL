----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:42:33 06/09/2022 
-- Design Name: 
-- Module Name:    norde8 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity norde8 is
port(
 e : in std_logic_vector (7 downto 0);
 saidade8 : out std_logic
);
end norde8;

architecture Behavioral of norde8 is
component or4bits is
	port(entrada0 : in std_logic;
		entrada1 : in std_logic;
		entrada2 : in std_logic;
		entrada3 : in std_logic;
		saida : out std_logic
		
	);
	end component; 
	signal sinalsaida1 : std_logic;
	signal sinalsaida2 : std_logic;

begin
	or4bits1: or4bits port map(
		entrada0 => e(0),
		entrada1 => e(1),
		entrada2 => e(2),
	   entrada3 => e(3),
		saida => sinalsaida1
	); 
	or4bits2 : or4bits port map(
		entrada0 => e(4),
		entrada1 => e(5),
		entrada2 => e(6),
	   entrada3 => e(7),
		saida => sinalsaida2
	);
	
	saidade8 <= sinalsaida1 or sinalsaida2;
	
	

end Behavioral;

