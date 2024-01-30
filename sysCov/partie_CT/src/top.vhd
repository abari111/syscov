--**************************************************************************************--
--                                   ENSA FES
--                 PROJET D'EVALUATION: CIRCUITS REPROGRAMMABLES & VHDL 

--**************************************************************************************--
--Title  : 
--Block  :top (le circuit numérique)
              

--**************************************************************************************--
--File   : top
--Author : DODO MAMANE ABARI
--CREATED: Août 2020


--**************************************************************************************--
--DESCRIPTION OF THE BLOCK
-- C'est le circuit numérique de comptage. Ici la partie contrôle et opérative sont mises en accord de telle
-- sorte à former le circuit.
--**************************************************************************************--
--                                                LIBRARIES USED
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
--**************************************************************************************--
--                                               ENTITY DECLARATION
ENTITY top IS
    PORT(
        rst       :IN STD_LOGIC;
        pwm_sig   :IN STD_LOGIC;
        clk       :IN STD_LOGIC;
        timer     :IN STD_LOGIC;
        demux_sel :IN STD_LOGIC;
        indicateur:IN STD_LOGIC;
        data      :IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        jour1     :OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        jour2     :OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        max_nb    :OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        current_nb:OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
        );
END top;

--**************************************************************************************--
--                                                  RTL DECLARATION
ARCHITECTURE rtl OF top IS
    COMPONENT operative_part IS
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
    END COMPONENT;
    
    COMPONENT control_part IS
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
    END COMPONENT;
    SIGNAL en_reg4,en_reg8,en_mem,sel,rst_reg8,en_compt,rst_compt,egal:STD_LOGIC;
    BEGIN
        CTRL_PART:control_part PORT MAP(rst,clk,timer,indicateur,egal,en_reg4,en_reg8,
                                        en_mem,sel,rst_reg8,en_compt,rst_compt);
                                        
        OP_PART: operative_part PORT MAP(clk,pwm_sig,en_mem,en_reg4,en_reg8,rst_compt,
                                          rst_reg8,en_compt,sel,demux_sel,data,egal,jour1,
                                          jour2,max_nb,current_nb);
END rtl;
--**************************************************************************************--
    