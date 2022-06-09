----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:23:33 06/09/2022 
-- Design Name:    Leonardo Carneiro Freitas de Oliveira
-- Module Name:    NOR32bits - Behavioral 
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

entity NOR32bits is

port(
	S : in std_logic_vector (31 downto 0)
	Saidaofc : out std_logic
);

end NOR32bits;

architecture Behavioral of NOR32bits is

component norde8 is
	port(
		e : in std_logic_vector (7 downto 0);
		saidade8 : out std_logic
	);
	end component;
	signal sinaldesaida1 : std_logic;
	signal sinaldesaida2 : std_logic;
	signal sinaldesaida3 : std_logic;
	signal sinaldesaida4 : std_logic;

begin
	norde8.1 norde8 port map(
		
	);

end Behavioral;

