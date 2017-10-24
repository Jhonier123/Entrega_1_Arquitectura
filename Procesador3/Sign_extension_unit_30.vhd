----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:19:03 10/24/2017 
-- Design Name: 
-- Module Name:    Sign_extension_unit_30 - Behavioral 
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

entity Sign_extension_unit_30 is
    Port ( disp30 : in  STD_LOGIC_VECTOR (29 downto 0);
           seu32 : out  STD_LOGIC_VECTOR (31 downto 0));
end Sign_extension_unit_30;

architecture Behavioral of Sign_extension_unit_30 is

begin
	process
	begin
		if(disp30(29) = '0') then
			seu32 <= "00" & disp30;
		else
			seu32 <= "11" & disp30;
		end if;
		
	end process;

end Behavioral;

