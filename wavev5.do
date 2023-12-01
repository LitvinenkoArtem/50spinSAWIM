onerror {resume}
quietly virtual signal -install /STOSAvectorial_tb { /STOSAvectorial_tb/data_magnitude_out[6:0]} CTRLsigned
quietly virtual signal -install /STOSAvectorial_tb/uut { /STOSAvectorial_tb/uut/CTRL_port(6 downto 0)} CTRLattenuator
quietly virtual signal -install /STOSAvectorial_tb/uut {/STOSAvectorial_tb/uut/CTRL_port(7)  } CTRLshifter
quietly WaveActivateNextPane {} 0
add wave -noupdate /STOSAvectorial_tb/clk_enable
add wave -noupdate /STOSAvectorial_tb/write_data
add wave -noupdate /STOSAvectorial_tb/reset
add wave -noupdate -format Analog-Step -height 74 -max 57.0 /STOSAvectorial_tb/uut/matrix_control_u/counter_up
add wave -noupdate /STOSAvectorial_tb/uut/matrix_control_u/Relational_Operator1_relop1
add wave -noupdate -format Analog-Step -height 74 -max 126.99999999999997 -min -128.0 -radix decimal -childformat {{/STOSAvectorial_tb/uut/CTRL_port(7) -radix decimal} {/STOSAvectorial_tb/uut/CTRL_port(6) -radix decimal} {/STOSAvectorial_tb/uut/CTRL_port(5) -radix decimal} {/STOSAvectorial_tb/uut/CTRL_port(4) -radix decimal} {/STOSAvectorial_tb/uut/CTRL_port(3) -radix decimal} {/STOSAvectorial_tb/uut/CTRL_port(2) -radix decimal} {/STOSAvectorial_tb/uut/CTRL_port(1) -radix decimal} {/STOSAvectorial_tb/uut/CTRL_port(0) -radix decimal}} -expand -subitemconfig {/STOSAvectorial_tb/uut/CTRL_port(7) {-height 15 -radix decimal} /STOSAvectorial_tb/uut/CTRL_port(6) {-height 15 -radix decimal} /STOSAvectorial_tb/uut/CTRL_port(5) {-height 15 -radix decimal} /STOSAvectorial_tb/uut/CTRL_port(4) {-height 15 -radix decimal} /STOSAvectorial_tb/uut/CTRL_port(3) {-height 15 -radix decimal} /STOSAvectorial_tb/uut/CTRL_port(2) {-height 15 -radix decimal} /STOSAvectorial_tb/uut/CTRL_port(1) {-height 15 -radix decimal} /STOSAvectorial_tb/uut/CTRL_port(0) {-height 15 -radix decimal}} /STOSAvectorial_tb/uut/CTRL_port
add wave -noupdate /STOSAvectorial_tb/CTRLsigned
add wave -noupdate -format Analog-Step -height 74 -max 123.99999999999999 -min -128.0 -radix decimal -childformat {{/STOSAvectorial_tb/uut/CTRL_output(7) -radix decimal} {/STOSAvectorial_tb/uut/CTRL_output(6) -radix decimal} {/STOSAvectorial_tb/uut/CTRL_output(5) -radix decimal} {/STOSAvectorial_tb/uut/CTRL_output(4) -radix decimal} {/STOSAvectorial_tb/uut/CTRL_output(3) -radix decimal} {/STOSAvectorial_tb/uut/CTRL_output(2) -radix decimal} {/STOSAvectorial_tb/uut/CTRL_output(1) -radix decimal} {/STOSAvectorial_tb/uut/CTRL_output(0) -radix decimal}} -subitemconfig {/STOSAvectorial_tb/uut/CTRL_output(7) {-height 15 -radix decimal} /STOSAvectorial_tb/uut/CTRL_output(6) {-height 15 -radix decimal} /STOSAvectorial_tb/uut/CTRL_output(5) {-height 15 -radix decimal} /STOSAvectorial_tb/uut/CTRL_output(4) {-height 15 -radix decimal} /STOSAvectorial_tb/uut/CTRL_output(3) {-height 15 -radix decimal} /STOSAvectorial_tb/uut/CTRL_output(2) {-height 15 -radix decimal} /STOSAvectorial_tb/uut/CTRL_output(1) {-height 15 -radix decimal} /STOSAvectorial_tb/uut/CTRL_output(0) {-height 15 -radix decimal}} /STOSAvectorial_tb/uut/CTRL_output
add wave -noupdate -format Analog-Step -height 74 -max 255.0 -min 2.0 -radix unsigned /STOSAvectorial_tb/uut/matrix_control_u/PHASE_in_unsigned
add wave -noupdate -format Analog-Step -height 74 -max 124.99999999999999 -min -127.0 -radix decimal /STOSAvectorial_tb/uut/matrix_control_u/PHASE_in_signed
add wave -noupdate -height 30 /STOSAvectorial_tb/clk
add wave -noupdate -format Analog-Step -height 74 -max 252.0 -radix unsigned /STOSAvectorial_tb/data_in
add wave -noupdate -format Analog-Step -height 74 -max 126.0 -radix binary /STOSAvectorial_tb/uut/CTRLattenuator
add wave -noupdate /STOSAvectorial_tb/uut/CTRLshifter
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {779700000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 188
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {1442209195 ps} {1482944331 ps}
