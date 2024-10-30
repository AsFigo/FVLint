run:
	vlib work
	vlog -sv -mfcu test_7.sv test_7_tb.sv -l comp_log.log
	vsim -c counter_tb -do "run -all;exit" -l run_log.log
