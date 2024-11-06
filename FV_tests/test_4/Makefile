# Makefile for running FV code in ModelSim

# Variables
VLOG = vlog
VSIM = vsim
SIM_NAME = counter_tb   # Top-level testbench module name
RTL_FILES = test_4.sv   # RTL and assertion files
TB_FILE = test_4_tb.sv  # Testbench file
WORK_LIB = work         # Work library name
TCL_SCRIPT = test_4_run.tcl  # TCL script for simulation

# Targets
all: compile

compile:
	# Create the work library if it doesn't exist
	vlib $(WORK_LIB)
	# Compile the design and testbench files
	$(VLOG) -work $(WORK_LIB) $(RTL_FILES) $(TB_FILE)

run: compile
	# Run the simulation in command-line mode
	#$(VSIM) -c $(WORK_LIB).$(SIM_NAME) -l simulation.log -do "run -all; exit"
	vsim -c -work work work.counter_tb -l simulation.log -do "test_4_run.tcl" 

clean:
	vdel -all
