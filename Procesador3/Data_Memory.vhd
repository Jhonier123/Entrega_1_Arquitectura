----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:23:25 10/24/2017 
-- Design Name: 
-- Module Name:    Data_Memory - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Data_Memory is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           RDENMEM : in  STD_LOGIC;
           WRENMEM : in  STD_LOGIC;
           cRD : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUresult : in  STD_LOGIC_VECTOR (31 downto 0);
           DATATOMEM : out  STD_LOGIC_VECTOR (31 downto 0));
end Data_Memory;

architecture Behavioral of Data_Memory is

type ram_type is array (0 to 63) of std_logic_vector (31 downto 0);
signal ram_Memory : ram_type := (others => "00000000000000000000000000000000");

begin

	Process(clk, reset, RDENMEM,WRENMEM,cRD,ALUresult)
	begin 
		if(reset = '1') then
			DATATOMEM <= (others => '0');
			ram_Memory <= (others => "00000000000000000000000000000000");
		else
			if(rising_edge(clk)) then 
				if(WRENMEM = '1') then 
					ram_Memory(conv_integer(ALUresult(5 downto 0))) <= cRD;
				else
					if(RDENMEM = '1') then
						DATATOMEM <= ram_Memory(conv_integer(ALUresult(5 downto 0)));
					end if;
				end if;
			end if;
		end if;
	
	end process;
					

end Behavioral;

