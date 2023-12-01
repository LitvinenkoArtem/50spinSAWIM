-- -------------------------------------------------------------
-- 
-- Module: MATRIX
-- 
-- -------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.work_pack.all;

entity MATRIX_CTRL is
  port( clk									:   in    std_logic;
        reset								:   in    std_logic;
        clk_enable						:   in    std_logic;
        PHASE_in							:   in    std_logic_vector(7 downto 0);  -- int8
        ce_out								:   out   std_logic;
        CONTROL_COEFF					:   out   std_logic_vector(7 downto 0);  -- int8
	     COUNTER_FLAG						:   out   std_logic
        );
end MATRIX_CTRL;


architecture rtl of MATRIX_CTRL is

  -- signals
  signal enb								: std_logic;

  signal PHASE_in_signed					: signed(7 downto 0);  -- int8
  signal PHASE_in_unsigned					: unsigned(7 downto 0);  -- int8
  
  signal Delay1_out1						: signed(7 downto 0);  -- int8
  signal Delay2_out1						: signed(7 downto 0);  -- int8
  signal Delay3_out1						: signed(7 downto 0);  -- int8
  signal Delay4_out1						: signed(7 downto 0);  -- int8
  signal Delay5_out1						: signed(7 downto 0);  -- int8
  signal Delay6_out1						: signed(7 downto 0);  -- int8
  signal Delay7_out1						: signed(7 downto 0);  -- int8
  signal Delay8_out1						: signed(7 downto 0);  -- int8
  signal Delay9_out1						: signed(7 downto 0);  -- int8
  signal Delay10_out1						: signed(7 downto 0);  -- int8
  signal Delay11_out1						: signed(7 downto 0);  -- int8
  signal Delay12_out1						: signed(7 downto 0);  -- int8
  signal Delay13_out1						: signed(7 downto 0);  -- int8
  signal Delay14_out1						: signed(7 downto 0);  -- int8
  signal Delay15_out1						: signed(7 downto 0);  -- int8
  signal Delay16_out1						: signed(7 downto 0);  -- int8
  signal Delay17_out1						: signed(7 downto 0);  -- int8
  signal Delay18_out1						: signed(7 downto 0);  -- int8
  signal Delay19_out1						: signed(7 downto 0);  -- int8
  signal Delay20_out1						: signed(7 downto 0);  -- int8
  signal Delay21_out1						: signed(7 downto 0);  -- int8
  signal Delay22_out1						: signed(7 downto 0);  -- int8
  signal Delay23_out1						: signed(7 downto 0);  -- int8
  signal Delay24_out1						: signed(7 downto 0);  -- int8
  signal Delay25_out1						: signed(7 downto 0);  -- int8
  signal Delay26_out1						: signed(7 downto 0);  -- int8
  signal Delay27_out1						: signed(7 downto 0);  -- int8
  signal Delay28_out1						: signed(7 downto 0);  -- int8
  signal Delay29_out1						: signed(7 downto 0);  -- int8
  signal Delay30_out1						: signed(7 downto 0);  -- int8
  signal Delay31_out1						: signed(7 downto 0);  -- int8
  signal Delay32_out1						: signed(7 downto 0);  -- int8
  signal Delay33_out1						: signed(7 downto 0);  -- int8
  signal Delay34_out1						: signed(7 downto 0);  -- int8
  signal Delay35_out1						: signed(7 downto 0);  -- int8
  signal Delay36_out1						: signed(7 downto 0);  -- int8
  signal Delay37_out1						: signed(7 downto 0);  -- int8
  signal Delay38_out1						: signed(7 downto 0);  -- int8
  signal Delay39_out1						: signed(7 downto 0);  -- int8
  signal Delay40_out1						: signed(7 downto 0);  -- int8
  signal Delay41_out1						: signed(7 downto 0);  -- int8
  signal Delay42_out1						: signed(7 downto 0);  -- int8
  signal Delay43_out1						: signed(7 downto 0);  -- int8
  signal Delay44_out1						: signed(7 downto 0);  -- int8
  signal Delay45_out1						: signed(7 downto 0);  -- int8
  signal Delay46_out1						: signed(7 downto 0);  -- int8
  signal Delay47_out1						: signed(7 downto 0);  -- int8
  signal Delay48_out1						: signed(7 downto 0);  -- int8
  signal Delay49_out1						: signed(7 downto 0);  -- int8
  
  signal Product1_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product2_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product3_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product4_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product5_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product6_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product7_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product8_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product9_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product10_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product11_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product12_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product13_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product14_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product15_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product16_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product17_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product18_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product19_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product20_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product21_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product22_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product23_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product24_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product25_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product26_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product27_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product28_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product29_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product30_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product31_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product32_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product33_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product34_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product35_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product36_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product37_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product38_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product39_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product40_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product41_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product42_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product43_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product44_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product45_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product46_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product47_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product48_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product49_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	
  signal Product50_out1						: vector_of_signed8(0 to 49);  -- int8 [7]	

  signal Product1_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product2_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product3_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product4_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product5_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product6_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product7_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product8_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product9_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product10_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product11_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product12_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product13_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product14_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product15_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product16_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product17_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product18_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product19_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product20_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product21_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product22_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product23_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product24_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product25_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product26_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product27_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product28_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product29_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product30_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product31_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product32_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product33_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product34_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product35_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product36_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product37_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product38_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product39_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product40_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product41_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product42_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product43_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product44_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product45_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product46_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product47_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product48_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product49_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7]
  signal Product50_out1_1						: vector_of_signed8(0 to 49);  -- int8 [7] 

  signal Matrix_Sum2_add_temp					: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_1				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_2				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_3				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_4				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_5				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_6				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_7				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_8				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_9				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_10				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_11				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_12				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_13				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_14				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_15				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_16				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_17				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_18				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_19				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_20				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_21				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_22				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_23				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_24				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_25				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_26				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_27				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_28				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_29				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_30				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_31				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_32				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_33				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_34				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_35				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_36				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_37				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_38				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_39				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_40				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_41				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_42				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_43				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_44				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_45				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_46				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_add_temp_47				: vector_of_signed8(0 to 49);  -- sfix8 [7]
  signal Matrix_Sum2_out1						: vector_of_signed8(0 to 49);  -- int8 [7]
  
  signal CONTROL_COEFF_array					: vector_of_signed8(0 to 49);
  signal CONTROL_COEFF_array_final			: vector_of_signed8(0 to 49);
  signal CONTROL_COEFF_array_final_loop	: vector_of_signed8(0 to 49);
  
  signal CTRL_unsigned								: unsigned(7 downto 0);  -- int8
  
  signal Multiport_Switch_out				: signed(7 downto 0);  -- int8
  
  signal switch_compare						: std_logic;  -- boolean
  signal Relational_Operator1_relop1	: std_logic;  -- boolean
  signal ce										: std_logic;  -- boolean
  
  signal counter_up							: unsigned(7 downto 0);

  constant Jij : MEMORY := (											('0','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('1','0','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('1','1','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('1','0','0','0','0','0','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','1','0','0','0','0','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','1','0','0','0','1','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','1','0','0','0','0','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','1','0','0','1','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','1','0','0','0','0','0','0','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','1','0','0','0','0','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','1','0','0','0','1','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','1','0','0','0','0','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','1','0','0','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','1','0','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
										('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0')	);

begin


	PHASE_in_signed <= to_signed(1, PHASE_in_signed'length)		 when to_integer(unsigned(PHASE_in(7 downto 0))) >= to_unsigned(16#90#, 8) else
							 to_signed(-1, PHASE_in_signed'length)    when to_integer(unsigned(PHASE_in(7 downto 0))) <= to_unsigned(16#8E#, 8) else
							 to_signed(0, PHASE_in_signed'length);


--  Input_process : process (clk, reset)
--  begin
--    if reset = '1' then
--	 PHASE_in_signed <= to_signed(0, PHASE_in_signed'length);
--	 elsif clk'EVENT and clk = '1' then
--       if enb = '1' then
--		 PHASE_in_signed <= to_signed(10, PHASE_in_signed'length)		 when to_integer(unsigned(PHASE_in(7 downto 0))) > to_unsigned(16#92#, 8)  else
--							     to_signed(0, PHASE_in_signed'length)	 	    when to_integer(unsigned(PHASE_in(7 downto 0))) <= to_unsigned(16#92#, 8) and to_integer(unsigned(PHASE_in(7 downto 0))) >= to_unsigned(16#88#, 8) else
--							     to_signed(-10, PHASE_in_signed'length)      when to_integer(unsigned(PHASE_in(7 downto 0))) < to_unsigned(16#88#, 8);
--	    end if;
--    end if;
--  end process Input_process;	


--	PHASE_in_signed <= signed(PHASE_in_unsigned);

--  PHASE_in_unsigned <= unsigned("0" & "0" & PHASE_in(7 downto 2)) - 38;
--  PHASE_in_signed <= signed(PHASE_in_unsigned);


--  if PHASE_in_unsigned < to_unsigned(16#39#, 8) then
--		counter_up <= counter_up + 1;
--  else 
--	counter_up <= to_unsigned(16#00#, 8);
--  end if;


  Delays_process : process (clk, reset)
  begin
    if reset = '1' then
	  Delay1_out1	 <= to_signed(16#00#, 8);
	  Delay2_out1	 <= to_signed(16#00#, 8);
	  Delay3_out1	 <= to_signed(16#00#, 8);
	  Delay4_out1	 <= to_signed(16#00#, 8);
	  Delay5_out1	 <= to_signed(16#00#, 8);
	  Delay6_out1	 <= to_signed(16#00#, 8);
	  Delay7_out1	 <= to_signed(16#00#, 8);
	  Delay8_out1	 <= to_signed(16#00#, 8);
	  Delay9_out1	 <= to_signed(16#00#, 8);
	  Delay10_out1	 <= to_signed(16#00#, 8);
	  Delay11_out1	 <= to_signed(16#00#, 8);
	  Delay12_out1	 <= to_signed(16#00#, 8);
	  Delay13_out1	 <= to_signed(16#00#, 8);
	  Delay14_out1	 <= to_signed(16#00#, 8);
	  Delay15_out1	 <= to_signed(16#00#, 8);
	  Delay16_out1	 <= to_signed(16#00#, 8);
	  Delay17_out1	 <= to_signed(16#00#, 8);
	  Delay18_out1	 <= to_signed(16#00#, 8);
	  Delay19_out1	 <= to_signed(16#00#, 8);
	  Delay20_out1	 <= to_signed(16#00#, 8);
	  Delay21_out1	 <= to_signed(16#00#, 8);
	  Delay22_out1	 <= to_signed(16#00#, 8);
	  Delay23_out1	 <= to_signed(16#00#, 8);
	  Delay24_out1	 <= to_signed(16#00#, 8);
	  Delay25_out1	 <= to_signed(16#00#, 8);
	  Delay26_out1	 <= to_signed(16#00#, 8);
	  Delay27_out1	 <= to_signed(16#00#, 8);
	  Delay28_out1	 <= to_signed(16#00#, 8);
	  Delay29_out1	 <= to_signed(16#00#, 8);
	  Delay30_out1	 <= to_signed(16#00#, 8);
	  Delay31_out1	 <= to_signed(16#00#, 8);
	  Delay32_out1	 <= to_signed(16#00#, 8);
	  Delay33_out1	 <= to_signed(16#00#, 8);
	  Delay34_out1	 <= to_signed(16#00#, 8);
	  Delay35_out1	 <= to_signed(16#00#, 8);
	  Delay36_out1	 <= to_signed(16#00#, 8);
	  Delay37_out1	 <= to_signed(16#00#, 8);
	  Delay38_out1	 <= to_signed(16#00#, 8);
	  Delay39_out1	 <= to_signed(16#00#, 8);
	  Delay40_out1	 <= to_signed(16#00#, 8);
	  Delay41_out1	 <= to_signed(16#00#, 8);
	  Delay42_out1	 <= to_signed(16#00#, 8);
	  Delay43_out1	 <= to_signed(16#00#, 8);
	  Delay44_out1	 <= to_signed(16#00#, 8);
	  Delay45_out1	 <= to_signed(16#00#, 8);
	  Delay46_out1	 <= to_signed(16#00#, 8);
	  Delay47_out1	 <= to_signed(16#00#, 8);
	  Delay48_out1	 <= to_signed(16#00#, 8);
	  Delay49_out1	 <= to_signed(16#00#, 8);
     elsif clk'EVENT and clk = '1' then
       if enb = '1' then
			Delay1_out1 <= PHASE_in_signed;
			Delay2_out1	 <= Delay1_out1;
			Delay3_out1	 <= Delay2_out1;
			Delay4_out1	 <= Delay3_out1;
			Delay5_out1	 <= Delay4_out1;
			Delay6_out1	 <= Delay5_out1;
			Delay7_out1	 <= Delay6_out1;
			Delay8_out1	 <= Delay7_out1;
			Delay9_out1	 <= Delay8_out1;
			Delay10_out1	 <= Delay9_out1;
			Delay11_out1	 <= Delay10_out1;
			Delay12_out1	 <= Delay11_out1;
			Delay13_out1	 <= Delay12_out1;
			Delay14_out1	 <= Delay13_out1;
			Delay15_out1	 <= Delay14_out1;
			Delay16_out1	 <= Delay15_out1;
			Delay17_out1	 <= Delay16_out1;
			Delay18_out1	 <= Delay17_out1;
			Delay19_out1	 <= Delay18_out1;
			Delay20_out1	 <= Delay19_out1;
			Delay21_out1	 <= Delay20_out1;
			Delay22_out1	 <= Delay21_out1;
			Delay23_out1	 <= Delay22_out1;
			Delay24_out1	 <= Delay23_out1;
			Delay25_out1	 <= Delay24_out1;
			Delay26_out1	 <= Delay25_out1;
			Delay27_out1	 <= Delay26_out1;
			Delay28_out1	 <= Delay27_out1;
			Delay29_out1	 <= Delay28_out1;
			Delay30_out1	 <= Delay29_out1;
			Delay31_out1	 <= Delay30_out1;
			Delay32_out1	 <= Delay31_out1;
			Delay33_out1	 <= Delay32_out1;
			Delay34_out1	 <= Delay33_out1;
			Delay35_out1	 <= Delay34_out1;
			Delay36_out1	 <= Delay35_out1;
			Delay37_out1	 <= Delay36_out1;
			Delay38_out1	 <= Delay37_out1;
			Delay39_out1	 <= Delay38_out1;
			Delay40_out1	 <= Delay39_out1;
			Delay41_out1	 <= Delay40_out1;
			Delay42_out1	 <= Delay41_out1;
			Delay43_out1	 <= Delay42_out1;
			Delay44_out1	 <= Delay43_out1;
			Delay45_out1	 <= Delay44_out1;
			Delay46_out1	 <= Delay45_out1;
			Delay47_out1	 <= Delay46_out1;
			Delay48_out1	 <= Delay47_out1;
			Delay49_out1	 <= Delay48_out1;		
       end if;
    end if;
  end process Delays_process;




  Product_out1_gen: for i in 0 to 49 generate
    
    Product1_out1(i) <= PHASE_in_signed	when Jij(0,i) = '1' else		to_signed(16#00#, 8);
    Product2_out1(i) <= Delay1_out1		when Jij(1,i) = '1' else		to_signed(16#00#, 8);
    Product3_out1(i) <= Delay2_out1		when Jij(2,i) = '1' else		to_signed(16#00#, 8);
    Product4_out1(i) <= Delay3_out1		when Jij(3,i) = '1' else		to_signed(16#00#, 8);
    Product5_out1(i) <= Delay4_out1		when Jij(4,i) = '1' else		to_signed(16#00#, 8);
    Product6_out1(i) <= Delay5_out1		when Jij(5,i) = '1' else		to_signed(16#00#, 8);
    Product7_out1(i) <= Delay6_out1		when Jij(6,i) = '1' else		to_signed(16#00#, 8);
    Product8_out1(i) <= Delay7_out1		when Jij(7,i) = '1' else		to_signed(16#00#, 8);
    Product9_out1(i) <= Delay8_out1		when Jij(8,i) = '1' else		to_signed(16#00#, 8);
    Product10_out1(i) <= Delay9_out1		when Jij(9,i) = '1' else		to_signed(16#00#, 8);
    Product11_out1(i) <= Delay10_out1		when Jij(10,i) = '1' else		to_signed(16#00#, 8);
    Product12_out1(i) <= Delay11_out1		when Jij(11,i) = '1' else		to_signed(16#00#, 8);
    Product13_out1(i) <= Delay12_out1		when Jij(12,i) = '1' else		to_signed(16#00#, 8);
    Product14_out1(i) <= Delay13_out1		when Jij(13,i) = '1' else		to_signed(16#00#, 8);
    Product15_out1(i) <= Delay14_out1		when Jij(14,i) = '1' else		to_signed(16#00#, 8);
    Product16_out1(i) <= Delay15_out1		when Jij(15,i) = '1' else		to_signed(16#00#, 8);
    Product17_out1(i) <= Delay16_out1		when Jij(16,i) = '1' else		to_signed(16#00#, 8);
    Product18_out1(i) <= Delay17_out1		when Jij(17,i) = '1' else		to_signed(16#00#, 8);
    Product19_out1(i) <= Delay18_out1		when Jij(18,i) = '1' else		to_signed(16#00#, 8);
    Product20_out1(i) <= Delay19_out1		when Jij(19,i) = '1' else		to_signed(16#00#, 8);
    Product21_out1(i) <= Delay20_out1		when Jij(20,i) = '1' else		to_signed(16#00#, 8);
    Product22_out1(i) <= Delay21_out1		when Jij(21,i) = '1' else		to_signed(16#00#, 8);
    Product23_out1(i) <= Delay22_out1		when Jij(22,i) = '1' else		to_signed(16#00#, 8);
    Product24_out1(i) <= Delay23_out1		when Jij(23,i) = '1' else		to_signed(16#00#, 8);
    Product25_out1(i) <= Delay24_out1		when Jij(24,i) = '1' else		to_signed(16#00#, 8);
    Product26_out1(i) <= Delay25_out1		when Jij(25,i) = '1' else		to_signed(16#00#, 8);
    Product27_out1(i) <= Delay26_out1		when Jij(26,i) = '1' else		to_signed(16#00#, 8);
    Product28_out1(i) <= Delay27_out1		when Jij(27,i) = '1' else		to_signed(16#00#, 8);
    Product29_out1(i) <= Delay28_out1		when Jij(28,i) = '1' else		to_signed(16#00#, 8);
    Product30_out1(i) <= Delay29_out1		when Jij(29,i) = '1' else		to_signed(16#00#, 8);
    Product31_out1(i) <= Delay30_out1		when Jij(30,i) = '1' else		to_signed(16#00#, 8);
    Product32_out1(i) <= Delay31_out1		when Jij(31,i) = '1' else		to_signed(16#00#, 8);
    Product33_out1(i) <= Delay32_out1		when Jij(32,i) = '1' else		to_signed(16#00#, 8);
    Product34_out1(i) <= Delay33_out1		when Jij(33,i) = '1' else		to_signed(16#00#, 8);
    Product35_out1(i) <= Delay34_out1		when Jij(34,i) = '1' else		to_signed(16#00#, 8);
    Product36_out1(i) <= Delay35_out1		when Jij(35,i) = '1' else		to_signed(16#00#, 8);
    Product37_out1(i) <= Delay36_out1		when Jij(36,i) = '1' else		to_signed(16#00#, 8);
    Product38_out1(i) <= Delay37_out1		when Jij(37,i) = '1' else		to_signed(16#00#, 8);
    Product39_out1(i) <= Delay38_out1		when Jij(38,i) = '1' else		to_signed(16#00#, 8);
    Product40_out1(i) <= Delay39_out1		when Jij(39,i) = '1' else		to_signed(16#00#, 8);
    Product41_out1(i) <= Delay40_out1		when Jij(40,i) = '1' else		to_signed(16#00#, 8);
    Product42_out1(i) <= Delay41_out1		when Jij(41,i) = '1' else		to_signed(16#00#, 8);
    Product43_out1(i) <= Delay42_out1		when Jij(42,i) = '1' else		to_signed(16#00#, 8);
    Product44_out1(i) <= Delay43_out1		when Jij(43,i) = '1' else		to_signed(16#00#, 8);
    Product45_out1(i) <= Delay44_out1		when Jij(44,i) = '1' else		to_signed(16#00#, 8);
    Product46_out1(i) <= Delay45_out1		when Jij(45,i) = '1' else		to_signed(16#00#, 8);
    Product47_out1(i) <= Delay46_out1		when Jij(46,i) = '1' else		to_signed(16#00#, 8);
    Product48_out1(i) <= Delay47_out1		when Jij(47,i) = '1' else		to_signed(16#00#, 8);
    Product49_out1(i) <= Delay48_out1		when Jij(48,i) = '1' else		to_signed(16#00#, 8);
    Product50_out1(i) <= Delay49_out1		when Jij(49,i) = '1' else		to_signed(16#00#, 8);
	
  end generate Product_out1_gen;



  ce <= '1';
  enb <= clk_enable;
  
  PipelineRegisters_process : process (clk, reset)
  begin
    if reset = '1' then
      Product1_out1_1 <= (others => to_signed(16#00#, 8));
      Product2_out1_1 <= (others => to_signed(16#00#, 8));
      Product3_out1_1 <= (others => to_signed(16#00#, 8));
      Product4_out1_1 <= (others => to_signed(16#00#, 8));
      Product5_out1_1 <= (others => to_signed(16#00#, 8));
      Product6_out1_1 <= (others => to_signed(16#00#, 8));
      Product7_out1_1 <= (others => to_signed(16#00#, 8));
      Product8_out1_1 <= (others => to_signed(16#00#, 8));
      Product9_out1_1 <= (others => to_signed(16#00#, 8));
      Product10_out1_1 <= (others => to_signed(16#00#, 8));
      Product11_out1_1 <= (others => to_signed(16#00#, 8));
      Product12_out1_1 <= (others => to_signed(16#00#, 8));
      Product13_out1_1 <= (others => to_signed(16#00#, 8));
      Product14_out1_1 <= (others => to_signed(16#00#, 8));
      Product15_out1_1 <= (others => to_signed(16#00#, 8));
      Product16_out1_1 <= (others => to_signed(16#00#, 8));
      Product17_out1_1 <= (others => to_signed(16#00#, 8));
      Product18_out1_1 <= (others => to_signed(16#00#, 8));
      Product19_out1_1 <= (others => to_signed(16#00#, 8));
      Product20_out1_1 <= (others => to_signed(16#00#, 8));
      Product21_out1_1 <= (others => to_signed(16#00#, 8));
      Product22_out1_1 <= (others => to_signed(16#00#, 8));
      Product23_out1_1 <= (others => to_signed(16#00#, 8));
      Product24_out1_1 <= (others => to_signed(16#00#, 8));
      Product25_out1_1 <= (others => to_signed(16#00#, 8));
      Product26_out1_1 <= (others => to_signed(16#00#, 8));
      Product27_out1_1 <= (others => to_signed(16#00#, 8));
      Product28_out1_1 <= (others => to_signed(16#00#, 8));
      Product29_out1_1 <= (others => to_signed(16#00#, 8));
      Product30_out1_1 <= (others => to_signed(16#00#, 8));
      Product31_out1_1 <= (others => to_signed(16#00#, 8));
      Product32_out1_1 <= (others => to_signed(16#00#, 8));
      Product33_out1_1 <= (others => to_signed(16#00#, 8));
      Product34_out1_1 <= (others => to_signed(16#00#, 8));
      Product35_out1_1 <= (others => to_signed(16#00#, 8));
      Product36_out1_1 <= (others => to_signed(16#00#, 8));
      Product37_out1_1 <= (others => to_signed(16#00#, 8));
      Product38_out1_1 <= (others => to_signed(16#00#, 8));
      Product39_out1_1 <= (others => to_signed(16#00#, 8));
      Product40_out1_1 <= (others => to_signed(16#00#, 8));
      Product41_out1_1 <= (others => to_signed(16#00#, 8));
      Product42_out1_1 <= (others => to_signed(16#00#, 8));
      Product43_out1_1 <= (others => to_signed(16#00#, 8));
      Product44_out1_1 <= (others => to_signed(16#00#, 8));
      Product45_out1_1 <= (others => to_signed(16#00#, 8));
      Product46_out1_1 <= (others => to_signed(16#00#, 8));
      Product47_out1_1 <= (others => to_signed(16#00#, 8));
      Product48_out1_1 <= (others => to_signed(16#00#, 8));
      Product49_out1_1 <= (others => to_signed(16#00#, 8));
      Product50_out1_1 <= (others => to_signed(16#00#, 8));
    elsif clk'EVENT and clk = '1' then
      if enb = '1' then
        Product1_out1_1 <= Product1_out1;
        Product2_out1_1 <= Product2_out1;
        Product3_out1_1 <= Product3_out1;
        Product4_out1_1 <= Product4_out1;
        Product5_out1_1 <= Product5_out1;
        Product6_out1_1 <= Product6_out1;
        Product7_out1_1 <= Product7_out1;
        Product8_out1_1 <= Product8_out1;
        Product9_out1_1 <= Product9_out1;
        Product10_out1_1 <= Product10_out1;
        Product11_out1_1 <= Product11_out1;
        Product12_out1_1 <= Product12_out1;
        Product13_out1_1 <= Product13_out1;
        Product14_out1_1 <= Product14_out1;
        Product15_out1_1 <= Product15_out1;
        Product16_out1_1 <= Product16_out1;
        Product17_out1_1 <= Product17_out1;
        Product18_out1_1 <= Product18_out1;
        Product19_out1_1 <= Product19_out1;
        Product20_out1_1 <= Product20_out1;
        Product21_out1_1 <= Product21_out1;
        Product22_out1_1 <= Product22_out1;
        Product23_out1_1 <= Product23_out1;
        Product24_out1_1 <= Product24_out1;
        Product25_out1_1 <= Product25_out1;
        Product26_out1_1 <= Product26_out1;
        Product27_out1_1 <= Product27_out1;
        Product28_out1_1 <= Product28_out1;
        Product29_out1_1 <= Product29_out1;
        Product30_out1_1 <= Product30_out1;
        Product31_out1_1 <= Product31_out1;
        Product32_out1_1 <= Product32_out1;
        Product33_out1_1 <= Product33_out1;
        Product34_out1_1 <= Product34_out1;
        Product35_out1_1 <= Product35_out1;
        Product36_out1_1 <= Product36_out1;
        Product37_out1_1 <= Product37_out1;
        Product38_out1_1 <= Product38_out1;
        Product39_out1_1 <= Product39_out1;
        Product40_out1_1 <= Product40_out1;
        Product41_out1_1 <= Product41_out1;
        Product42_out1_1 <= Product42_out1;
        Product43_out1_1 <= Product43_out1;
        Product44_out1_1 <= Product44_out1;
        Product45_out1_1 <= Product45_out1;
        Product46_out1_1 <= Product46_out1;
        Product47_out1_1 <= Product47_out1;
        Product48_out1_1 <= Product48_out1;
        Product49_out1_1 <= Product49_out1;
        Product50_out1_1 <= Product50_out1;
      end if;
    end if;
  end process PipelineRegisters_process;




  Matrix_Sum2_out1_gen: for i in 0 to 49 generate
    
    Matrix_Sum2_add_temp(i)				<= Product1_out1_1(i) + Product2_out1_1(i);
    Matrix_Sum2_add_temp_1(i)			<= Matrix_Sum2_add_temp(i) + Product3_out1_1(i);
    Matrix_Sum2_add_temp_2(i)			<= Matrix_Sum2_add_temp_1(i) + Product4_out1_1(i);
    Matrix_Sum2_add_temp_3(i)			<= Matrix_Sum2_add_temp_2(i) + Product5_out1_1(i);
    Matrix_Sum2_add_temp_4(i)			<= Matrix_Sum2_add_temp_3(i) + Product6_out1_1(i);
    Matrix_Sum2_add_temp_5(i)			<= Matrix_Sum2_add_temp_4(i) + Product7_out1_1(i);
    Matrix_Sum2_add_temp_6(i)			<= Matrix_Sum2_add_temp_5(i) + Product8_out1_1(i);
    Matrix_Sum2_add_temp_7(i)			<= Matrix_Sum2_add_temp_6(i) + Product9_out1_1(i);
    Matrix_Sum2_add_temp_8(i)			<= Matrix_Sum2_add_temp_7(i) + Product10_out1_1(i);
    Matrix_Sum2_add_temp_9(i)			<= Matrix_Sum2_add_temp_8(i) + Product11_out1_1(i);
    Matrix_Sum2_add_temp_10(i)			<= Matrix_Sum2_add_temp_9(i) + Product12_out1_1(i);
    Matrix_Sum2_add_temp_11(i)			<= Matrix_Sum2_add_temp_10(i) + Product13_out1_1(i);
    Matrix_Sum2_add_temp_12(i)			<= Matrix_Sum2_add_temp_11(i) + Product14_out1_1(i);
    Matrix_Sum2_add_temp_13(i)			<= Matrix_Sum2_add_temp_12(i) + Product15_out1_1(i);
    Matrix_Sum2_add_temp_14(i)			<= Matrix_Sum2_add_temp_13(i) + Product16_out1_1(i);
    Matrix_Sum2_add_temp_15(i)			<= Matrix_Sum2_add_temp_14(i) + Product17_out1_1(i);
    Matrix_Sum2_add_temp_16(i)			<= Matrix_Sum2_add_temp_15(i) + Product18_out1_1(i);
    Matrix_Sum2_add_temp_17(i)			<= Matrix_Sum2_add_temp_16(i) + Product19_out1_1(i);
    Matrix_Sum2_add_temp_18(i)			<= Matrix_Sum2_add_temp_17(i) + Product20_out1_1(i);
    Matrix_Sum2_add_temp_19(i)			<= Matrix_Sum2_add_temp_18(i) + Product21_out1_1(i);
    Matrix_Sum2_add_temp_20(i)			<= Matrix_Sum2_add_temp_19(i) + Product22_out1_1(i);
    Matrix_Sum2_add_temp_21(i)			<= Matrix_Sum2_add_temp_20(i) + Product23_out1_1(i);
    Matrix_Sum2_add_temp_22(i)			<= Matrix_Sum2_add_temp_21(i) + Product24_out1_1(i);
    Matrix_Sum2_add_temp_23(i)			<= Matrix_Sum2_add_temp_22(i) + Product25_out1_1(i);
    Matrix_Sum2_add_temp_24(i)			<= Matrix_Sum2_add_temp_23(i) + Product26_out1_1(i);
    Matrix_Sum2_add_temp_25(i)			<= Matrix_Sum2_add_temp_24(i) + Product27_out1_1(i);
    Matrix_Sum2_add_temp_26(i)			<= Matrix_Sum2_add_temp_25(i) + Product28_out1_1(i);
    Matrix_Sum2_add_temp_27(i)			<= Matrix_Sum2_add_temp_26(i) + Product29_out1_1(i);
    Matrix_Sum2_add_temp_28(i)			<= Matrix_Sum2_add_temp_27(i) + Product30_out1_1(i);
    Matrix_Sum2_add_temp_29(i)			<= Matrix_Sum2_add_temp_28(i) + Product31_out1_1(i);
    Matrix_Sum2_add_temp_30(i)			<= Matrix_Sum2_add_temp_29(i) + Product32_out1_1(i);
    Matrix_Sum2_add_temp_31(i)			<= Matrix_Sum2_add_temp_30(i) + Product33_out1_1(i);
    Matrix_Sum2_add_temp_32(i)			<= Matrix_Sum2_add_temp_31(i) + Product34_out1_1(i);
    Matrix_Sum2_add_temp_33(i)			<= Matrix_Sum2_add_temp_32(i) + Product35_out1_1(i);
    Matrix_Sum2_add_temp_34(i)			<= Matrix_Sum2_add_temp_33(i) + Product36_out1_1(i);
    Matrix_Sum2_add_temp_35(i)			<= Matrix_Sum2_add_temp_34(i) + Product37_out1_1(i);
    Matrix_Sum2_add_temp_36(i)			<= Matrix_Sum2_add_temp_35(i) + Product38_out1_1(i);
    Matrix_Sum2_add_temp_37(i)			<= Matrix_Sum2_add_temp_36(i) + Product39_out1_1(i);
    Matrix_Sum2_add_temp_38(i)			<= Matrix_Sum2_add_temp_37(i) + Product40_out1_1(i);
    Matrix_Sum2_add_temp_39(i)			<= Matrix_Sum2_add_temp_38(i) + Product41_out1_1(i);
    Matrix_Sum2_add_temp_40(i)			<= Matrix_Sum2_add_temp_39(i) + Product42_out1_1(i);
    Matrix_Sum2_add_temp_41(i)			<= Matrix_Sum2_add_temp_40(i) + Product43_out1_1(i);
    Matrix_Sum2_add_temp_42(i)			<= Matrix_Sum2_add_temp_41(i) + Product44_out1_1(i);
    Matrix_Sum2_add_temp_43(i)			<= Matrix_Sum2_add_temp_42(i) + Product45_out1_1(i);
    Matrix_Sum2_add_temp_44(i)			<= Matrix_Sum2_add_temp_43(i) + Product46_out1_1(i);
    Matrix_Sum2_add_temp_45(i)			<= Matrix_Sum2_add_temp_44(i) + Product47_out1_1(i);
    Matrix_Sum2_add_temp_46(i)			<= Matrix_Sum2_add_temp_45(i) + Product48_out1_1(i);
    Matrix_Sum2_add_temp_47(i)			<= Matrix_Sum2_add_temp_46(i) + Product49_out1_1(i);
    Matrix_Sum2_out1(i)					<= Matrix_Sum2_add_temp_47(i) + Product50_out1_1(i);
  end generate Matrix_Sum2_out1_gen;




  outputgen: for k in 0 to 49 generate
  
    CONTROL_COEFF_array(k) <= Matrix_Sum2_out1(k);
	
  end generate outputgen;




  Counter_process : process(clk,reset)
  begin
	if rising_edge(clk) then
		if reset = '1' then
			counter_up <= to_unsigned(16#00#, 8);
		elsif ce = '1' then
			if counter_up < to_unsigned(16#39#, 8) then
				counter_up <= counter_up + 1;
			else 
			counter_up <= to_unsigned(16#00#, 8);
			end if;
		end if;
	end if;
  end process;

  
  Delays2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      CONTROL_COEFF_array_final_loop(0) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(1) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(1) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(2) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(3) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(4) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(5) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(6) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(7) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(8) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(9) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(10) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(11) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(12) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(13) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(14) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(15) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(16) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(17) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(18) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(19) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(20) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(21) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(22) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(23) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(24) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(25) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(26) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(27) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(28) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(29) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(30) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(31) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(32) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(33) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(34) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(35) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(36) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(37) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(38) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(39) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(40) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(41) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(42) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(43) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(44) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(45) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(46) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(47) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(48) <= to_signed(16#00#, 8);
	  CONTROL_COEFF_array_final_loop(49) <= to_signed(16#00#, 8);
    ELSIF clk'EVENT AND clk = '1'  THEN
      IF enb = '1' THEN
        CONTROL_COEFF_array_final_loop(0) <= CONTROL_COEFF_array_final(0);
		CONTROL_COEFF_array_final_loop(1) <= CONTROL_COEFF_array_final(1);
		CONTROL_COEFF_array_final_loop(2) <= CONTROL_COEFF_array_final(2);
		CONTROL_COEFF_array_final_loop(3) <= CONTROL_COEFF_array_final(3);
		CONTROL_COEFF_array_final_loop(4) <= CONTROL_COEFF_array_final(4);
		CONTROL_COEFF_array_final_loop(5) <= CONTROL_COEFF_array_final(5);
		CONTROL_COEFF_array_final_loop(6) <= CONTROL_COEFF_array_final(6);
		CONTROL_COEFF_array_final_loop(7) <= CONTROL_COEFF_array_final(7);
		CONTROL_COEFF_array_final_loop(8) <= CONTROL_COEFF_array_final(8);
		CONTROL_COEFF_array_final_loop(9) <= CONTROL_COEFF_array_final(9);
		CONTROL_COEFF_array_final_loop(10) <= CONTROL_COEFF_array_final(10);
		CONTROL_COEFF_array_final_loop(11) <= CONTROL_COEFF_array_final(11);
		CONTROL_COEFF_array_final_loop(12) <= CONTROL_COEFF_array_final(12);
		CONTROL_COEFF_array_final_loop(13) <= CONTROL_COEFF_array_final(13);
		CONTROL_COEFF_array_final_loop(14) <= CONTROL_COEFF_array_final(14);
		CONTROL_COEFF_array_final_loop(15) <= CONTROL_COEFF_array_final(15);
		CONTROL_COEFF_array_final_loop(16) <= CONTROL_COEFF_array_final(16);
		CONTROL_COEFF_array_final_loop(17) <= CONTROL_COEFF_array_final(17);
		CONTROL_COEFF_array_final_loop(18) <= CONTROL_COEFF_array_final(18);
		CONTROL_COEFF_array_final_loop(19) <= CONTROL_COEFF_array_final(19);
		CONTROL_COEFF_array_final_loop(20) <= CONTROL_COEFF_array_final(20);
		CONTROL_COEFF_array_final_loop(21) <= CONTROL_COEFF_array_final(21);
		CONTROL_COEFF_array_final_loop(22) <= CONTROL_COEFF_array_final(22);
		CONTROL_COEFF_array_final_loop(23) <= CONTROL_COEFF_array_final(23);
		CONTROL_COEFF_array_final_loop(24) <= CONTROL_COEFF_array_final(24);
		CONTROL_COEFF_array_final_loop(25) <= CONTROL_COEFF_array_final(25);
		CONTROL_COEFF_array_final_loop(26) <= CONTROL_COEFF_array_final(26);
		CONTROL_COEFF_array_final_loop(27) <= CONTROL_COEFF_array_final(27);
		CONTROL_COEFF_array_final_loop(28) <= CONTROL_COEFF_array_final(28);
		CONTROL_COEFF_array_final_loop(29) <= CONTROL_COEFF_array_final(29);
		CONTROL_COEFF_array_final_loop(30) <= CONTROL_COEFF_array_final(30);
		CONTROL_COEFF_array_final_loop(31) <= CONTROL_COEFF_array_final(31);
		CONTROL_COEFF_array_final_loop(32) <= CONTROL_COEFF_array_final(32);
		CONTROL_COEFF_array_final_loop(33) <= CONTROL_COEFF_array_final(33);
		CONTROL_COEFF_array_final_loop(34) <= CONTROL_COEFF_array_final(34);
		CONTROL_COEFF_array_final_loop(35) <= CONTROL_COEFF_array_final(35);
		CONTROL_COEFF_array_final_loop(36) <= CONTROL_COEFF_array_final(36);
		CONTROL_COEFF_array_final_loop(37) <= CONTROL_COEFF_array_final(37);
		CONTROL_COEFF_array_final_loop(38) <= CONTROL_COEFF_array_final(38);
		CONTROL_COEFF_array_final_loop(39) <= CONTROL_COEFF_array_final(39);
		CONTROL_COEFF_array_final_loop(40) <= CONTROL_COEFF_array_final(40);
		CONTROL_COEFF_array_final_loop(41) <= CONTROL_COEFF_array_final(41);
		CONTROL_COEFF_array_final_loop(42) <= CONTROL_COEFF_array_final(42);
		CONTROL_COEFF_array_final_loop(43) <= CONTROL_COEFF_array_final(43);
		CONTROL_COEFF_array_final_loop(44) <= CONTROL_COEFF_array_final(44);
		CONTROL_COEFF_array_final_loop(45) <= CONTROL_COEFF_array_final(45);
		CONTROL_COEFF_array_final_loop(46) <= CONTROL_COEFF_array_final(46);
		CONTROL_COEFF_array_final_loop(47) <= CONTROL_COEFF_array_final(47);
		CONTROL_COEFF_array_final_loop(48) <= CONTROL_COEFF_array_final(48);
		CONTROL_COEFF_array_final_loop(49) <= CONTROL_COEFF_array_final(49);
      END IF;
    END IF;
  END PROCESS Delays2_process;  
  
  
  Relational_Operator1_relop1 <= '1' when counter_up = to_unsigned(16#32#, 8) else '0';
  COUNTER_FLAG <= '1' when counter_up = to_unsigned(16#2B#, 8) else '0';
  
  holdongen: for k in 0 to 49 generate
  
    CONTROL_COEFF_array_final(k) <= CONTROL_COEFF_array(k) when Relational_Operator1_relop1 = '1' else CONTROL_COEFF_array_final_loop(k);
	
  end generate;
  
  CTRL_unsigned <= counter_up;
  
  Multiport_Switch_out <=		CONTROL_COEFF_array_final(49) when CTRL_unsigned = to_unsigned(16#35#, 8) else
								CONTROL_COEFF_array_final(48) when CTRL_unsigned = to_unsigned(16#36#, 8) else
								CONTROL_COEFF_array_final(47) when CTRL_unsigned = to_unsigned(16#37#, 8) else
								CONTROL_COEFF_array_final(46) when CTRL_unsigned = to_unsigned(16#38#, 8) else
								CONTROL_COEFF_array_final(45) when CTRL_unsigned = to_unsigned(16#39#, 8) else
								CONTROL_COEFF_array_final(44) when CTRL_unsigned = to_unsigned(16#00#, 8) else
								CONTROL_COEFF_array_final(43) when CTRL_unsigned = to_unsigned(16#01#, 8) else
								CONTROL_COEFF_array_final(42) when CTRL_unsigned = to_unsigned(16#02#, 8) else
								CONTROL_COEFF_array_final(41) when CTRL_unsigned = to_unsigned(16#03#, 8) else
								CONTROL_COEFF_array_final(40) when CTRL_unsigned = to_unsigned(16#04#, 8) else
								CONTROL_COEFF_array_final(39) when CTRL_unsigned = to_unsigned(16#05#, 8) else
								CONTROL_COEFF_array_final(38) when CTRL_unsigned = to_unsigned(16#06#, 8) else
								CONTROL_COEFF_array_final(37) when CTRL_unsigned = to_unsigned(16#07#, 8) else
								CONTROL_COEFF_array_final(36) when CTRL_unsigned = to_unsigned(16#08#, 8) else
								CONTROL_COEFF_array_final(35) when CTRL_unsigned = to_unsigned(16#09#, 8) else
								CONTROL_COEFF_array_final(34) when CTRL_unsigned = to_unsigned(16#0A#, 8) else
								CONTROL_COEFF_array_final(33) when CTRL_unsigned = to_unsigned(16#0B#, 8) else
								CONTROL_COEFF_array_final(32) when CTRL_unsigned = to_unsigned(16#0C#, 8) else
								CONTROL_COEFF_array_final(31) when CTRL_unsigned = to_unsigned(16#0D#, 8) else
								CONTROL_COEFF_array_final(30) when CTRL_unsigned = to_unsigned(16#0E#, 8) else
								CONTROL_COEFF_array_final(29) when CTRL_unsigned = to_unsigned(16#0F#, 8) else
								CONTROL_COEFF_array_final(28) when CTRL_unsigned = to_unsigned(16#10#, 8) else
								CONTROL_COEFF_array_final(27) when CTRL_unsigned = to_unsigned(16#11#, 8) else
								CONTROL_COEFF_array_final(26) when CTRL_unsigned = to_unsigned(16#12#, 8) else
								CONTROL_COEFF_array_final(25) when CTRL_unsigned = to_unsigned(16#13#, 8) else
								CONTROL_COEFF_array_final(24) when CTRL_unsigned = to_unsigned(16#14#, 8) else
								CONTROL_COEFF_array_final(23) when CTRL_unsigned = to_unsigned(16#15#, 8) else
								CONTROL_COEFF_array_final(22) when CTRL_unsigned = to_unsigned(16#16#, 8) else
								CONTROL_COEFF_array_final(21) when CTRL_unsigned = to_unsigned(16#17#, 8) else
								CONTROL_COEFF_array_final(20) when CTRL_unsigned = to_unsigned(16#18#, 8) else
								CONTROL_COEFF_array_final(19) when CTRL_unsigned = to_unsigned(16#19#, 8) else
								CONTROL_COEFF_array_final(18) when CTRL_unsigned = to_unsigned(16#1A#, 8) else
								CONTROL_COEFF_array_final(17) when CTRL_unsigned = to_unsigned(16#1B#, 8) else
								CONTROL_COEFF_array_final(16) when CTRL_unsigned = to_unsigned(16#1C#, 8) else
								CONTROL_COEFF_array_final(15) when CTRL_unsigned = to_unsigned(16#1D#, 8) else
								CONTROL_COEFF_array_final(14) when CTRL_unsigned = to_unsigned(16#1E#, 8) else
								CONTROL_COEFF_array_final(13) when CTRL_unsigned = to_unsigned(16#1F#, 8) else
								CONTROL_COEFF_array_final(12) when CTRL_unsigned = to_unsigned(16#20#, 8) else
								CONTROL_COEFF_array_final(11) when CTRL_unsigned = to_unsigned(16#21#, 8) else
								CONTROL_COEFF_array_final(10) when CTRL_unsigned = to_unsigned(16#22#, 8) else
								CONTROL_COEFF_array_final(9) when CTRL_unsigned = to_unsigned(16#23#, 8) else
								CONTROL_COEFF_array_final(8) when CTRL_unsigned = to_unsigned(16#24#, 8) else
								CONTROL_COEFF_array_final(7) when CTRL_unsigned = to_unsigned(16#25#, 8) else
								CONTROL_COEFF_array_final(6) when CTRL_unsigned = to_unsigned(16#26#, 8) else
								CONTROL_COEFF_array_final(5) when CTRL_unsigned = to_unsigned(16#27#, 8) else
								CONTROL_COEFF_array_final(4) when CTRL_unsigned = to_unsigned(16#28#, 8) else
								CONTROL_COEFF_array_final(3) when CTRL_unsigned = to_unsigned(16#29#, 8) else
								CONTROL_COEFF_array_final(2) when CTRL_unsigned = to_unsigned(16#2A#, 8) else
								CONTROL_COEFF_array_final(1) when CTRL_unsigned = to_unsigned(16#2B#, 8) else
								CONTROL_COEFF_array_final(0);

  CONTROL_COEFF  <= std_logic_vector(Multiport_Switch_out);

  ce_out <= clk_enable;

end rtl;
