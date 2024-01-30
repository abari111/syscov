--****************************************************************************************--
--                                     ENSA FES
--                PROJET D'EVALUATION: CIRCUITS REPROGRAMMABLES & VHDL 

--****************************************************************************************--
--Title  : 
--Block  : Partie Operative
              

--****************************************************************************************--
--File   : operative_part
--Author : DODO MAMANE ABARI
--CREATED: Août 2020


--****************************************************************************************--
--DESCRIPTION OF THE BLOCK
--C'est la partie du circuit qui permet d'effectuer les operations necessaires pour 
--produire les sorties générales du circuit.

--****************************************************************************************--
--                                 LIBRARIES USED
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
--****************************************************************************************--
--                                 ENTITY DECLARATION

ENTITY operative_part IS
    PORT(
        clk       :IN STD_LOGIC;
        pwm_sig   :IN STD_LOGIC;
        en_mem    :IN STD_LOGIC;
        en_reg    :IN STD_LOGIC;
        en_reg8   :IN STD_LOGIC;
        rst_compt :IN STD_LOGIC;
        rst       :IN STD_LOGIC;
        en_compt  :IN STD_LOGIC;
        sel       :IN STD_LOGIC;
        demux_sel :IN STD_LOGIC;
        data      :IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        egal      :OUT STD_LOGIC;
        jour1     :OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        jour2     :OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        max_nb    :OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        current_nb:OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END operative_part;
--****************************************************************************************--
--                                   RTL DECLARATION     

ARCHITECTURE rtl OF operative_part IS
    COMPONENT codeur_bcd IS
        PORT(
        data_in:IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        data_out:OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END COMPONENT;
    
    COMPONENT reg_4bits IS
        PORT(
        enable:IN STD_LOGIC;
        rst:IN STD_LOGIC;
        clk:IN STD_LOGIC;
        data_in:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        data_out:OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END COMPONENT;
    
    COMPONENT compare_4bits IS
        PORT(
        data1:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        data2:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        egal:OUT STD_LOGIC);
    END COMPONENT;
    
    COMPONENT seven_sg IS
        PORT(
        data   : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        control    : IN STD_LOGIC;
        seg_out: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
    END COMPONENT;
    
    COMPONENT compt_4bits IS
        PORT(
        up    :IN STD_LOGIC;
        enable:IN STD_LOGIC;
        clk   :IN STD_LOGIC;
        rst   :IN STD_LOGIC;
        output:OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END COMPONENT;
    
    COMPONENT mux_2_1 IS
        PORT(
        data1 :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        data2 :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        sel   :IN STD_LOGIC;
        output:OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END COMPONENT;
    
    COMPONENT reg_8bits IS
        PORT(
        enable:IN STD_LOGIC;
        rst:IN STD_LOGIC;
        clk:IN STD_LOGIC;
        data_in:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        data_out:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    END COMPONENT;
    
    COMPONENT adder_8bits IS
        PORT(
        data1:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        data2:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        result:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    END COMPONENT;
    
    COMPONENT memoire_16bits IS
        PORT(
		     clk     :IN STD_LOGIC;
		     rst     :IN STD_LOGIC;
		     enable  :IN STD_LOGIC;
		     data_in  :IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		     data_out:OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
    END COMPONENT;
    
    COMPONENT demux_2_1 IS
        PORT(
        input:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        sel  :IN STD_LOGIC;
        output1:OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        output2:OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    END COMPONENT;
    COMPONENT not_gate IS
        PORT(
        input:IN STD_LOGIC;
        output:OUT STD_LOGIC);
    END COMPONENT;
    SIGNAL sortieBcd,dataFromReg,dataFromCompt,sig1:STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL dataFromReg8b1,dataFromReg8b2,result:STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL mem                 :STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL not_en_reg8:STD_LOGIC;
    BEGIN
    
       Codeur       :codeur_bcd      PORT MAP(data,sortieBcd);
       Registre4bit :reg_4bits       PORT MAP(en_reg,'0',clk,sortieBcd,dataFromReg);
       Affich1      :seven_sg        PORT MAP(dataFromReg,'1',max_nb);
       Comparateur  :compare_4bits   PORT MAP(dataFromReg,dataFromCompt,egal);
       Compteur     :compt_4bits     PORT MAP(pwm_sig,en_compt,clk,rst_compt,dataFromCompt);
       Multiplexeur :mux_2_1         PORT MAP("0000",dataFromCompt,sel,sig1);
       Additionneur :adder_8bits     PORT MAP(sig1,dataFromReg8b2,result);
       Registre8bit1:reg_8bits       PORT MAP(not_en_reg8,rst,clk,result,dataFromReg8b1);
       Registre8bit2:reg_8bits       PORT MAP(en_reg8,rst,clk,dataFromReg8b1,dataFromReg8b2);
       Memoire      :memoire_16bits  PORT MAP(clk,'0',en_mem,dataFromReg8b2,mem);
       Affich2      :seven_sg        PORT MAP(dataFromCompt,'1',current_nb);
       Demuxtiplex  :demux_2_1       PORT MAP(mem,demux_sel,jour1,jour2);
       Porte_Not    :not_gate        PORT MAP(en_reg8,not_en_reg8);
END rtl;
--*****************************************************************************************--                                       
        