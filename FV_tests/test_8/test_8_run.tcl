
set design counter
vlib work
vlog -sv ../test_8/test_8.sv -work work  ;
vlog -sv ../test_8/test_8_tb.sv -work work ;

## Clock and Reset Definitions
#force -freeze sim:/counter_tb/clk 0 0, 1 {5 ns} -repeat 10 ns

# Force reset signal (assuming the reset signal name is 'reset')
#force -freeze sim:/counter_tb/reset 1 0, 0 {10 ns} -repeat 100 ns

## Run the Simulation
# Run the simulation until the test completes
run -all

## Reports and Exit
# Example: write simulation output
write list -output results.txt

# Exit ModelSim
exit
