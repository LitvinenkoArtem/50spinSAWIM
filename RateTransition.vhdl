-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\RateTransition\RateTransition_tc.vhd
-- Created: 2022-02-10 17:15:36
-- 
-- Generated by MATLAB 9.1 and HDL Coder 3.9
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: RateTransition_tc
-- Source Path: RateTransition_tc
-- Hierarchy Level: 1
-- 
-- Master clock enable input: clk_enable
-- 
-- enb         : identical to clk_enable
-- enb_1_4_0   : 4x slower than clk_enable with last phase
-- enb_1_4_1   : 4x slower than clk_enable with phase 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY RateTransition_tc IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        enb                               :   OUT   std_logic;
        enb_1_4_0                         :   OUT   std_logic;
        enb_1_4_1                         :   OUT   std_logic
        );
END RateTransition_tc;


ARCHITECTURE rtl OF RateTransition_tc IS

  -- Signals
  SIGNAL count4                           : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL phase_all                        : std_logic;
  SIGNAL phase_0                          : std_logic;
  SIGNAL phase_0_tmp                      : std_logic;
  SIGNAL phase_1                          : std_logic;
  SIGNAL phase_1_tmp                      : std_logic;

BEGIN
  Counter4 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      count4 <= to_unsigned(1, 2);
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        IF count4 = to_unsigned(3, 2) THEN
          count4 <= to_unsigned(0, 2);
        ELSE
          count4 <= count4 + 1;
        END IF;
      END IF;
    END IF; 
  END PROCESS Counter4;

  phase_all <= '1' WHEN clk_enable = '1' ELSE '0';

  temp_process1 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      phase_0 <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        phase_0 <= phase_0_tmp;
      END IF;
    END IF; 
  END PROCESS temp_process1;

  phase_0_tmp <= '1' WHEN count4 = to_unsigned(3, 2) AND clk_enable = '1' ELSE '0';

  temp_process2 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      phase_1 <= '1';
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        phase_1 <= phase_1_tmp;
      END IF;
    END IF; 
  END PROCESS temp_process2;

  phase_1_tmp <= '1' WHEN count4 = to_unsigned(0, 2) AND clk_enable = '1' ELSE '0';

  enb <=  phase_all AND clk_enable;

  enb_1_4_0 <=  phase_0 AND clk_enable;

  enb_1_4_1 <=  phase_1 AND clk_enable;


END rtl;

