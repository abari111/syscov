--*********************************************************************************--
--                               ENSA FES
--              PROJET D'EVALUATION: CIRCUITS REPROGRAMMABLES & VHDL 

--*********************************************************************************--
              --Title  : 
              --Block  : Comparateur d'égalité
              

--*********************************************************************************--
              --File   : compare_4bits
              --Author : DODO MAMANE ABARI
              --CREATED: Août 2020


--*********************************************************************************--
--DESCRIPTION OF THE BLOCK
--le comparateur 4 bits prend en entrée deux données codées sur 4 bits et produit  
--en sortie un signal qui est égal à un si les données sont identiques 0 sinon

--*********************************************************************************--
--                              LIBRARIES USED

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

--*********************************************************************************--
--                              ENTITY DECLARATION

ENTITY compare_4bits IS
    PORT(
        data1:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        data2:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        egal:OUT STD_LOGIC);
END compare_4bits;

--*********************************************************************************--
--                              RTL DECLARATION

ARCHITECTURE rtl OF compare_4bits IS
    BEGIN
        egal<='1' WHEN data1=data2 ELSE
              '0';
END rtl;

--*********************************************************************************--