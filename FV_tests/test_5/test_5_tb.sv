module tb;

    logic clk;
    logic reset;
    logic en;
    logic [7:0] data_in;
    logic [7:0] data_out;

    dis dut (
        .clk(clk),
        .reset(reset),
        .en(en),
        .data_in(data_in),
        .data_out(data_out)
    );

  
    always #5 clk = ~clk;

  
    initial begin
       
        clk = 0;
        reset = 1;
        en = 0;
        data_in = 8'hAA;
        
        #10 reset = 0;
  
        #10 en = 1;
        data_in = 8'h55;
        #10 data_in = 8'h33;
       
        #10 en = 0;
        data_in = 8'h99;
        #10 reset = 1;
        #10 reset = 0;
        en = 1;
        data_in = 8'hF0;

        #20 $finish;
    end

    initial begin
        $monitor(" clk=%0b | reset=%0b | en=%0b | data_in=%0h | data_out=%0h",
                   clk, reset, en, data_in, data_out);
    end

endmodule

