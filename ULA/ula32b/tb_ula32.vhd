--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:46:13 06/22/2022
-- Design Name:   
-- Module Name:   /var/scratch/labhardware/ula32/tb_ula32.vhd
-- Project Name:  ula32
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ULA32
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_ula32 IS
END tb_ula32;
 
ARCHITECTURE behavior OF tb_ula32 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ULA32
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         Result : OUT  std_logic_vector(31 downto 0);
         zero : OUT  std_logic;
         OP : IN  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal OP : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Result : std_logic_vector(31 downto 0);
   signal zero : std_logic;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ULA32 PORT MAP (
          A => A,
          B => B,
          Result => Result,
          zero => zero,
          OP => OP
        );

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 100 ns;

		-- AND
		OP <= "0000";      
		A <= x"FFFFFFFF";
		B <= x"FFFFFFFF";
		wait for 10 ns;
		assert Result = x"FFFFFFFF" report "AND 1.1" & CR & LF severity WARNING;		
		A <= x"FFFFFFFF";
		B <= x"00000000";
		wait for 10 ns;		
		assert Result = x"00000000" report "AND 1.0" & CR & LF severity WARNING;		
		A <= x"00000000";
		B <= x"00000000";
		wait for 10 ns;		
		assert Result = x"00000000" report "AND 0.0" & CR & LF severity WARNING;		

		-- OR
		OP <= "0001";
		A <= x"FFFFFFFF";
		B <= x"FFFFFFFF";
		wait for 10 ns;			
		assert Result = x"FFFFFFFF" report "OR 1+1" & CR & LF severity WARNING;		
		A <= x"FFFFFFFF";
		B <= x"00000000";
		wait for 10 ns;		
		assert Result = x"FFFFFFFF" report "OR 1+0" & CR & LF severity WARNING;				
		A <= x"00000000";
		B <= x"00000000";
		wait for 10 ns;		
		assert Result = x"00000000" report "OR 0+0" & CR & LF severity WARNING;				

		-- NOR
		OP <= "1100";
		A <= x"FFFFFFFF";
		B <= x"FFFFFFFF";
		wait for 10 ns;		
		assert Result = x"00000000" report "NOR (1+1)'" & CR & LF severity WARNING;				
		A <= x"FFFFFFFF";
		B <= x"00000000";
		wait for 10 ns;		
		assert Result = x"00000000" report "NOR (1+0)'" & CR & LF severity WARNING;						
		A <= x"00000000";
		B <= x"00000000";
		wait for 10 ns;		
		assert Result = x"FFFFFFFF" report "NOR (0+0)'" & CR & LF severity WARNING;						
		
		-- Soma
		OP <= "0010";		
		A <= x"00000000";
		B <= x"FFFFFFFF";
		wait for 10 ns;		
		assert Result = x"FFFFFFFF" report "Soma 0 + (-1)" & CR & LF severity WARNING;						
		A <= x"00000001";
		B <= x"FFFFFFFF";
		wait for 10 ns;		
		assert Result = x"00000000" report "Soma 1 + (-1)" & CR & LF severity WARNING;						
		A <= x"FFFFFFFF";
		B <= x"FFFFFFFF";
		wait for 10 ns;		
		assert Result = x"FFFFFFFE" report "Soma -1 + (-1)" & CR & LF severity WARNING;						
		A <= x"0000000A"; -- 10
		B <= x"FFFFFFEC"; -- -20
		wait for 10 ns;		
		assert Result = x"FFFFFFF6" report "Soma 10 + (-20)" & CR & LF severity WARNING;						
		A <= x"FFFFFFEC"; -- -20
		B <= x"0000000A"; -- 10
		wait for 10 ns;		
		assert Result = x"FFFFFFF6" report "Soma -20 + 10" & CR & LF severity WARNING;						
				
		-- Subtracao
		OP <= "0110";
		A <= x"00000000";
		B <= x"FFFFFFFF";
		wait for 10 ns;		
		assert Result = x"00000001" report "Subtracao 0 - (-1)" & CR & LF severity WARNING;						
		A <= x"00000001";
		B <= x"FFFFFFFF";
		wait for 10 ns;		
		assert Result = x"00000002" report "Subtracao 1 - (-1)" & CR & LF severity WARNING;						
		A <= x"FFFFFFFF"; 
		B <= x"FFFFFFFF";
		wait for 10 ns;		
		assert Result = x"00000000" report "Subtracao -1 - (-1)" & CR & LF severity WARNING;								
		A <= x"0000000A"; -- 10
		B <= x"FFFFFFEC"; -- -20
		wait for 10 ns;		
		assert Result = x"0000001E" report "Subtracao 10 - (-20)" & CR & LF severity WARNING;						
		A <= x"FFFFFFEC"; -- -20
		B <= x"0000000A"; -- 10
		wait for 10 ns;		
		assert Result = x"FFFFFFE2" report "Subtracao -20 - (10)" & CR & LF severity WARNING;						
		
		-- SLT
		OP <= "0111";
		A <= x"00000000";
		B <= x"FFFFFFFF";
		wait for 10 ns;		
		assert Result = x"00000000" report "Comparacao 0 < -1" & CR & LF severity WARNING;						
		A <= x"00000000";
		B <= x"0000000F";
		wait for 10 ns;		
		assert Result = x"00000001" report "Comparacao 0 < 15" & CR & LF severity WARNING;						
		A <= x"FFFFFFFF";
		B <= x"00000000";
		wait for 10 ns;		
		assert Result = x"00000001" report "Comparacao -1 < 0" & CR & LF severity WARNING;						
		A <= x"FFFFFFFF";
		B <= x"FFFFFFFF";
		wait for 10 ns;		
		assert Result = x"00000000" report "Comparacao -1 < -1" & CR & LF severity WARNING;						
		
		wait;
		
		
   end process;

END;
