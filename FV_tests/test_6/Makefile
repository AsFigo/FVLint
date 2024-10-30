run:
	vlib work
	vlog -sv -mfcu  test_6.sv test_6_tb.sv -l comp_log.log
	vsim bounded_counter_tb -do "run -all;exit" -l run_log.log
