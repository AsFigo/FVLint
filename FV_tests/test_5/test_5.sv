module dis (
    input logic clk,
    input logic reset,
    input logic en,
    input logic [7:0] data_in,
    output logic [7:0] data_out
);

  
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            data_out <= 8'b0;
        else if (en)
            data_out <= data_in;
    end

 
    property data_check;
        @(posedge clk) disable iff (reset)
            (en |-> (data_out == data_in));
    endproperty
    assert property(data_check)
        else $error("Data output does not match data input when enable is high.");

      endmodule

