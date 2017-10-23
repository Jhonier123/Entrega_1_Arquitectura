----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:35:38 10/19/2017 
-- Design Name: 
-- Module Name:    Procesador_2 - Behavioral 
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

entity Procesador_2 is
    Port ( CLK : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Result : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador_2;

architecture Behavioral of Procesador_2 is

	COMPONENT Register_Arithmetic_Logic
	PORT(
		In_Register : IN std_logic_vector(31 downto 0);
		rst1 : IN std_logic;   
      CLK : IN std_logic;		
		ALUResult : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT datapath
	PORT(
		reset : IN std_logic;
		CLK : IN std_logic;          
		instruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

SIGNAL im_rf: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

begin

	Inst_Register_Arithmetic_Logic: Register_Arithmetic_Logic PORT MAP(
		In_Register =>im_rf ,
		rst1 => rst,
      CLK =>CLK,
		ALUResult => Result 
	);
	
	Inst_datapath: datapath PORT MAP(
		reset => rst,
		CLK => CLK,
		instruction =>im_rf 
	);
	
end Behavioral;

