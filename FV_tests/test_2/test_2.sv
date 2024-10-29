module my_design (
    input logic clk,
    input logic reset,
    input logic in,
    output logic out
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            out <= 1'b0;
        else
            out <= in;
    end

endmodule

