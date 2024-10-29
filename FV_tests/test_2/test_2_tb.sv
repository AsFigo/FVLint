module tb;
    // Testbench signals
    logic clk, reset, in, out;
    logic assertion_failed;  
    my_design uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        reset = 1;
        #20 reset = 0;
    end

    always @(posedge clk) begin
        if (!reset && !$isunknown(in) && !$isunknown(out) && (out != $past(in))) begin
            assertion_failed <= 1;  
        end else begin
            assertion_failed <= 0;
        end
    end

    initial begin
        in = 0;
        #25 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 $finish;
    end

    initial begin
        wait(assertion_failed);
        $display("Assertion failed: 'out' did not follow 'in'");
        $finish;
    end

endmodule

