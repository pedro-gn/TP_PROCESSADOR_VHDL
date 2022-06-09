----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:58:41 06/09/2022 
-- Design Name: 	 Leonardo Carneiro Freitas de Oliveira
-- Module Name:    nOr32bits - Behavioral 
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

entity nOr32bits is

port ( entrada0 : in std_logic;
	entrada1 : in std_logic;
	entrada2 : in std_logic;
	entrada3 : in std_logic;
	saida : out std_logic
	
);

end nOr32bits;

architecture Behavioral of nOr32bits is

begin

saida <= entrada0 or entrada1 or entrada2 or entrada3;

end Behavioral;

