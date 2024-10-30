module counter_tb;

    reg clk;
    reg reset;
    wire [3:0] count;

    // Define parameters for max repetition count and value
    parameter int MAX_REPEATS = 5;
    parameter [3:0] MAX_VALUE = 4'b1111;

    // Instantiate the counter
    counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generation with display
    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
            $display("Time: %0t | Clock: %b | Reset: %b | Count: %0d", $time, clk, reset, count);
        end
    end

    // Reset sequence and simulation control
    initial begin
        reset = 1;
        #10 reset = 0;

        // Simulate for a sufficient amount of time
        #100;
        $finish;
    end

    // Property to check that count reaches MAX_VALUE within MAX_REPEATS non-contiguous cycles
    property count_reaches_max_bounded;
        @(posedge clk) disable iff (reset) (count == MAX_VALUE) [=1:MAX_REPEATS]; 
    endproperty

    //Assert with bounded constraints and display statement
    initial begin
        assert property (count_reaches_max_bounded) else begin
            $fatal(1, "Error: count did not reach MAX_VALUE within the specified bound. Current Count: %0d at time %0t", count, $time);
        end
    end

endmodule

