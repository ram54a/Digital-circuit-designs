`timescale 1ns / 1ps

module parity_tb;

    reg x, clk;
    wire z;

    parity dut (
        .clk(clk),
        .x(x),
        .z(z)
    );

    always #5 clk = ~clk;

    initial
    begin
        clk = 1'b0;
        x   = 1'b0;

        #5  x = 1'b0;
        #5  x = 1'b0;
        #5  x = 1'b1;
        #5  x = 1'b0;
        #5  x = 1'b1;
        #5  x = 1'b1;

        #100 $finish;
    end

endmodule
