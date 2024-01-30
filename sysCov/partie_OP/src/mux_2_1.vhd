--***********************************************************************************--
--                              ENSA FES
--            PROJET D'EVALUATION: CIRCUITS REPROGRAMMABLES & VHDL 

--***********************************************************************************--
--Title  : 
--Block  : Multiplexeur 2 vers 1
              
--***********************************************************************************--
--File   : mux_2_1
--Author : DODO MAMANE ABARI
--CREATED: Août 2020


--***********************************************************************************--
--DESCRIPTION OF THE BLOCK
--multiplexeur 2 vers 1.Il permet de selectionner une donnée parmi les deux presentées
--à son entrée.

--***********************************************************************************--
--                              LIBRARIES USED
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

--***********************************************************************************--
--                              ENTITY DECLARATION 

ENTITY mux_2_1 IS
    PORT(
        data1 :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        data2 :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        sel   :IN STD_LOGIC;
        output:OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END mux_2_1;

--***********************************************************************************--
--                              RTL DECLARATION        

ARCHITECTURE rtl OF mux_2_1 IS
    BEGIN
        output<=data1 WHEN sel='0' ELSE
                data2 WHEN sel='1';
END rtl;

--***********************************************************************************--