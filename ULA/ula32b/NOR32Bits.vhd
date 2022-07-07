----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:53:14 06/23/2022 
-- Design Name: 
-- Module Name:    nor32bits - Behavioral 
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

entity NOR32Bits is

	port( e : in std_logic_vector ( 31 downto 0);
	s : out std_logic);

end NOR32Bits;

architecture Behavioral of NOR32Bits is

component OR8Bits is

	port(
		A : in std_logic_vector (7 downto 0);
		 SAIDA : out std_logic);
	
	end component;
	
	signal ssinal0: std_logic;
	signal ssinal1: std_logic;
	signal ssinal2: std_logic;
	signal ssinal3: std_logic;

begin

	or8b0 : OR8Bits port map(
		A(0) => e(0),
		A(1) => e(1),
		A(2) => e(2),
		A(3) => e(3),
		A(4) => e(4),
		A(5) => e(5),
		A(6) => e(6),
		A(7) => e(7),
		SAIDA => ssinal0
		
);

	or8b1 : OR8Bits port map(
		A(0) => e(8),
		A(1) => e(9),
		A(2) => e(10),
		A(3) => e(11),
		A(4) => e(12),
		A(5) => e(13),
		A(6) => e(14),
		A(7) => e(15),
		SAIDA => ssinal1
	);
	
	or8b2 : OR8Bits port map(
		A(0) => e(16),
		A(1) => e(17),
		A(2) => e(18),
		A(3) => e(19),
		A(4) => e(20),
		A(5) => e(21),
		A(6) => e(22),
		A(7) => e(23),
		SAIDA => ssinal2
);

	or8b3 : OR8Bits port map(
		A(0) => e(24),
		A(1) => e(25),
		A(2) => e(26),
		A(3) => e(27),
		A(4) => e(28),
		A(5) => e(29),
		A(6) => e(30),
		A(7) => e(31),
		SAIDA => ssinal3
		);
		
		s <= not(ssinal0 or ssinal1 or ssinal2 or ssinal3);

end Behavioral;


