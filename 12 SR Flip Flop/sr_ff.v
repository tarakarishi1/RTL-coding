module sr_ff(
    input clk,
    input S, R,
    output reg Q,Qn
);

    always @(posedge clk ) begin
        case ({S,R})
            2'b00: {Q,Qn} <= {Q,Qn};   // Hold state
            2'b01: {Q,Qn} <= 2'b01;    // Reset
            2'b10: {Q,Qn} <= 2'b10;    // Set
            2'b11: {Q,Qn} <= 2'bxx;    // Invalid
        endcase
    end
endmodule