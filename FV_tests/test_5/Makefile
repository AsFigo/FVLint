run: 
	vlib work
	vlog -sv -mfcu  test_5.sv test_5_tb.sv -l comp_log.log
	vsim -c tb -do "run -all;exit" -l run_log.log
