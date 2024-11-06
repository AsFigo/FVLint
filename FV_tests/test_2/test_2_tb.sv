module tb;

   
    logic clk;
    logic reset;
    logic in;
    logic out;

    my_design dut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );

    
    always begin
        #5 clk = ~clk;
    end

    
    initial begin
        clk = 0;
        reset = 0;
        in = 0;
        #10 reset = 1;
        #10 reset = 0;
       
    end

    
    initial begin
        #20 in = 1;    
        #30 in = 0;    
        #40 in = 1; 
         #20 $finish;
    end

    // SVA without dist (No distribution)
    property p_check_in_values;
        @(posedge clk)
        disable iff (reset)
        (in == 1'b0) || (in == 1'b1);
    endproperty

    // Assertion to check property
    assert property (p_check_in_values);
    initial begin
     
        $monitor("\t %b   %b    %b   %b", clk, reset, in, out);
    end  

endmodule

