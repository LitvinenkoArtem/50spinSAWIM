`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:10:04 12/07/2010
// Design Name:   dsig_cpu_top
// Module Name:   location
// Project Name:  SAWIM_tb
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FIR6
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////



module STOSAvectorial_tb;

	// Inputs
	reg clk;
	reg clk_enable;
	reg write_data;
	reg reset;
	wire strb_SPIN_data;
	reg strb_ADC_data;
	reg en;
	
	reg [7:0] data_in;
	
	`define NULL 0 

	reg [7:0] data      [15000:0];
	integer c,j;

	// Outputs
	wire [7:0] data_magnitude_out;

	// Bidirs
	
	integer file_read_data;
	integer file_write_data_magnitude;
	integer file_write_data_phase;	

	initial file_write_data_magnitude = $fopen("SWIMmagnitude.dat","w");

	initial begin
	file_read_data = $fopen("SAWIMsimulationV1.dat","r");
	if (file_read_data == `NULL) 
		begin
		$display("data_file handle was NULL");
		$finish;
		end
	end

	// Instantiate the Unit Under Test (UUT)
	STOSAvectorial_top uut (
	
		.clk_port(clk), 
		.reset_port(reset), 
		.PHASE_input_port(data_in),
		.CTRL_port(data_magnitude_out),
		.clk_SPIN_port(strb_SPIN_data),
		.clk_ADC_port(strb_ADC_data1)
	);
	

	always
		begin
			clk <= 0;
			#100;
			clk <= 1;
			#100;
		end

	initial begin
		// Initialize Inputs
		clk = 0;
		clk_enable = 0;
		reset = 1;
		data_in = 0;
		en = 0;
		j = 0;
		c = 0;
		write_data = 1;
	

		#10
		clk_enable = 1;
		reset = 0;
		en = 1;
		
		
		for (c=0; c<=15000; c=c+1)
			begin
			$fscanf (file_read_data,"%d\n", data[c]);
			end
//				data_in <= data[];
		end

		
//-----------------------------------------------------

//test[test_counter] <= captured_data;

always @(posedge clk)
	begin
		if (reset == 1) begin
			j <= 0;
		end
		else begin
		j <= j + 1;
//		data[j] <= j;
		data_in <= data[j];
		if (j>15000) j <= 0;
		end
	end


always @(posedge strb_SPIN_data)
	begin
		//wr_mes = 1;
		//$fdisplay(file_write_data, "%d\n",data_out);
		$fwrite (file_write_data_magnitude,"%d\n",data_magnitude_out);
		$fflush(file_write_data_magnitude);
	end
//-----------------------------------------------------

		
endmodule
