--Copyright (C)2014-2025 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: IP file
--Tool Version: V1.9.11.02 (64-bit)
--Part Number: GW5AT-LV60PG484AC1/I0
--Device: GW5AT-60
--Device Version: B
--Created Time: Wed May 14 15:09:31 2025

library IEEE;
use IEEE.std_logic_1164.all;

entity Gowin_DPB_64kram is
    port (
        douta: out std_logic_vector(7 downto 0);
        doutb: out std_logic_vector(7 downto 0);
        clka: in std_logic;
        ocea: in std_logic;
        cea: in std_logic;
        reseta: in std_logic;
        wrea: in std_logic;
        clkb: in std_logic;
        oceb: in std_logic;
        ceb: in std_logic;
        resetb: in std_logic;
        wreb: in std_logic;
        ada: in std_logic_vector(15 downto 0);
        dina: in std_logic_vector(7 downto 0);
        adb: in std_logic_vector(15 downto 0);
        dinb: in std_logic_vector(7 downto 0)
    );
end Gowin_DPB_64kram;

architecture Behavioral of Gowin_DPB_64kram is

    signal dpb_inst_0_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_0_douta: std_logic_vector(0 downto 0);
    signal dpb_inst_0_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_0_doutb: std_logic_vector(0 downto 0);
    signal dpb_inst_1_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_1_douta: std_logic_vector(0 downto 0);
    signal dpb_inst_1_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_1_doutb: std_logic_vector(0 downto 0);
    signal dpb_inst_2_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_2_douta: std_logic_vector(0 downto 0);
    signal dpb_inst_2_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_2_doutb: std_logic_vector(0 downto 0);
    signal dpb_inst_3_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_3_douta: std_logic_vector(0 downto 0);
    signal dpb_inst_3_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_3_doutb: std_logic_vector(0 downto 0);
    signal dpb_inst_4_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_4_douta: std_logic_vector(1 downto 1);
    signal dpb_inst_4_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_4_doutb: std_logic_vector(1 downto 1);
    signal dpb_inst_5_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_5_douta: std_logic_vector(1 downto 1);
    signal dpb_inst_5_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_5_doutb: std_logic_vector(1 downto 1);
    signal dpb_inst_6_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_6_douta: std_logic_vector(1 downto 1);
    signal dpb_inst_6_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_6_doutb: std_logic_vector(1 downto 1);
    signal dpb_inst_7_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_7_douta: std_logic_vector(1 downto 1);
    signal dpb_inst_7_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_7_doutb: std_logic_vector(1 downto 1);
    signal dpb_inst_8_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_8_douta: std_logic_vector(2 downto 2);
    signal dpb_inst_8_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_8_doutb: std_logic_vector(2 downto 2);
    signal dpb_inst_9_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_9_douta: std_logic_vector(2 downto 2);
    signal dpb_inst_9_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_9_doutb: std_logic_vector(2 downto 2);
    signal dpb_inst_10_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_10_douta: std_logic_vector(2 downto 2);
    signal dpb_inst_10_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_10_doutb: std_logic_vector(2 downto 2);
    signal dpb_inst_11_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_11_douta: std_logic_vector(2 downto 2);
    signal dpb_inst_11_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_11_doutb: std_logic_vector(2 downto 2);
    signal dpb_inst_12_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_12_douta: std_logic_vector(3 downto 3);
    signal dpb_inst_12_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_12_doutb: std_logic_vector(3 downto 3);
    signal dpb_inst_13_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_13_douta: std_logic_vector(3 downto 3);
    signal dpb_inst_13_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_13_doutb: std_logic_vector(3 downto 3);
    signal dpb_inst_14_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_14_douta: std_logic_vector(3 downto 3);
    signal dpb_inst_14_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_14_doutb: std_logic_vector(3 downto 3);
    signal dpb_inst_15_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_15_douta: std_logic_vector(3 downto 3);
    signal dpb_inst_15_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_15_doutb: std_logic_vector(3 downto 3);
    signal dpb_inst_16_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_16_douta: std_logic_vector(4 downto 4);
    signal dpb_inst_16_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_16_doutb: std_logic_vector(4 downto 4);
    signal dpb_inst_17_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_17_douta: std_logic_vector(4 downto 4);
    signal dpb_inst_17_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_17_doutb: std_logic_vector(4 downto 4);
    signal dpb_inst_18_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_18_douta: std_logic_vector(4 downto 4);
    signal dpb_inst_18_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_18_doutb: std_logic_vector(4 downto 4);
    signal dpb_inst_19_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_19_douta: std_logic_vector(4 downto 4);
    signal dpb_inst_19_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_19_doutb: std_logic_vector(4 downto 4);
    signal dpb_inst_20_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_20_douta: std_logic_vector(5 downto 5);
    signal dpb_inst_20_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_20_doutb: std_logic_vector(5 downto 5);
    signal dpb_inst_21_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_21_douta: std_logic_vector(5 downto 5);
    signal dpb_inst_21_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_21_doutb: std_logic_vector(5 downto 5);
    signal dpb_inst_22_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_22_douta: std_logic_vector(5 downto 5);
    signal dpb_inst_22_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_22_doutb: std_logic_vector(5 downto 5);
    signal dpb_inst_23_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_23_douta: std_logic_vector(5 downto 5);
    signal dpb_inst_23_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_23_doutb: std_logic_vector(5 downto 5);
    signal dpb_inst_24_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_24_douta: std_logic_vector(6 downto 6);
    signal dpb_inst_24_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_24_doutb: std_logic_vector(6 downto 6);
    signal dpb_inst_25_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_25_douta: std_logic_vector(6 downto 6);
    signal dpb_inst_25_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_25_doutb: std_logic_vector(6 downto 6);
    signal dpb_inst_26_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_26_douta: std_logic_vector(6 downto 6);
    signal dpb_inst_26_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_26_doutb: std_logic_vector(6 downto 6);
    signal dpb_inst_27_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_27_douta: std_logic_vector(6 downto 6);
    signal dpb_inst_27_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_27_doutb: std_logic_vector(6 downto 6);
    signal dpb_inst_28_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_28_douta: std_logic_vector(7 downto 7);
    signal dpb_inst_28_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_28_doutb: std_logic_vector(7 downto 7);
    signal dpb_inst_29_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_29_douta: std_logic_vector(7 downto 7);
    signal dpb_inst_29_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_29_doutb: std_logic_vector(7 downto 7);
    signal dpb_inst_30_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_30_douta: std_logic_vector(7 downto 7);
    signal dpb_inst_30_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_30_doutb: std_logic_vector(7 downto 7);
    signal dpb_inst_31_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_31_douta: std_logic_vector(7 downto 7);
    signal dpb_inst_31_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_31_doutb: std_logic_vector(7 downto 7);
    signal dff_q_0: std_logic;
    signal dff_q_1: std_logic;
    signal dff_q_2: std_logic;
    signal dff_q_3: std_logic;
    signal mux_o_0: std_logic;
    signal mux_o_1: std_logic;
    signal mux_o_3: std_logic;
    signal mux_o_4: std_logic;
    signal mux_o_6: std_logic;
    signal mux_o_7: std_logic;
    signal mux_o_9: std_logic;
    signal mux_o_10: std_logic;
    signal mux_o_12: std_logic;
    signal mux_o_13: std_logic;
    signal mux_o_15: std_logic;
    signal mux_o_16: std_logic;
    signal mux_o_18: std_logic;
    signal mux_o_19: std_logic;
    signal mux_o_21: std_logic;
    signal mux_o_22: std_logic;
    signal mux_o_24: std_logic;
    signal mux_o_25: std_logic;
    signal mux_o_27: std_logic;
    signal mux_o_28: std_logic;
    signal mux_o_30: std_logic;
    signal mux_o_31: std_logic;
    signal mux_o_33: std_logic;
    signal mux_o_34: std_logic;
    signal mux_o_36: std_logic;
    signal mux_o_37: std_logic;
    signal mux_o_39: std_logic;
    signal mux_o_40: std_logic;
    signal mux_o_42: std_logic;
    signal mux_o_43: std_logic;
    signal mux_o_45: std_logic;
    signal mux_o_46: std_logic;
    signal cea_w: std_logic;
    signal ceb_w: std_logic;
    signal gw_gnd: std_logic;
    signal dpb_inst_0_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_0_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_0_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_0_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_0_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_0_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_1_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_1_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_1_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_1_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_1_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_1_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_2_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_2_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_2_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_2_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_2_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_2_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_3_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_3_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_3_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_3_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_3_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_3_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_4_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_4_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_4_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_4_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_4_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_4_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_5_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_5_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_5_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_5_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_5_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_5_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_6_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_6_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_6_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_6_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_6_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_6_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_7_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_7_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_7_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_7_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_7_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_7_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_8_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_8_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_8_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_8_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_8_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_8_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_9_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_9_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_9_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_9_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_9_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_9_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_10_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_10_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_10_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_10_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_10_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_10_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_11_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_11_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_11_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_11_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_11_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_11_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_12_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_12_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_12_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_12_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_12_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_12_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_13_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_13_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_13_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_13_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_13_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_13_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_14_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_14_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_14_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_14_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_14_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_14_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_15_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_15_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_15_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_15_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_15_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_15_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_16_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_16_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_16_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_16_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_16_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_16_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_17_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_17_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_17_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_17_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_17_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_17_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_18_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_18_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_18_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_18_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_18_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_18_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_19_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_19_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_19_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_19_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_19_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_19_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_20_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_20_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_20_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_20_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_20_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_20_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_21_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_21_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_21_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_21_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_21_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_21_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_22_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_22_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_22_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_22_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_22_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_22_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_23_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_23_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_23_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_23_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_23_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_23_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_24_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_24_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_24_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_24_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_24_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_24_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_25_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_25_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_25_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_25_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_25_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_25_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_26_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_26_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_26_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_26_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_26_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_26_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_27_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_27_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_27_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_27_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_27_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_27_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_28_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_28_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_28_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_28_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_28_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_28_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_29_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_29_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_29_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_29_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_29_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_29_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_30_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_30_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_30_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_30_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_30_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_30_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_31_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_31_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_31_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_31_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_31_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_31_DOB_o: std_logic_vector(15 downto 0);

    --component declaration
    component DPB
        generic (
            READ_MODE0: in bit := '0';
            READ_MODE1: in bit := '0';
            WRITE_MODE0: in bit_vector := "00";
            WRITE_MODE1: in bit_vector := "00";
            BIT_WIDTH_0: in integer :=16;
            BIT_WIDTH_1: in integer :=16;
            BLK_SEL_0: in bit_vector := "000";
            BLK_SEL_1: in bit_vector := "000";
            RESET_MODE: in string := "SYNC";
            INIT_RAM_00: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_01: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_02: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_03: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_04: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_05: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_06: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_07: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_08: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_09: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0A: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0B: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0C: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0D: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0E: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0F: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_10: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_11: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_12: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_13: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_14: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_15: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_16: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_17: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_18: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_19: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1A: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1B: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1C: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1D: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1E: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1F: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_20: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_21: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_22: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_23: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_24: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_25: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_26: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_27: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_28: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_29: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2A: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2B: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2C: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2D: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2E: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2F: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_30: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_31: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_32: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_33: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_34: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_35: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_36: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_37: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_38: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_39: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3A: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3B: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3C: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3D: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3E: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3F: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"
        );
        port (
            DOA: out std_logic_vector(15 downto 0);
            DOB: out std_logic_vector(15 downto 0);
            CLKA: in std_logic;
            OCEA: in std_logic;
            CEA: in std_logic;
            RESETA: in std_logic;
            WREA: in std_logic;
            CLKB: in std_logic;
            OCEB: in std_logic;
            CEB: in std_logic;
            RESETB: in std_logic;
            WREB: in std_logic;
            BLKSELA: in std_logic_vector(2 downto 0);
            BLKSELB: in std_logic_vector(2 downto 0);
            ADA: in std_logic_vector(13 downto 0);
            DIA: in std_logic_vector(15 downto 0);
            ADB: in std_logic_vector(13 downto 0);
            DIB: in std_logic_vector(15 downto 0)
        );
    end component;

    -- component declaration
    component DFFRE
        port (
            Q: out std_logic;
            D: in std_logic;
            CLK: in std_logic;
            CE: in std_logic;
            RESET: in std_logic
        );
    end component;

    -- component declaration
    component MUX2
        port (
            O: out std_logic;
            I0: in std_logic;
            I1: in std_logic;
            S0: in std_logic
        );
    end component;

begin
    gw_gnd <= '0';

    cea_w <= not wrea and cea;
    ceb_w <= not wreb and ceb;
    dpb_inst_0_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_0_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_0_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(0);
    dpb_inst_0_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(0);
    dpb_inst_0_douta(0) <= dpb_inst_0_DOA_o(0);
    dpb_inst_0_douta_w(14 downto 0) <= dpb_inst_0_DOA_o(15 downto 1) ;
    dpb_inst_0_doutb(0) <= dpb_inst_0_DOB_o(0);
    dpb_inst_0_doutb_w(14 downto 0) <= dpb_inst_0_DOB_o(15 downto 1) ;
    dpb_inst_1_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_1_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_1_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(0);
    dpb_inst_1_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(0);
    dpb_inst_1_douta(0) <= dpb_inst_1_DOA_o(0);
    dpb_inst_1_douta_w(14 downto 0) <= dpb_inst_1_DOA_o(15 downto 1) ;
    dpb_inst_1_doutb(0) <= dpb_inst_1_DOB_o(0);
    dpb_inst_1_doutb_w(14 downto 0) <= dpb_inst_1_DOB_o(15 downto 1) ;
    dpb_inst_2_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_2_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_2_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(0);
    dpb_inst_2_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(0);
    dpb_inst_2_douta(0) <= dpb_inst_2_DOA_o(0);
    dpb_inst_2_douta_w(14 downto 0) <= dpb_inst_2_DOA_o(15 downto 1) ;
    dpb_inst_2_doutb(0) <= dpb_inst_2_DOB_o(0);
    dpb_inst_2_doutb_w(14 downto 0) <= dpb_inst_2_DOB_o(15 downto 1) ;
    dpb_inst_3_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_3_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_3_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(0);
    dpb_inst_3_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(0);
    dpb_inst_3_douta(0) <= dpb_inst_3_DOA_o(0);
    dpb_inst_3_douta_w(14 downto 0) <= dpb_inst_3_DOA_o(15 downto 1) ;
    dpb_inst_3_doutb(0) <= dpb_inst_3_DOB_o(0);
    dpb_inst_3_doutb_w(14 downto 0) <= dpb_inst_3_DOB_o(15 downto 1) ;
    dpb_inst_4_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_4_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_4_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(1);
    dpb_inst_4_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(1);
    dpb_inst_4_douta(1) <= dpb_inst_4_DOA_o(0);
    dpb_inst_4_douta_w(14 downto 0) <= dpb_inst_4_DOA_o(15 downto 1) ;
    dpb_inst_4_doutb(1) <= dpb_inst_4_DOB_o(0);
    dpb_inst_4_doutb_w(14 downto 0) <= dpb_inst_4_DOB_o(15 downto 1) ;
    dpb_inst_5_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_5_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_5_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(1);
    dpb_inst_5_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(1);
    dpb_inst_5_douta(1) <= dpb_inst_5_DOA_o(0);
    dpb_inst_5_douta_w(14 downto 0) <= dpb_inst_5_DOA_o(15 downto 1) ;
    dpb_inst_5_doutb(1) <= dpb_inst_5_DOB_o(0);
    dpb_inst_5_doutb_w(14 downto 0) <= dpb_inst_5_DOB_o(15 downto 1) ;
    dpb_inst_6_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_6_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_6_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(1);
    dpb_inst_6_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(1);
    dpb_inst_6_douta(1) <= dpb_inst_6_DOA_o(0);
    dpb_inst_6_douta_w(14 downto 0) <= dpb_inst_6_DOA_o(15 downto 1) ;
    dpb_inst_6_doutb(1) <= dpb_inst_6_DOB_o(0);
    dpb_inst_6_doutb_w(14 downto 0) <= dpb_inst_6_DOB_o(15 downto 1) ;
    dpb_inst_7_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_7_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_7_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(1);
    dpb_inst_7_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(1);
    dpb_inst_7_douta(1) <= dpb_inst_7_DOA_o(0);
    dpb_inst_7_douta_w(14 downto 0) <= dpb_inst_7_DOA_o(15 downto 1) ;
    dpb_inst_7_doutb(1) <= dpb_inst_7_DOB_o(0);
    dpb_inst_7_doutb_w(14 downto 0) <= dpb_inst_7_DOB_o(15 downto 1) ;
    dpb_inst_8_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_8_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_8_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(2);
    dpb_inst_8_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(2);
    dpb_inst_8_douta(2) <= dpb_inst_8_DOA_o(0);
    dpb_inst_8_douta_w(14 downto 0) <= dpb_inst_8_DOA_o(15 downto 1) ;
    dpb_inst_8_doutb(2) <= dpb_inst_8_DOB_o(0);
    dpb_inst_8_doutb_w(14 downto 0) <= dpb_inst_8_DOB_o(15 downto 1) ;
    dpb_inst_9_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_9_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_9_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(2);
    dpb_inst_9_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(2);
    dpb_inst_9_douta(2) <= dpb_inst_9_DOA_o(0);
    dpb_inst_9_douta_w(14 downto 0) <= dpb_inst_9_DOA_o(15 downto 1) ;
    dpb_inst_9_doutb(2) <= dpb_inst_9_DOB_o(0);
    dpb_inst_9_doutb_w(14 downto 0) <= dpb_inst_9_DOB_o(15 downto 1) ;
    dpb_inst_10_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_10_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_10_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(2);
    dpb_inst_10_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(2);
    dpb_inst_10_douta(2) <= dpb_inst_10_DOA_o(0);
    dpb_inst_10_douta_w(14 downto 0) <= dpb_inst_10_DOA_o(15 downto 1) ;
    dpb_inst_10_doutb(2) <= dpb_inst_10_DOB_o(0);
    dpb_inst_10_doutb_w(14 downto 0) <= dpb_inst_10_DOB_o(15 downto 1) ;
    dpb_inst_11_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_11_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_11_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(2);
    dpb_inst_11_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(2);
    dpb_inst_11_douta(2) <= dpb_inst_11_DOA_o(0);
    dpb_inst_11_douta_w(14 downto 0) <= dpb_inst_11_DOA_o(15 downto 1) ;
    dpb_inst_11_doutb(2) <= dpb_inst_11_DOB_o(0);
    dpb_inst_11_doutb_w(14 downto 0) <= dpb_inst_11_DOB_o(15 downto 1) ;
    dpb_inst_12_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_12_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_12_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(3);
    dpb_inst_12_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(3);
    dpb_inst_12_douta(3) <= dpb_inst_12_DOA_o(0);
    dpb_inst_12_douta_w(14 downto 0) <= dpb_inst_12_DOA_o(15 downto 1) ;
    dpb_inst_12_doutb(3) <= dpb_inst_12_DOB_o(0);
    dpb_inst_12_doutb_w(14 downto 0) <= dpb_inst_12_DOB_o(15 downto 1) ;
    dpb_inst_13_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_13_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_13_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(3);
    dpb_inst_13_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(3);
    dpb_inst_13_douta(3) <= dpb_inst_13_DOA_o(0);
    dpb_inst_13_douta_w(14 downto 0) <= dpb_inst_13_DOA_o(15 downto 1) ;
    dpb_inst_13_doutb(3) <= dpb_inst_13_DOB_o(0);
    dpb_inst_13_doutb_w(14 downto 0) <= dpb_inst_13_DOB_o(15 downto 1) ;
    dpb_inst_14_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_14_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_14_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(3);
    dpb_inst_14_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(3);
    dpb_inst_14_douta(3) <= dpb_inst_14_DOA_o(0);
    dpb_inst_14_douta_w(14 downto 0) <= dpb_inst_14_DOA_o(15 downto 1) ;
    dpb_inst_14_doutb(3) <= dpb_inst_14_DOB_o(0);
    dpb_inst_14_doutb_w(14 downto 0) <= dpb_inst_14_DOB_o(15 downto 1) ;
    dpb_inst_15_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_15_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_15_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(3);
    dpb_inst_15_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(3);
    dpb_inst_15_douta(3) <= dpb_inst_15_DOA_o(0);
    dpb_inst_15_douta_w(14 downto 0) <= dpb_inst_15_DOA_o(15 downto 1) ;
    dpb_inst_15_doutb(3) <= dpb_inst_15_DOB_o(0);
    dpb_inst_15_doutb_w(14 downto 0) <= dpb_inst_15_DOB_o(15 downto 1) ;
    dpb_inst_16_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_16_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_16_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(4);
    dpb_inst_16_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(4);
    dpb_inst_16_douta(4) <= dpb_inst_16_DOA_o(0);
    dpb_inst_16_douta_w(14 downto 0) <= dpb_inst_16_DOA_o(15 downto 1) ;
    dpb_inst_16_doutb(4) <= dpb_inst_16_DOB_o(0);
    dpb_inst_16_doutb_w(14 downto 0) <= dpb_inst_16_DOB_o(15 downto 1) ;
    dpb_inst_17_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_17_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_17_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(4);
    dpb_inst_17_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(4);
    dpb_inst_17_douta(4) <= dpb_inst_17_DOA_o(0);
    dpb_inst_17_douta_w(14 downto 0) <= dpb_inst_17_DOA_o(15 downto 1) ;
    dpb_inst_17_doutb(4) <= dpb_inst_17_DOB_o(0);
    dpb_inst_17_doutb_w(14 downto 0) <= dpb_inst_17_DOB_o(15 downto 1) ;
    dpb_inst_18_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_18_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_18_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(4);
    dpb_inst_18_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(4);
    dpb_inst_18_douta(4) <= dpb_inst_18_DOA_o(0);
    dpb_inst_18_douta_w(14 downto 0) <= dpb_inst_18_DOA_o(15 downto 1) ;
    dpb_inst_18_doutb(4) <= dpb_inst_18_DOB_o(0);
    dpb_inst_18_doutb_w(14 downto 0) <= dpb_inst_18_DOB_o(15 downto 1) ;
    dpb_inst_19_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_19_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_19_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(4);
    dpb_inst_19_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(4);
    dpb_inst_19_douta(4) <= dpb_inst_19_DOA_o(0);
    dpb_inst_19_douta_w(14 downto 0) <= dpb_inst_19_DOA_o(15 downto 1) ;
    dpb_inst_19_doutb(4) <= dpb_inst_19_DOB_o(0);
    dpb_inst_19_doutb_w(14 downto 0) <= dpb_inst_19_DOB_o(15 downto 1) ;
    dpb_inst_20_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_20_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_20_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(5);
    dpb_inst_20_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(5);
    dpb_inst_20_douta(5) <= dpb_inst_20_DOA_o(0);
    dpb_inst_20_douta_w(14 downto 0) <= dpb_inst_20_DOA_o(15 downto 1) ;
    dpb_inst_20_doutb(5) <= dpb_inst_20_DOB_o(0);
    dpb_inst_20_doutb_w(14 downto 0) <= dpb_inst_20_DOB_o(15 downto 1) ;
    dpb_inst_21_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_21_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_21_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(5);
    dpb_inst_21_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(5);
    dpb_inst_21_douta(5) <= dpb_inst_21_DOA_o(0);
    dpb_inst_21_douta_w(14 downto 0) <= dpb_inst_21_DOA_o(15 downto 1) ;
    dpb_inst_21_doutb(5) <= dpb_inst_21_DOB_o(0);
    dpb_inst_21_doutb_w(14 downto 0) <= dpb_inst_21_DOB_o(15 downto 1) ;
    dpb_inst_22_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_22_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_22_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(5);
    dpb_inst_22_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(5);
    dpb_inst_22_douta(5) <= dpb_inst_22_DOA_o(0);
    dpb_inst_22_douta_w(14 downto 0) <= dpb_inst_22_DOA_o(15 downto 1) ;
    dpb_inst_22_doutb(5) <= dpb_inst_22_DOB_o(0);
    dpb_inst_22_doutb_w(14 downto 0) <= dpb_inst_22_DOB_o(15 downto 1) ;
    dpb_inst_23_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_23_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_23_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(5);
    dpb_inst_23_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(5);
    dpb_inst_23_douta(5) <= dpb_inst_23_DOA_o(0);
    dpb_inst_23_douta_w(14 downto 0) <= dpb_inst_23_DOA_o(15 downto 1) ;
    dpb_inst_23_doutb(5) <= dpb_inst_23_DOB_o(0);
    dpb_inst_23_doutb_w(14 downto 0) <= dpb_inst_23_DOB_o(15 downto 1) ;
    dpb_inst_24_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_24_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_24_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(6);
    dpb_inst_24_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(6);
    dpb_inst_24_douta(6) <= dpb_inst_24_DOA_o(0);
    dpb_inst_24_douta_w(14 downto 0) <= dpb_inst_24_DOA_o(15 downto 1) ;
    dpb_inst_24_doutb(6) <= dpb_inst_24_DOB_o(0);
    dpb_inst_24_doutb_w(14 downto 0) <= dpb_inst_24_DOB_o(15 downto 1) ;
    dpb_inst_25_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_25_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_25_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(6);
    dpb_inst_25_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(6);
    dpb_inst_25_douta(6) <= dpb_inst_25_DOA_o(0);
    dpb_inst_25_douta_w(14 downto 0) <= dpb_inst_25_DOA_o(15 downto 1) ;
    dpb_inst_25_doutb(6) <= dpb_inst_25_DOB_o(0);
    dpb_inst_25_doutb_w(14 downto 0) <= dpb_inst_25_DOB_o(15 downto 1) ;
    dpb_inst_26_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_26_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_26_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(6);
    dpb_inst_26_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(6);
    dpb_inst_26_douta(6) <= dpb_inst_26_DOA_o(0);
    dpb_inst_26_douta_w(14 downto 0) <= dpb_inst_26_DOA_o(15 downto 1) ;
    dpb_inst_26_doutb(6) <= dpb_inst_26_DOB_o(0);
    dpb_inst_26_doutb_w(14 downto 0) <= dpb_inst_26_DOB_o(15 downto 1) ;
    dpb_inst_27_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_27_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_27_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(6);
    dpb_inst_27_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(6);
    dpb_inst_27_douta(6) <= dpb_inst_27_DOA_o(0);
    dpb_inst_27_douta_w(14 downto 0) <= dpb_inst_27_DOA_o(15 downto 1) ;
    dpb_inst_27_doutb(6) <= dpb_inst_27_DOB_o(0);
    dpb_inst_27_doutb_w(14 downto 0) <= dpb_inst_27_DOB_o(15 downto 1) ;
    dpb_inst_28_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_28_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_28_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(7);
    dpb_inst_28_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(7);
    dpb_inst_28_douta(7) <= dpb_inst_28_DOA_o(0);
    dpb_inst_28_douta_w(14 downto 0) <= dpb_inst_28_DOA_o(15 downto 1) ;
    dpb_inst_28_doutb(7) <= dpb_inst_28_DOB_o(0);
    dpb_inst_28_doutb_w(14 downto 0) <= dpb_inst_28_DOB_o(15 downto 1) ;
    dpb_inst_29_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_29_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_29_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(7);
    dpb_inst_29_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(7);
    dpb_inst_29_douta(7) <= dpb_inst_29_DOA_o(0);
    dpb_inst_29_douta_w(14 downto 0) <= dpb_inst_29_DOA_o(15 downto 1) ;
    dpb_inst_29_doutb(7) <= dpb_inst_29_DOB_o(0);
    dpb_inst_29_doutb_w(14 downto 0) <= dpb_inst_29_DOB_o(15 downto 1) ;
    dpb_inst_30_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_30_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_30_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(7);
    dpb_inst_30_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(7);
    dpb_inst_30_douta(7) <= dpb_inst_30_DOA_o(0);
    dpb_inst_30_douta_w(14 downto 0) <= dpb_inst_30_DOA_o(15 downto 1) ;
    dpb_inst_30_doutb(7) <= dpb_inst_30_DOB_o(0);
    dpb_inst_30_doutb_w(14 downto 0) <= dpb_inst_30_DOB_o(15 downto 1) ;
    dpb_inst_31_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    dpb_inst_31_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    dpb_inst_31_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(7);
    dpb_inst_31_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(7);
    dpb_inst_31_douta(7) <= dpb_inst_31_DOA_o(0);
    dpb_inst_31_douta_w(14 downto 0) <= dpb_inst_31_DOA_o(15 downto 1) ;
    dpb_inst_31_doutb(7) <= dpb_inst_31_DOB_o(0);
    dpb_inst_31_doutb_w(14 downto 0) <= dpb_inst_31_DOB_o(15 downto 1) ;

    dpb_inst_0: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpb_inst_0_DOA_o,
            DOB => dpb_inst_0_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_0_BLKSELA_i,
            BLKSELB => dpb_inst_0_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_0_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_0_DIB_i
        );

    dpb_inst_1: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "001",
            BLK_SEL_1 => "001"
        )
        port map (
            DOA => dpb_inst_1_DOA_o,
            DOB => dpb_inst_1_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_1_BLKSELA_i,
            BLKSELB => dpb_inst_1_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_1_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_1_DIB_i
        );

    dpb_inst_2: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "010",
            BLK_SEL_1 => "010"
        )
        port map (
            DOA => dpb_inst_2_DOA_o,
            DOB => dpb_inst_2_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_2_BLKSELA_i,
            BLKSELB => dpb_inst_2_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_2_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_2_DIB_i
        );

    dpb_inst_3: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "011",
            BLK_SEL_1 => "011"
        )
        port map (
            DOA => dpb_inst_3_DOA_o,
            DOB => dpb_inst_3_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_3_BLKSELA_i,
            BLKSELB => dpb_inst_3_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_3_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_3_DIB_i
        );

    dpb_inst_4: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpb_inst_4_DOA_o,
            DOB => dpb_inst_4_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_4_BLKSELA_i,
            BLKSELB => dpb_inst_4_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_4_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_4_DIB_i
        );

    dpb_inst_5: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "001",
            BLK_SEL_1 => "001"
        )
        port map (
            DOA => dpb_inst_5_DOA_o,
            DOB => dpb_inst_5_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_5_BLKSELA_i,
            BLKSELB => dpb_inst_5_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_5_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_5_DIB_i
        );

    dpb_inst_6: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "010",
            BLK_SEL_1 => "010"
        )
        port map (
            DOA => dpb_inst_6_DOA_o,
            DOB => dpb_inst_6_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_6_BLKSELA_i,
            BLKSELB => dpb_inst_6_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_6_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_6_DIB_i
        );

    dpb_inst_7: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "011",
            BLK_SEL_1 => "011"
        )
        port map (
            DOA => dpb_inst_7_DOA_o,
            DOB => dpb_inst_7_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_7_BLKSELA_i,
            BLKSELB => dpb_inst_7_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_7_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_7_DIB_i
        );

    dpb_inst_8: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpb_inst_8_DOA_o,
            DOB => dpb_inst_8_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_8_BLKSELA_i,
            BLKSELB => dpb_inst_8_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_8_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_8_DIB_i
        );

    dpb_inst_9: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "001",
            BLK_SEL_1 => "001"
        )
        port map (
            DOA => dpb_inst_9_DOA_o,
            DOB => dpb_inst_9_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_9_BLKSELA_i,
            BLKSELB => dpb_inst_9_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_9_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_9_DIB_i
        );

    dpb_inst_10: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "010",
            BLK_SEL_1 => "010"
        )
        port map (
            DOA => dpb_inst_10_DOA_o,
            DOB => dpb_inst_10_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_10_BLKSELA_i,
            BLKSELB => dpb_inst_10_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_10_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_10_DIB_i
        );

    dpb_inst_11: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "011",
            BLK_SEL_1 => "011"
        )
        port map (
            DOA => dpb_inst_11_DOA_o,
            DOB => dpb_inst_11_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_11_BLKSELA_i,
            BLKSELB => dpb_inst_11_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_11_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_11_DIB_i
        );

    dpb_inst_12: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpb_inst_12_DOA_o,
            DOB => dpb_inst_12_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_12_BLKSELA_i,
            BLKSELB => dpb_inst_12_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_12_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_12_DIB_i
        );

    dpb_inst_13: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "001",
            BLK_SEL_1 => "001"
        )
        port map (
            DOA => dpb_inst_13_DOA_o,
            DOB => dpb_inst_13_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_13_BLKSELA_i,
            BLKSELB => dpb_inst_13_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_13_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_13_DIB_i
        );

    dpb_inst_14: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "010",
            BLK_SEL_1 => "010"
        )
        port map (
            DOA => dpb_inst_14_DOA_o,
            DOB => dpb_inst_14_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_14_BLKSELA_i,
            BLKSELB => dpb_inst_14_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_14_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_14_DIB_i
        );

    dpb_inst_15: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "011",
            BLK_SEL_1 => "011"
        )
        port map (
            DOA => dpb_inst_15_DOA_o,
            DOB => dpb_inst_15_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_15_BLKSELA_i,
            BLKSELB => dpb_inst_15_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_15_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_15_DIB_i
        );

    dpb_inst_16: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpb_inst_16_DOA_o,
            DOB => dpb_inst_16_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_16_BLKSELA_i,
            BLKSELB => dpb_inst_16_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_16_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_16_DIB_i
        );

    dpb_inst_17: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "001",
            BLK_SEL_1 => "001"
        )
        port map (
            DOA => dpb_inst_17_DOA_o,
            DOB => dpb_inst_17_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_17_BLKSELA_i,
            BLKSELB => dpb_inst_17_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_17_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_17_DIB_i
        );

    dpb_inst_18: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "010",
            BLK_SEL_1 => "010"
        )
        port map (
            DOA => dpb_inst_18_DOA_o,
            DOB => dpb_inst_18_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_18_BLKSELA_i,
            BLKSELB => dpb_inst_18_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_18_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_18_DIB_i
        );

    dpb_inst_19: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "011",
            BLK_SEL_1 => "011"
        )
        port map (
            DOA => dpb_inst_19_DOA_o,
            DOB => dpb_inst_19_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_19_BLKSELA_i,
            BLKSELB => dpb_inst_19_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_19_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_19_DIB_i
        );

    dpb_inst_20: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpb_inst_20_DOA_o,
            DOB => dpb_inst_20_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_20_BLKSELA_i,
            BLKSELB => dpb_inst_20_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_20_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_20_DIB_i
        );

    dpb_inst_21: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "001",
            BLK_SEL_1 => "001"
        )
        port map (
            DOA => dpb_inst_21_DOA_o,
            DOB => dpb_inst_21_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_21_BLKSELA_i,
            BLKSELB => dpb_inst_21_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_21_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_21_DIB_i
        );

    dpb_inst_22: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "010",
            BLK_SEL_1 => "010"
        )
        port map (
            DOA => dpb_inst_22_DOA_o,
            DOB => dpb_inst_22_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_22_BLKSELA_i,
            BLKSELB => dpb_inst_22_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_22_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_22_DIB_i
        );

    dpb_inst_23: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "011",
            BLK_SEL_1 => "011"
        )
        port map (
            DOA => dpb_inst_23_DOA_o,
            DOB => dpb_inst_23_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_23_BLKSELA_i,
            BLKSELB => dpb_inst_23_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_23_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_23_DIB_i
        );

    dpb_inst_24: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpb_inst_24_DOA_o,
            DOB => dpb_inst_24_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_24_BLKSELA_i,
            BLKSELB => dpb_inst_24_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_24_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_24_DIB_i
        );

    dpb_inst_25: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "001",
            BLK_SEL_1 => "001"
        )
        port map (
            DOA => dpb_inst_25_DOA_o,
            DOB => dpb_inst_25_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_25_BLKSELA_i,
            BLKSELB => dpb_inst_25_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_25_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_25_DIB_i
        );

    dpb_inst_26: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "010",
            BLK_SEL_1 => "010"
        )
        port map (
            DOA => dpb_inst_26_DOA_o,
            DOB => dpb_inst_26_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_26_BLKSELA_i,
            BLKSELB => dpb_inst_26_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_26_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_26_DIB_i
        );

    dpb_inst_27: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "011",
            BLK_SEL_1 => "011"
        )
        port map (
            DOA => dpb_inst_27_DOA_o,
            DOB => dpb_inst_27_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_27_BLKSELA_i,
            BLKSELB => dpb_inst_27_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_27_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_27_DIB_i
        );

    dpb_inst_28: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpb_inst_28_DOA_o,
            DOB => dpb_inst_28_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_28_BLKSELA_i,
            BLKSELB => dpb_inst_28_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_28_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_28_DIB_i
        );

    dpb_inst_29: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "001",
            BLK_SEL_1 => "001"
        )
        port map (
            DOA => dpb_inst_29_DOA_o,
            DOB => dpb_inst_29_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_29_BLKSELA_i,
            BLKSELB => dpb_inst_29_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_29_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_29_DIB_i
        );

    dpb_inst_30: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "010",
            BLK_SEL_1 => "010"
        )
        port map (
            DOA => dpb_inst_30_DOA_o,
            DOB => dpb_inst_30_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_30_BLKSELA_i,
            BLKSELB => dpb_inst_30_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_30_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_30_DIB_i
        );

    dpb_inst_31: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "011",
            BLK_SEL_1 => "011"
        )
        port map (
            DOA => dpb_inst_31_DOA_o,
            DOB => dpb_inst_31_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_31_BLKSELA_i,
            BLKSELB => dpb_inst_31_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_31_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_31_DIB_i
        );

    dff_inst_0: DFFRE
        port map (
            Q => dff_q_0,
            D => ada(15),
            CLK => clka,
            CE => cea_w,
            RESET => gw_gnd
        );

    dff_inst_1: DFFRE
        port map (
            Q => dff_q_1,
            D => ada(14),
            CLK => clka,
            CE => cea_w,
            RESET => gw_gnd
        );

    dff_inst_2: DFFRE
        port map (
            Q => dff_q_2,
            D => adb(15),
            CLK => clkb,
            CE => ceb_w,
            RESET => gw_gnd
        );

    dff_inst_3: DFFRE
        port map (
            Q => dff_q_3,
            D => adb(14),
            CLK => clkb,
            CE => ceb_w,
            RESET => gw_gnd
        );

    mux_inst_0: MUX2
        port map (
            O => mux_o_0,
            I0 => dpb_inst_0_douta(0),
            I1 => dpb_inst_1_douta(0),
            S0 => dff_q_1
        );

    mux_inst_1: MUX2
        port map (
            O => mux_o_1,
            I0 => dpb_inst_2_douta(0),
            I1 => dpb_inst_3_douta(0),
            S0 => dff_q_1
        );

    mux_inst_2: MUX2
        port map (
            O => douta(0),
            I0 => mux_o_0,
            I1 => mux_o_1,
            S0 => dff_q_0
        );

    mux_inst_3: MUX2
        port map (
            O => mux_o_3,
            I0 => dpb_inst_4_douta(1),
            I1 => dpb_inst_5_douta(1),
            S0 => dff_q_1
        );

    mux_inst_4: MUX2
        port map (
            O => mux_o_4,
            I0 => dpb_inst_6_douta(1),
            I1 => dpb_inst_7_douta(1),
            S0 => dff_q_1
        );

    mux_inst_5: MUX2
        port map (
            O => douta(1),
            I0 => mux_o_3,
            I1 => mux_o_4,
            S0 => dff_q_0
        );

    mux_inst_6: MUX2
        port map (
            O => mux_o_6,
            I0 => dpb_inst_8_douta(2),
            I1 => dpb_inst_9_douta(2),
            S0 => dff_q_1
        );

    mux_inst_7: MUX2
        port map (
            O => mux_o_7,
            I0 => dpb_inst_10_douta(2),
            I1 => dpb_inst_11_douta(2),
            S0 => dff_q_1
        );

    mux_inst_8: MUX2
        port map (
            O => douta(2),
            I0 => mux_o_6,
            I1 => mux_o_7,
            S0 => dff_q_0
        );

    mux_inst_9: MUX2
        port map (
            O => mux_o_9,
            I0 => dpb_inst_12_douta(3),
            I1 => dpb_inst_13_douta(3),
            S0 => dff_q_1
        );

    mux_inst_10: MUX2
        port map (
            O => mux_o_10,
            I0 => dpb_inst_14_douta(3),
            I1 => dpb_inst_15_douta(3),
            S0 => dff_q_1
        );

    mux_inst_11: MUX2
        port map (
            O => douta(3),
            I0 => mux_o_9,
            I1 => mux_o_10,
            S0 => dff_q_0
        );

    mux_inst_12: MUX2
        port map (
            O => mux_o_12,
            I0 => dpb_inst_16_douta(4),
            I1 => dpb_inst_17_douta(4),
            S0 => dff_q_1
        );

    mux_inst_13: MUX2
        port map (
            O => mux_o_13,
            I0 => dpb_inst_18_douta(4),
            I1 => dpb_inst_19_douta(4),
            S0 => dff_q_1
        );

    mux_inst_14: MUX2
        port map (
            O => douta(4),
            I0 => mux_o_12,
            I1 => mux_o_13,
            S0 => dff_q_0
        );

    mux_inst_15: MUX2
        port map (
            O => mux_o_15,
            I0 => dpb_inst_20_douta(5),
            I1 => dpb_inst_21_douta(5),
            S0 => dff_q_1
        );

    mux_inst_16: MUX2
        port map (
            O => mux_o_16,
            I0 => dpb_inst_22_douta(5),
            I1 => dpb_inst_23_douta(5),
            S0 => dff_q_1
        );

    mux_inst_17: MUX2
        port map (
            O => douta(5),
            I0 => mux_o_15,
            I1 => mux_o_16,
            S0 => dff_q_0
        );

    mux_inst_18: MUX2
        port map (
            O => mux_o_18,
            I0 => dpb_inst_24_douta(6),
            I1 => dpb_inst_25_douta(6),
            S0 => dff_q_1
        );

    mux_inst_19: MUX2
        port map (
            O => mux_o_19,
            I0 => dpb_inst_26_douta(6),
            I1 => dpb_inst_27_douta(6),
            S0 => dff_q_1
        );

    mux_inst_20: MUX2
        port map (
            O => douta(6),
            I0 => mux_o_18,
            I1 => mux_o_19,
            S0 => dff_q_0
        );

    mux_inst_21: MUX2
        port map (
            O => mux_o_21,
            I0 => dpb_inst_28_douta(7),
            I1 => dpb_inst_29_douta(7),
            S0 => dff_q_1
        );

    mux_inst_22: MUX2
        port map (
            O => mux_o_22,
            I0 => dpb_inst_30_douta(7),
            I1 => dpb_inst_31_douta(7),
            S0 => dff_q_1
        );

    mux_inst_23: MUX2
        port map (
            O => douta(7),
            I0 => mux_o_21,
            I1 => mux_o_22,
            S0 => dff_q_0
        );

    mux_inst_24: MUX2
        port map (
            O => mux_o_24,
            I0 => dpb_inst_0_doutb(0),
            I1 => dpb_inst_1_doutb(0),
            S0 => dff_q_3
        );

    mux_inst_25: MUX2
        port map (
            O => mux_o_25,
            I0 => dpb_inst_2_doutb(0),
            I1 => dpb_inst_3_doutb(0),
            S0 => dff_q_3
        );

    mux_inst_26: MUX2
        port map (
            O => doutb(0),
            I0 => mux_o_24,
            I1 => mux_o_25,
            S0 => dff_q_2
        );

    mux_inst_27: MUX2
        port map (
            O => mux_o_27,
            I0 => dpb_inst_4_doutb(1),
            I1 => dpb_inst_5_doutb(1),
            S0 => dff_q_3
        );

    mux_inst_28: MUX2
        port map (
            O => mux_o_28,
            I0 => dpb_inst_6_doutb(1),
            I1 => dpb_inst_7_doutb(1),
            S0 => dff_q_3
        );

    mux_inst_29: MUX2
        port map (
            O => doutb(1),
            I0 => mux_o_27,
            I1 => mux_o_28,
            S0 => dff_q_2
        );

    mux_inst_30: MUX2
        port map (
            O => mux_o_30,
            I0 => dpb_inst_8_doutb(2),
            I1 => dpb_inst_9_doutb(2),
            S0 => dff_q_3
        );

    mux_inst_31: MUX2
        port map (
            O => mux_o_31,
            I0 => dpb_inst_10_doutb(2),
            I1 => dpb_inst_11_doutb(2),
            S0 => dff_q_3
        );

    mux_inst_32: MUX2
        port map (
            O => doutb(2),
            I0 => mux_o_30,
            I1 => mux_o_31,
            S0 => dff_q_2
        );

    mux_inst_33: MUX2
        port map (
            O => mux_o_33,
            I0 => dpb_inst_12_doutb(3),
            I1 => dpb_inst_13_doutb(3),
            S0 => dff_q_3
        );

    mux_inst_34: MUX2
        port map (
            O => mux_o_34,
            I0 => dpb_inst_14_doutb(3),
            I1 => dpb_inst_15_doutb(3),
            S0 => dff_q_3
        );

    mux_inst_35: MUX2
        port map (
            O => doutb(3),
            I0 => mux_o_33,
            I1 => mux_o_34,
            S0 => dff_q_2
        );

    mux_inst_36: MUX2
        port map (
            O => mux_o_36,
            I0 => dpb_inst_16_doutb(4),
            I1 => dpb_inst_17_doutb(4),
            S0 => dff_q_3
        );

    mux_inst_37: MUX2
        port map (
            O => mux_o_37,
            I0 => dpb_inst_18_doutb(4),
            I1 => dpb_inst_19_doutb(4),
            S0 => dff_q_3
        );

    mux_inst_38: MUX2
        port map (
            O => doutb(4),
            I0 => mux_o_36,
            I1 => mux_o_37,
            S0 => dff_q_2
        );

    mux_inst_39: MUX2
        port map (
            O => mux_o_39,
            I0 => dpb_inst_20_doutb(5),
            I1 => dpb_inst_21_doutb(5),
            S0 => dff_q_3
        );

    mux_inst_40: MUX2
        port map (
            O => mux_o_40,
            I0 => dpb_inst_22_doutb(5),
            I1 => dpb_inst_23_doutb(5),
            S0 => dff_q_3
        );

    mux_inst_41: MUX2
        port map (
            O => doutb(5),
            I0 => mux_o_39,
            I1 => mux_o_40,
            S0 => dff_q_2
        );

    mux_inst_42: MUX2
        port map (
            O => mux_o_42,
            I0 => dpb_inst_24_doutb(6),
            I1 => dpb_inst_25_doutb(6),
            S0 => dff_q_3
        );

    mux_inst_43: MUX2
        port map (
            O => mux_o_43,
            I0 => dpb_inst_26_doutb(6),
            I1 => dpb_inst_27_doutb(6),
            S0 => dff_q_3
        );

    mux_inst_44: MUX2
        port map (
            O => doutb(6),
            I0 => mux_o_42,
            I1 => mux_o_43,
            S0 => dff_q_2
        );

    mux_inst_45: MUX2
        port map (
            O => mux_o_45,
            I0 => dpb_inst_28_doutb(7),
            I1 => dpb_inst_29_doutb(7),
            S0 => dff_q_3
        );

    mux_inst_46: MUX2
        port map (
            O => mux_o_46,
            I0 => dpb_inst_30_doutb(7),
            I1 => dpb_inst_31_doutb(7),
            S0 => dff_q_3
        );

    mux_inst_47: MUX2
        port map (
            O => doutb(7),
            I0 => mux_o_45,
            I1 => mux_o_46,
            S0 => dff_q_2
        );

end Behavioral; --Gowin_DPB_64kram
