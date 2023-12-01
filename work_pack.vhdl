LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

package work_pack is

TYPE vector_of_signed8 IS ARRAY (NATURAL RANGE <>) OF signed(7 DOWNTO 0);
--TYPE vector_of_signed16 IS ARRAY (NATURAL RANGE <>) OF signed(15 DOWNTO 0);

TYPE MEMORY is array (0 to 49, 0 to 49) of bit;

component MATRIX_CTRL is
  port( clk									:   in    std_logic;
        reset								:   in    std_logic;
        clk_enable						:   in    std_logic;
        PHASE_in							:   in    std_logic_vector(7 downto 0);  -- int8
        ce_out								:   out   std_logic;
        CONTROL_COEFF					:   out   std_logic_vector(7 downto 0);  -- int8
		  COUNTER_FLAG						:   out   std_logic
        );
END component;

component RateTransition_tc IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        enb                               :   OUT   std_logic;
        enb_1_4_0                         :   OUT   std_logic;
        enb_1_4_1                         :   OUT   std_logic
        );
END component;

end work_pack;