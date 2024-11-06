module counter #(parameter MAX_VALUE = 8) (
    input wire clk,
    input wire reset,
    output reg [3:0] count
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 0;
    end else if (count < MAX_VALUE) begin
        count <= count + 1;
    end
end

endmodule

