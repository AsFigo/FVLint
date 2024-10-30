module counter_tb;
    
    logic clk;
    logic reset_n;
    logic [3:0] count;

    
    counter uut (
        .clk(clk),
        .reset_n(reset_n),
        .count(count)
    );

   
    initial clk = 0;
    always #5 clk = ~clk;

    
    initial begin
        reset_n = 0;
        #15 reset_n = 1;
    end

    // SVA: Assertions to avoid sequence intersection

    // Sequence: Detect reset signal
    sequence s_reset;
        !reset_n ##1 reset_n;
    endsequence

    // Sequence: Count increments after reset
    sequence s_count_incr;
        s_reset ##1 (count == 4'b0001) ##1 (count == 4'b0010);
    endsequence

    // Property: Ensure the count increments sequentially after reset
    property p_count_incr_no_intersect;
        @(posedge clk) disable iff (!reset_n) s_count_incr;
    endproperty

    // Assert the property without using intersection
    a_count_incr_no_intersect: assert property (p_count_incr_no_intersect)
        else $error("Counter did not increment as expected after reset!");

    
    initial begin
        #100 $finish;
    end

endmodule
