module counter_tb;

    reg clk;
    reg reset;
    wire [3:0] count;

    parameter MAX_VALUE = 8;
    counter #(MAX_VALUE) uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        reset = 1;
        $display("Time %0t: Resetting the counter...", $time);
        #10 reset = 0;
        $display("Time %0t: Counter reset de-asserted. Starting the count...", $time);

        // Monitor the count value at every positive clock edge
        forever @(posedge clk) begin
            $display("Time %0t: Current count value = %0d", $time, count);
        end
    end

    // Wait until count reaches MAX_VALUE
    initial begin
        wait (count == MAX_VALUE);
        $display("Time %0t: Count reached MAX_VALUE as expected.", $time);
        $finish;
    end

    // Property to check that count reaches MAX_VALUE without non-synthesizable operators
    property count_reaches_max;
        @(posedge clk) disable iff (reset) (count == MAX_VALUE); // Only use synthesizable equality operator
    endproperty

    // Assert without non-synthesizable operators
    assert property (count_reaches_max) else
        $fatal(1, "Error: count did not reach MAX_VALUE.");

endmodule

