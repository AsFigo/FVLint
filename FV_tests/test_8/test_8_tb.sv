module tb;
    reg clk;
    reg reset;
    wire [3:0] count;
    reg triggered_once;

    counter dut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

   
    initial clk = 0;
    always #5 clk = ~clk;

   
    initial begin
        reset = 1;
        triggered_once = 0;
        #10 reset = 0;
        #20 $finish;
    end

    // Assertion without first_match
    property p_counter_reaches_10_no_first_match;
        @(posedge clk) (count == 4'b1010 && !triggered_once) |-> ##1 $stable(count);
    endproperty

    a_counter_reaches_10_no_first_match: assert property(p_counter_reaches_10_no_first_match)
        else $error("Assertion failed: count did not stabilize at 10.");

    // Set flag after the first trigger
    always @(posedge clk) begin
        if (reset) begin
            triggered_once <= 0;
        end else if (count == 4'b1010) begin
            triggered_once <= 1;
        end
    end
     initial begin
        $monitor("Time: %0t, clk: %b, reset: %b, count: %0d", $time, clk, reset, count);
    end
endmodule

