--***********************************************************************************--
--                                 ENSA FES
--               PROJET D'EVALUATION: CIRCUITS REPROGRAMMABLES & VHDL 

--***********************************************************************************--
--Title  : 
--Block  : Decodeur 7 segments
              

--***********************************************************************************--
--File   : seven_sg
--Author : DODO MAMANE ABARI
--CREATED: Août 2020


--***********************************************************************************--
--DESCRIPTION OF THE BLOCK
-- Decodeur sept segments produit les sorties necessaires pour afficher les chiffres de
-- 0 à 9 sur un afficheur 7 segments.

--***********************************************************************************--
--                                 LIBRARIES USED
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
--***********************************************************************************--
--                                 ENTITY DECLARATION                                      
ENTITY seven_sg IS
   PORT(
       data   : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
       control    : IN STD_LOGIC;
       seg_out: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END seven_sg;
--***********************************************************************************--
--                                 RTL DECLARATION                                     
ARCHITECTURE rtl OF seven_sg IS
    
    BEGIN 
         
         PROCESS(data,control)
             
             BEGIN 
                 CASE data IS
                 
                 WHEN "0000" => 
                             IF(control='1') THEN seg_out<="1111110";
                             ELSIF(control='0') THEN seg_out<=not("1111110");
                             END IF;
                 WHEN "0001" => 
                             IF(control='1') THEN seg_out<="0110000";
                             ELSIF(control='0') THEN seg_out<=not("0110000");
                             END IF;
                 WHEN "0010" => 
                             IF(control='1') THEN seg_out<="1101101";
                             ELSIF(control='0') THEN seg_out<=not("1101101");
                             END IF;
                 WHEN "0011" => 
                             IF(control='1') THEN seg_out<="1111001";
                             ELSIF(control='0') THEN seg_out<=not("1111001");
                             END IF;
                             
                 WHEN "0100" => 
                             IF(control='1') THEN seg_out<="0110011";
                             ELSIF(control='0') THEN seg_out<=not("0110011");
                             END IF;
                
                WHEN "0101" => 
                             IF(control='1') THEN seg_out<="1011011";
                             ELSIF(control='0') THEN seg_out<=not("1011011");
                             END IF; 
                             
                WHEN "0110" => 
                             IF(control='1') THEN seg_out<="1011111";
                             ELSIF(control='0') THEN seg_out<=not("1011111");
                             END IF; 
                
                WHEN "0111" => 
                             IF(control='1') THEN seg_out<="1110000";
                             ELSIF(control='0') THEN seg_out<=not("1110000");
                             END IF; 
                
                WHEN "1000" => 
                             IF(control='1') THEN seg_out<="1111001";
                             ELSIF(control='0') THEN seg_out<=not("1111110");
                             END IF; 
                             
                WHEN "1001" => 
                             IF(control='1') THEN seg_out<="1111011";
                             ELSIF(control='0') THEN seg_out<=not("1111011");
                             END IF;
                WHEN OTHERS => seg_out<=(OTHERS=>'0');
                END CASE;
        END PROCESS;
END rtl;
--***********************************************************************************--                               