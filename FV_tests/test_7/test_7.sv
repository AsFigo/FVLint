module counter(
    input wire clk,
    input wire reset,
    output reg [3:0] count
);

always @(posedge clk or posedge reset) begin
    if (reset) 
        count <= 0;
    else
        count <= count + 1;
end

endmodule

