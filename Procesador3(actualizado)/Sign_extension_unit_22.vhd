----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:42:59 10/24/2017 
-- Design Name: 
-- Module Name:    Sign_extension_unit_22 - Behavioral 
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

entity Sign_extension_unit_22 is
    Port ( disp22 : in  STD_LOGIC_VECTOR (21 downto 0);
           seu32 : out  STD_LOGIC_VECTOR (31 downto 0));
end Sign_extension_unit_22;

architecture Behavioral of Sign_extension_unit_22 is

begin

	process (disp22)
	
	begin
		if(disp22(21) = '0') then
			seu32 <= "0000000000" & disp22;
		else
			seu32 <= "1111111111" & disp22;
		end if;
		
	end process;

end Behavioral;

