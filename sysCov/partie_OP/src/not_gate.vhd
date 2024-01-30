--***********************************************************************************--
--                                   ENSA FES
--                 PROJET D'EVALUATION: CIRCUITS REPROGRAMMABLES & VHDL 

--***********************************************************************************--
--Title  : 
--Block  : Porte Non(Inverseur)
              

--***********************************************************************************--
--File   : not_gate
--Author : DODO MAMANE ABARI
--CREATED: Août 2020

--***********************************************************************************--
--DESCRIPTION OF THE BLOCK
--Porte not ou inverseur. Il inverse l'entrée codé sur un bit.
--***********************************************************************************--
--                                  LIBRARIES USED
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

--***********************************************************************************--
--                                  ENTITY DECLARATION                                   
ENTITY not_gate IS
    PORT(
        input:IN STD_LOGIC;
        output:OUT STD_LOGIC);
END not_gate;
--***********************************************************************************--
--                                  RTL DECLARATION                                      
ARCHITECTURE rtl OF not_gate IS
    BEGIN
        output<=NOT input;
END rtl;
--***********************************************************************************--
                                      