----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:41:58 10/18/2017 
-- Design Name: 
-- Module Name:    ProcessorStateRegister - Behavioral 
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


entity ProcessorStateRegister is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  nCWP : in  STD_LOGIC;
           NZVC : in  STD_LOGIC_VECTOR (3 downto 0);
           cwp : out  STD_LOGIC;
           C : out  STD_LOGIC);
end ProcessorStateRegister;

architecture Behavioral of ProcessorStateRegister is

begin
process (nCWP, NZVC, clk, reset)
begin
	if (reset= '1') then 
		c <= '0';
		cwp <= '0';
	else
		c <= NZVC(0);
		cwp <= nCWP;
	end if;
end process;


end Behavioral;

