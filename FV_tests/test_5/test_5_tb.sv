module tb;
    logic clk;
    logic reset;
    logic d;
    logic q;

  
    dff dut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        reset = 1;
        d = 0;
        #10 reset = 0;
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #20 $finish;
    end

    // Assertion with disable iff
    property p_disable_iff;
        @(posedge clk) disable iff (reset) d |=> (q == $past(d));
    endproperty

    a_disable_iff: assert property(p_disable_iff)
        else $error("Assertion failed: q did not follow d correctly.");

endmodule

