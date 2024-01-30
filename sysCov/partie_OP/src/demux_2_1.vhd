--***********************************************************************************--
--                                     ENSA FES
--                 PROJET D'EVALUATION: CIRCUITS REPROGRAMMABLES & VHDL 

--***********************************************************************************--
--Title  : 
--Block  : Demultiplexeur 1 vers 2
              

--***********************************************************************************--
--File   : demux_2_1
--Author : DODO MAMANE ABARI
--CREATED: Août 2020


--***********************************************************************************--
--DESCRIPTION OF THE BLOCK
-- demultiplexeur 1 vers 2. reçoit en entrée une donnée sur 16 bits et produit en
--sortie deux données jour1 et jour2 codée sur 8 bits contenant respectivement 
--au MSB et LSB de la donnée d'entrée. Pour obtenir une des valeurs en sortie on doit 
--mettre demux_sel à 0 ou 1 selon la valeur qu'on veut avoir entre jour1 et jour2.

--***********************************************************************************--
--                              LIBRARIES USED
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

--***********************************************************************************--
--                              ENTITY DECLARATION

ENTITY demux_2_1 IS
    PORT(
        input:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        sel  :IN STD_LOGIC;
        output1:OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        output2:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END demux_2_1;

--***********************************************************************************--
--                               RTL DECLARATION

ARCHITECTURE rtl OF demux_2_1 IS
    BEGIN 
        output1<=input(7 DOWNTO 0) WHEN sel='0';
        output2 <=input(15 DOWNTO 8) WHEN sel='1';
   END rtl;

--***********************************************************************************--