# Variables
VLOG = vlog
VSIM = vsim
SIM_NAME = counter_tb   # Top-level testbench module name (change this if needed)
RTL_FILES = test_1.sv   # RTL and assertion files
TB_FILE = test_1_tb.sv  # Testbench file
WORK_LIB = work         # Work library name
TCL_SCRIPT = test_1_run.tcl  # TCL script for simulation

# Targets
all: compile

compile:
	# Create the work library if it doesn't exist
	vlib $(WORK_LIB)
	# Compile the design and testbench files
	$(VLOG) -work $(WORK_LIB) $(RTL_FILES) $(TB_FILE)

run:compile
	# Run the simulation in command-line mode
	#$(VSIM) -c work.$(WORK_LIB) -l simulation.log -do $(TCL_SCRIPT)
	vsim -c -work work work.counter_tb -l simulation.log -do "test_1_run.tcl"

clean:
	# Clean up the compiled files and work library
	vdel -all
