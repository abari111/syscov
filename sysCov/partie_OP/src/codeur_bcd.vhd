--***********************************************************************************--
--                                        ENSA FES
--                          PROJET D'EVALUATION: CIRCUITS REPROGRAMMABLES & VHDL 

--***********************************************************************************--
--Title  : 
--Block  : Codeur BCD
              
--***********************************************************************************--
--File   : codeur_bcd
--Author : DODO MAMANE ABARI
--CREATED: Août 2020

--***********************************************************************************--
--DESCRIPTION OF THE BLOCK
--le codeur BCD est un circuit combinatoire qui prend en entrée une donnée sur 10 bits 
--est la convertit en BCD.

--***********************************************************************************--
--                              LIBRARIES USED

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

--***********************************************************************************--
--                              ENTITY DECLARATION

ENTITY codeur_bcd IS
    PORT(
        data_in:IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        data_out:OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END codeur_bcd;

--***********************************************************************************--
--                        RTL DECLARATION

ARCHITECTURE rtl OF codeur_bcd IS
    
    BEGIN 
        WITH data_in SELECT 
        data_out <="0000" WHEN "1000000000",
                   "0001" WHEN "0100000000",
                   "0010" WHEN "0010000000",
                   "0011" WHEN "0001000000", 
                   "0100" WHEN "0000100000",
                   "0101" WHEN "0000010000",
                   "0110" WHEN "0000001000",
                   "0111" WHEN "0000000100",
                   "1000" WHEN "0000000010",
                   "1001" WHEN "0000000001",
                   "ZZZZ" WHEN OTHERS;
END rtl;

--***********************************************************************************--     