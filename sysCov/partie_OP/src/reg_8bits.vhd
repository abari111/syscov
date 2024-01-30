--***********************************************************************************--
--                                    ENSA FES
--                PROJET D'EVALUATION: CIRCUITS REPROGRAMMABLES & VHDL 

--***********************************************************************************--
--Title  : 
--Block  : Registre 8 bits
              

--***********************************************************************************--
--File   :reg_8bits
--Author :DODO MAMANE ABARI
--CREATED: Août 2020
--***********************************************************************************--
--DESCRIPTION OF THE BLOCK
-- registre parallèle 8 bits permet de stocker une donnée sur 8 bits lorsque son entrée
--d'activation est à 1.

--***********************************************************************************--
--                                 LIBRARIES USED
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
--***********************************************************************************--
--                                 ENTITY DECLARATION
ENTITY reg_8bits IS
    PORT(
        enable:IN STD_LOGIC;
        rst:IN STD_LOGIC;
        clk:IN STD_LOGIC;
        data_in:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        data_out:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END reg_8bits;
--***********************************************************************************--
--                                 RTL DECLARATION                                        

ARCHITECTURE rtl OF reg_8bits IS
    BEGIN
        PROCESS(clk)
            BEGIN
                IF(clk'EVENT AND clk='1') THEN
                    IF(rst='1') THEN
                        data_out<=(OTHERS=>'0');
                    ELSIF(enable='1') THEN
                        data_out<=data_in;
                    END IF;
                END IF;
        END PROCESS;
        
END rtl;
--***********************************************************************************--                                       