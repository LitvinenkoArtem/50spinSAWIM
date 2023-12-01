onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 30 /STOSAvectorial_tb/clk
add wave -noupdate /STOSAvectorial_tb/clk_enable
add wave -noupdate /STOSAvectorial_tb/write_data
add wave -noupdate /STOSAvectorial_tb/reset
add wave -noupdate -format Analog-Step -height 90 -max 104.0 -min -105.0 /STOSAvectorial_tb/data_in
add wave -noupdate -format Analog-Step -height 74 -max 57.0 /STOSAvectorial_tb/uut/matrix_control_u/counter_up
add wave -noupdate /STOSAvectorial_tb/uut/matrix_control_u/Relational_Operator1_relop1
add wave -noupdate -format Analog-Step -height 74 -max 100.0 -min -56.0 /STOSAvectorial_tb/data_magnitude_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {32099275 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 438
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {58889824 ps}
