----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:02:00 10/05/2017 
-- Design Name: 
-- Module Name:    Register_File - Behavioral 
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
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Register_File is
    Port ( rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           rd : in  STD_LOGIC_VECTOR (5 downto 0);
           DWR : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Register_File;


architecture Behavioral of Register_File is

type ram is array (39 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
signal registros : ram := (others => "00000000000000000000000000000000");

begin

   process (rs1,rs2,rd,DWR,rst)
	
	begin 
	    if (rst = '1') then
		     registros <= (others => "00000000000000000000000000000000");
			  crs1 <= (others => '0');
			  crs2 <= (others => '0');
		 else
		    if(rd /= "0000000") then
			    registros(conv_integer(rd)) <= DWR; -- a registros en la posicion rd le asigno el valor de DWR
			 end if;
			 crs1 <= registros(conv_integer(rs1));
			 crs2 <= registros(conv_integer(rs2));
		end if;
	end process;

end Behavioral;

