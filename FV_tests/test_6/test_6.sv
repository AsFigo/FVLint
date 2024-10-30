module bounded_counter (
    input  logic clk,
    input  logic reset_n,
    output logic [3:0] count
);

    // Increment the counter every clock cycle, reset when reset_n is low
    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            count <= 4'b0;
        else
            count <= count + 1;
    end

endmodule
