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

//Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; 
end

//Reset sequence and simulation control
initial begin
    reset = 1;
    #10 reset = 0;

    #100;
    $finish;
end

//Property to check that count reaches MAX_VALUE
property count_reaches_max;
    @(posedge clk) disable iff (reset) (count == MAX_VALUE);
endproperty

//Assert without local variables in SVA
initial begin
    assert property (count_reaches_max) else
        $fatal(1, "Error: count did not reach MAX_VALUE.");
end

//Display the count value at each clock edge
always @(posedge clk) begin
    if (!reset) begin
        $display("At time %0t: count = %0d", $time, count);
    end
end
endmodule

