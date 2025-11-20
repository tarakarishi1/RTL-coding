module t_ff(
    input T, clk, clear,
    output reg Q
);
    always @(posedge clk) begin
        if(!clear) begin
            Q<=0;
        end
        else begin
            if (T)
                Q<=~Q;   
        end
    end
endmodule