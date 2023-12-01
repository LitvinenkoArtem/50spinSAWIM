library IEEE;
library work;
library UNISIM;
use UNISIM.vcomponents.all;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.work_pack.all;


entity STOSAvectorial_top is
    Port ( 
			-- System 
			  clk_port 						: in  std_logic; -- PAD
			  reset_port 					: in  std_logic; -- PAD
			-- Port
			  PHASE_input_port				: in  std_logic_vector(7 downto 0); -- ADC port
			  CTRL_port						: out  std_logic_vector(7 downto 0); -- Attenuator control and Phase shift control
			  clk_SPIN_port 				: out  std_logic; -- PAD
			  clk_ADC_port					: out  std_logic -- PAD
			  );
			  
end STOSAvectorial_top;

architecture rtl of STOSAvectorial_top is

signal		PHASE_input				: std_logic_vector(7 downto 0);
signal		CTRL_output				: std_logic_vector(7 downto 0);
signal		clk_SPIN				: std_logic;

signal		CTRL_data				: signed(7 downto 0);

-- Wire PAD
signal		clk 		: std_logic;
--signal		clk		: std_logic;
signal		reset_n 	: std_logic;
signal		ce_out 		: std_logic;

--	Ready_1 <= '1';
--	one_w <= '1';
--	zero_w <= '0';
-- Analog module (LEF)

begin

--I_DCM: dcm_clkgen
--    generic map (
--      clkfx_multiply    => 2,		-- Multiply value - M - (2-256)
--      clkfx_divide      => 2,		-- Divide value - D - (1-256)
--      clkin_period      => 240.0		-- Input clock period specified in nS
--    )
--    port map (
--      rst				=> '0',
--      freezedcm			=> '0',
--      clkin				=> clk,
--      clkfx				=> clk
--    );

matrix_control_u: MATRIX_CTRL
	port map ( 
	clk					=> clk,
	reset				=> reset_port,
	clk_enable			=> '1',
	PHASE_in			=> PHASE_input,
	ce_out				=> ce_out,
	CONTROL_COEFF		=> CTRL_output,
	COUNTER_FLAG		=> clk_SPIN
	);

--PHASE_input <= std_logic_vector(Rate_Transition1_out1_1);

--proc_cordic_to_Matrix_Ctrl : process (clk200m)
--begin
--	if clk200m'event and clk200m = '1' then
--		PHASE_data <= std_logic_vector(Zr(7 downto 0));
--	end if;
--end process;

clk <= clk_port;

proc_out_data : process (clk, reset_port)
begin
	if reset_port = '1' then
		CTRL_port <= (others => '0'); 
	else
		if (CTRL_output(7) = '1') then
			CTRL_port <= "1" & not CTRL_output(4 downto 0) & "1" & "0";
		else
			CTRL_port <= "0" & CTRL_output(4 downto 0) & "1" & "0";
		end if;
		clk_SPIN_port <= std_logic(clk_SPIN);  -- something     std_logic_vector(DAC1_data_temp);
		clk_ADC_port <= std_logic(clk);
	end if;
end process;

	

proc_in_data : process (clk, reset_port)
begin
	if reset_port = '1' then
		PHASE_input <= (others => '0');
	else
		if clk'event and clk = '1' then
			PHASE_input <= PHASE_input_port;--"1" & ADC1_data_port(11 downto 1);
		end if;
	end if;
end process;	


--*******PAD******************************************************************


end rtl;