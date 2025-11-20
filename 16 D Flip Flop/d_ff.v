module d_ff(
    input clk,
    input D,
    output reg Q,
    output Qn
);
    assign Qn = ~ Q;
    always @(posedge clk ) begin
        Q <= D;
    end
endmodule