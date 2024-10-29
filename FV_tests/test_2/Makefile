run: 
	vlib work
	vlog -sv -mfcu  test_2.sv test_2_tb.sv -l comp_log.log
	vsim -c tb -do "run -all;exit" -l run_log.log
