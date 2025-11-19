module jk_ff(
    input clk,
    input J,K,
    output reg Q,Qn
);

    always @(posedge clk ) begin
        case ({J,K})
            2'b00: {Q,Qn} <= {Q,Qn};   // Hold state
            2'b01: {Q,Qn} <= 2'b01;    // Reset
            2'b10: {Q,Qn} <= 2'b10;    // Set
            2'b11: {Q,Qn} <= {Qn,Q};    // Invalid
        endcase
    end
endmodule