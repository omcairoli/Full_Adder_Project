----------------------------------------------------------------------------------------------------
-- File:	Full_Adder.vhd
-- Engineer:	Oscar Cairoli
-- Description: Full Adder using a behavioral architecture
-- OS:		Linux (Ubuntu) Terminal Command Lines with Digilent Adept and Basys2 FPGA:
--		$ djtgcfg enum
--		$ djtgcfg prog -d Basys2 -i 0 -f Full_Adder.vhd
----------------------------------------------------------------------------------------------------

-- Libraries
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity Declaration
-- Inputs & Outputs to outside world

entity Full_Adder is
	port (
		S	: out std_logic;
		C_Out	: out std_logic;
		x 	: in	std_logic;
		y	: in	std_logic;
		C_In	: in 	std_logic);
end Full_Adder;

-- Architecture Body
-- This is where we describe what occurs

architecture Full_Adder_Arc of Full_Adder is

-- Define signals
signal inputs	: std_logic_vector(2 downto 0);
signal outputs	: std_logic_vector(1 downto 0);

-- Begin statement goes after signals that are defined
-- and after components are instantiated. 
-- Note: We are not instantiating any signals in this design

begin
  
-- Combine inputs and outputs into std_logic_vector
inputs 	<= C_In & x & y;
C_Out	<= outputs(1);
S	<= outputs(0);

-- Process that determines output based on the inputs
-- Note the similarity between this and the Full Adder truth table
  
adder_proc : process(inputs)
begin
	case inputs is
		when "000" => outputs <= "00";
		when "001" => outputs <= "01";
		when "010" => outputs <= "01";
		when "011" => outputs <= "10";
		when "100" => outputs <= "01";
		when "101" => outputs <= "10";
		when "110" => outputs <= "10";
		when "111" => outputs <= "11";
		when others => outputs <= (others => 'X');
	end case;
end process adder_proc;
end Full_Adder_Arc;
		
	
