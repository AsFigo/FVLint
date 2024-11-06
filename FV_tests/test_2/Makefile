# Variables
VLOG = vlog
VSIM = vsim
SIM_NAME = tb   # Top-level testbench module name (change this if needed)
RTL_FILES = test_2.sv   # RTL and assertion files
TB_FILE = test_2_tb.sv  # Testbench file
WORK_LIB = work         # Work library name
TCL_SCRIPT = test_2_run.tcl  # TCL script for simulation

# Targets
all: compile

compile:
	# Create the work library if it doesn't exist
	vlib $(WORK_LIB)
	# Compile the design and testbench files
	$(VLOG) -work $(WORK_LIB) $(RTL_FILES) $(TB_FILE)

run: compile
	# Run the simulation in command-line mode
	#$(VSIM) -c $(WORK_LIB).tb -l simulation.log -do $(TCL_SCRIPT)
	vsim -c -work work work.tb -l simulation.log -do "test_2_run.tcl"

clean:
	# Clean up the compiled files and work library
	vdel -all

