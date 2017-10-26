----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:09:24 10/24/2017 
-- Design Name: 
-- Module Name:    MUX_DMalu - Behavioral 
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



entity MUX_DMalu is
    Port ( DATATOMEM : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUresult : in  STD_LOGIC_VECTOR (31 downto 0);
           PC : in  STD_LOGIC_VECTOR (31 downto 0);
           RFSOURCE : in  STD_LOGIC_VECTOR (1 downto 0);
           DATATOREG : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX_DMalu;

architecture Behavioral of MUX_DMalu is

begin
	process(DATATOMEM,ALUresult,PC,RFSOURCE)
	begin
		if(RFSOURCE = "00") then
			DATATOREG <= DATATOMEM;
		elsif(RFSOURCE = "01") then
			DATATOREG <= ALUresult;
			elsif(RFSOURCE = "10") then 
				DATATOREG <= PC;
			else
				DATATOREG <= (others => '0');
		end if;
		
	end process;

end Behavioral;

