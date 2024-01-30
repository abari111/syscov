--***********************************************************************************--
--                             ENSA FES
--           PROJET D'EVALUATION: CIRCUITS REPROGRAMMABLES & VHDL 

--***********************************************************************************--
--Title  : 
--Block  : Mémoire 16 bits
              

--***********************************************************************************--
--File   : memoire_16bits
--Author : DODO MAMANE ABARI
--CREATED: Août 2020


--***********************************************************************************--
--DESCRIPTION OF THE BLOCK
-- mémoire 16 bits construit à partir de deux registres parallèles 8 bits.

--***********************************************************************************----***********************************************************************************--
--                              LIBRARIES USED
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
--***********************************************************************************--
--                              ENTITY DECLARATION
ENTITY memoire_16bits IS
	PORT(
		clk     :IN STD_LOGIC;
		rst     :IN STD_LOGIC;
		enable  :IN STD_LOGIC;
		data_in  :IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		data_out:OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END memoire_16bits;

--***********************************************************************************--
--                             RTL DECLARATION
ARCHITECTURE rtl OF memoire_16bits IS
    COMPONENT reg_8bits IS
       PORT(
           enable:IN STD_LOGIC;
           rst:IN STD_LOGIC;
           clk:IN STD_LOGIC;
           data_in:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
           data_out:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    END COMPONENT;
    SIGNAL data1,data2:STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL en:STD_LOGIC;

    BEGIN
        reg_1:reg_8bits PORT MAP(enable,rst,clk,data_in,data1);
        reg_2:reg_8bits PORT MAP(enable,rst,clk,data1,data2);
        data_out<=data2&data1;
END rtl;
--***********************************************************************************--