----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:36:28 07/07/2022 
-- Design Name: 
-- Module Name:    ula32b - Behavioral 
-- Project Name:   ula32b

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ula32b is
	port(A,B : in std_logic_vector(31 downto 0);
			OP : in std_logic_vector(3 downto 0);
			RESULT : out std_logic_vector(31 downto 0);
			ZERO : out std_logic
			);
			
end ula32b;

architecture Behavioral of ula32b is


	--ULA 1 Bit
	component ula1b is
		port (A,B,CIN,LESS : in std_logic;
				OP : in std_logic_vector(3 downto 0);
				COUT,RESULT,SET : out std_logic );
		end component;
		
		
		
	--NOR 32 Bits	
	component NOR32Bits is
		port(	e : in std_logic_vector ( 31 downto 0);
				s : out std_logic);
		end component;
	
		
		--Sinal Set da ultima ULA (31) que vai no less da primeira
		signal SSET31 : std_logic;
		
		--Sinal contendo os Couts de todas as ulas 
		signal SCOUTS : std_logic_vector(31 downto 0 );
		
		
begin

	--- TO DO 
	NOR32BITS1 : NOR32Bits port map(
		e => RESULT, --??
		s => ZERO
	);

	ULA31 : ula1b port map(
		--inputs
		A => A(31),
		B => B(31),
		CIN => SCOUTS(30),
		LESS => '0',
		OP => OP,
		--outputs
		RESULT => RESULT(31),
		COUT => SCOUTS(31),
		SET => SSET31 
);
	
	ULA0 : ula1b port map(
		--inputs
		A => A(0),
		B => B(0),
		CIN => '0',
		LESS => SSET31,
		OP => OP,
		--outputs
		RESULT => RESULT(0),
		COUT => SCOUTS(0)
		--SET
		);
		
		
	GEN_ULAS:
		for I in 1 to 30 generate 
				ULA30TO1 : ula1b port map(
					A => A(I),
					B => B(I),
					RESULT => RESULT(I),
					CIN => SCOUTS(I-1),
					COUT => SCOUTS(I),
					LESS => '0',
					--SET =>
					OP => OP
				);
		end generate;


end Behavioral;

