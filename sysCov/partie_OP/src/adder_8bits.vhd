--***********************************************************************************--
--                              ENSA FES
--                PROJET D'EVALUATION: CIRCUITS REPROGRAMMABLES & VHDL 

--***********************************************************************************--
--Title  : 
--Block  : Additionneur 8 BITS.
              

--***********************************************************************************--
--File   : adder_8bits
--Author : DODO MAMANE ABARI
--CREATED: Aout 2020

--***********************************************************************************--
--DESCRIPTION OF THE BLOCK
--l'additionneur presentée ici est additionneur 8 bits mais sa particularité est que
-- il prend en entrée deux données une sur 8 bits et l'autre sur 4 bits est produit 
--une sortie sur 8 bits

--***********************************************************************************--
--                              LIBRARIES USED
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

--***********************************************************************************--
 --                             ENTITY DECLARATION                              
ENTITY adder_8bits IS
    PORT(
        data1:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        data2:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        result:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END adder_8bits;

--***********************************************************************************--
 --                             RTL DECLARATION
 
ARCHITECTURE rtl OF adder_8bits IS
    SIGNAL  temp:STD_LOGIC_VECTOR(7 DOWNTO 0);
    BEGIN
        temp<=data1+data2;
        result<=(OTHERS=>'0') WHEN temp="XXXXXXXX" ELSE
                 temp;
        
                
END rtl;
--***********************************************************************************--