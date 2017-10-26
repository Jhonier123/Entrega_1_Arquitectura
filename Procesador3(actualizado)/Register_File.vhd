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
-- Modificado
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Register_File is
    Port ( nrs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           nrd : in  STD_LOGIC_VECTOR (5 downto 0);
           DATATOREG : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
			  WE : in STD_LOGIC;
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0);
			  cRD : out STD_LOGIC_VECTOR (31 downto 0));
end Register_File;


architecture Behavioral of Register_File is

type ram is array (39 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
signal registros : ram := (others => "00000000000000000000000000000000");

begin

   process (nrs1,nrs2,nrd,DATATOREG,rst, WE)
	
	begin 
	    if (rst = '1') then
		     registros <= (others => "00000000000000000000000000000000");
			  crs1 <= (others => '0');
			  crs2 <= (others => '0');
		 else
		    if((nrd /= "0000000") and (WE = '1')) then
			    registros(conv_integer(nrd)) <= DATATOREG; -- a registros en la posicion rd le asigno el valor de DWR
			 end if;
			 crs1 <= registros(conv_integer(nrs1));
			 crs2 <= registros(conv_integer(nrs2));
			 cRD <= registros(conv_integer(nrd));
		end if;
	end process;

end Behavioral;

