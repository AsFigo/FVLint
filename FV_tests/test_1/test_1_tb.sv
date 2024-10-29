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
    #10 reset = 0;

    // Wait until count reaches MAX_VALUE
    wait (count == MAX_VALUE);
    $display("Count reached MAX_VALUE as expected.");
    
    $finish;
end

// Replace expect with assert
// Property to check that count reaches MAX_VALUE without non-synthesizable operators
property count_reaches_max;
    @(posedge clk) disable iff (reset) (count == MAX_VALUE); // Only use synthesizable equality operator
endproperty

// Assert without non-synthesizable operators
assert property (count_reaches_max) else
  $fatal(1,"Error: count did not reach MAX_VALUE.");

endmodule

