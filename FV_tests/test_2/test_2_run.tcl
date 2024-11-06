# TCL file for running ModelSim with counter_tb

## Setup Specific to DUT
set design my_design
## Compile & Setup
vlib work
vlog -sv ../test_2/test_2.sv -work work  ;# Compile the RTL file
vlog -sv ../test_2/test_2_tb.sv -work work ;# Compile the testbench

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
