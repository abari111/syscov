--**************************************************************************************--
--                                   ENSA FES
--                 PROJET D'EVALUATION: CIRCUITS REPROGRAMMABLES & VHDL 

--**************************************************************************************--
--Title  : 
--Block  : Partie De Contrôle
              

--**************************************************************************************--
--File   : control_part
--Author : DODO MAMANE ABARI
--CREATED: Août 2020


--**************************************************************************************--
--DESCRIPTION OF THE BLOCK
-- La partie contrôle génère les signaux necessaires à la partie opérative pour opérer
--**************************************************************************************--
--                                 LIBRARIES USED
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
--**************************************************************************************--
--                                 ENTITY DECLARATION

ENTITY control_part IS
    PORT(
        rst       :IN STD_LOGIC;
        clk       :IN STD_LOGIC;
        timer     :IN STD_LOGIC;
        indicateur:IN STD_LOGIC;
        comp_sig  :IN STD_LOGIC;
        en_reg4   :OUT STD_LOGIC;
        en_reg8   :OUT STD_LOGIC;
        en_mem    :OUT STD_LOGIC;
        sel       :OUT STD_LOGIC;
        rst_reg8  :OUT STD_LOGIC;
        en_compt  :OUT STD_LOGIC;
        rst_compt :OUT STD_LOGIC);
    END control_part;
--**************************************************************************************--   
--               RTL DECLARATION    

ARCHITECTURE rtl OF control_part IS
      
      TYPE state IS(S0,S1,S2,S3,S4);
      SIGNAL c_state:state:=S0;
      SIGNAL n_state:state;
      
      BEGIN
    
    memoire:PROCESS(clk)
           BEGIN
               IF(clk'EVENT AND clk='1') THEN
                   IF(rst='1') THEN
                   c_state<=S0;
                   ELSE c_state<=n_state;
                   END IF;
               END IF;
           END PROCESS;
           
    etat_suivant:PROCESS(timer,comp_sig,indicateur,c_state)
                BEGIN
                    CASE c_state IS
                        WHEN S0 =>
                                IF(timer='1') THEN
                                    n_state<=S1;
                                    ELSE n_state<=S0;
                                END IF;
                        WHEN S1 =>
                                 IF(timer='0' OR (timer='1' AND comp_sig='1')) THEN
                                      n_state<=S2;
                                 ELSE n_state<=S1;
                                 END IF;
                        WHEN S2 =>
                                 n_state<=S3;
                        WHEN S3 =>
                                 IF(timer='0') THEN n_state<=S4;
                                 ELSIF(indicateur='1') THEN n_state<=S1;
                                 ELSE n_state<=S3;
                                 END IF;
                        WHEN S4 =>
                                 n_state<=S0;
                                 
                       END CASE;
                   END PROCESS;
             
    sortie:PROCESS(c_state)
             BEGIN
                 CASE c_state IS
                        WHEN S0 =>
                                   en_reg4<='1';
                                   en_compt<='0';
                                   en_reg8<='0';
                                   en_mem<='0';
                                   sel<='0';
                                   rst_compt<='0';
                                   rst_reg8<='1';
                        WHEN S1  =>
                                   en_reg4 <='0';
                                   en_compt<='1';
                                   rst_reg8<='0';
                                   en_reg8<='0';
                                   rst_compt<='0';
                        WHEN S2  =>
                                   en_reg8  <='0';
                                   sel      <='1';
                                   en_compt <='0';
                                   rst_compt<='0';
                        WHEN S3  =>
                                   en_compt<='0';
                                   en_reg8<='1';
                                   sel<='0';
                                   rst_compt<='1';
                        WHEN S4  =>
                                   en_reg8<='0';
                                   en_mem <='1';
                                   rst_compt<='1';
                   END CASE;
               END PROCESS;
   END rtl;
 --**************************************************************************************--                                     
                                         
                                               
                                     
                                
                                    
                          
        
        