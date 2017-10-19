----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:41:36 09/28/2017 
-- Design Name: 
-- Module Name:    MUXRFSEU - Behavioral 
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

entity MUXRFSEU is
    Port ( Crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           SEUimm : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
           Oper2 : out  STD_LOGIC_VECTOR (31 downto 0));
end MUXRFSEU;

architecture Behavioral of MUXRFSEU is

begin
process(i,Crs2,SEUimm)
begin

	if(i = '0') then
		Oper2 <= Crs2;
	else 
		Oper2 <= SEUimm;
	end if;
end process;	


end Behavioral;

