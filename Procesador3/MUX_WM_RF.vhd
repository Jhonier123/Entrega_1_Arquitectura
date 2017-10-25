----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:17:45 10/24/2017 
-- Design Name: 
-- Module Name:    MUX_WM_RF - Behavioral 
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


entity MUX_WM_RF is
    Port ( RD : in  STD_LOGIC_VECTOR (5 downto 0);
           num15 : in  STD_LOGIC_VECTOR (5 downto 0);
           RFDEST : in  STD_LOGIC;
           nRD : out  STD_LOGIC_VECTOR (5 downto 0));
end MUX_WM_RF;

architecture Behavioral of MUX_WM_RF is

begin

	process(RD, num15, RFDEST)
	begin
	
		if(RFDEST = '0') then 
			nRD <= RD;
		elsif(RFDEST = '1') then
			nRD <= num15;
		end if;
		
	end process;

end Behavioral;

