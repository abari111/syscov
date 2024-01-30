--***********************************************************************************************************************************************
--                                        ENSA FES
--                          PROJET D'EVALUATION: CIRCUITS REPROGRAMMABLES & VHDL 

--***********************************************************************************************************************************************
              --Title : 
              --Block : Compteur modulo 16
              

--***********************************************************************************************************************************************
              --File   :compt_4bits
              --Author :DODO MAMANE ABARI
              --CREATED: Août 2020


--***********************************************************************************************************************************************
--DESCRIPTION OF THE BLOCK
-- compteur modulo 16 qui permet de compter de 0 à 15.
--avec remise à zero asynchrone

--***********************************************************************************************************************************************__
--                              LIBRARIES USED
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
--***********************************************************************************************************************************************
--                              ENTITY DECLARATION

ENTITY compt_4bits IS
    PORT(
        up    :IN STD_LOGIC;
        enable:IN STD_LOGIC;
        clk   :IN STD_LOGIC;
        rst   :IN STD_LOGIC;
        output:OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END compt_4bits;
--***********************************************************************************************************************************************
--                              RTL DECLARATION

ARCHITECTURE rtl OF compt_4bits IS
    SIGNAL temp:STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
    BEGIN
        PROCESS(clk,rst)
            BEGIN
                IF(rst='1') THEN temp<=(OTHERS=>'0');
                ELSIF(clk'EVENT AND clk='1') THEN
                    IF(enable='1') THEN
                        IF(up='1') THEN
                          temp<=temp+1;
                        END IF;
                        
                    END IF;
                END IF;
            END PROCESS;
            output<=temp;

END rtl;
--***********************************************************************************************************************************************                 
     
    
 



