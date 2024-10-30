module bounded_counter_tb;
    // Testbench signals
    logic clk;
    logic reset_n;
    logic [3:0] count;

    // Instantiate the DUT (Device Under Test)
    bounded_counter uut (
        .clk(clk),
        .reset_n(reset_n),
        .count(count)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Reset generation
    initial begin
        reset_n = 0;
        #15 reset_n = 1;  // Release reset after 15 time units
    end

    // SVA Assertions with Bounded Repetition

    // Sequence to detect the release of reset
    sequence s_reset_release;
        !reset_n ##1 reset_n;
    endsequence

    // Sequence to check if the counter reaches a specific value (10) within a bounded time
    sequence s_count_reach;
        s_reset_release ##1 (count == 4'hA) [*1:10]; // Expect count to reach 10 within 10 cycles
    endsequence

    // Property to check bounded counter reach
    property p_count_reach_bounded;
        @(posedge clk) disable iff (!reset_n) s_count_reach;
    endproperty

    // Assertion
    a_count_reach_bounded: assert property (p_count_reach_bounded)
        else $error("Counter did not reach 10 within 10 cycles after reset!");

    // Simulation control
    initial begin
        // Observe the counter operation for a few cycles
        #200 $finish;
    end

endmodule
