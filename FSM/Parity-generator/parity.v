`timescale 1ns / 1ps

module parity (
    input  clk,
    input  x,
    output reg z
);

    reg state;  // 0 = EVEN, 1 = ODD

    parameter EVEN = 1'b0,
            ODD  = 1'b1;

    always @(posedge clk)
    begin
        case (state)
            EVEN: state <= x ? ODD : EVEN;
            ODD : state <= x ? EVEN : ODD;

            default: state <= EVEN;
        endcase
    end

    always @(state)
    begin
        case (state)
            EVEN: z = 1'b0;
            ODD : z = 1'b1;

            default: z = 1'b0;
        endcase
    end

    initial
        state = EVEN;

endmodule
