module dff(
    input logic clk,
    input logic reset,
    input logic d,
    output logic q
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end

endmodule

