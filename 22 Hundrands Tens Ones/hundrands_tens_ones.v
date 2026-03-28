module hundrands_tens_ones(
    input clk,
    output h,t,o,
);
    integer h;
    integer t;
    integer o;
    wire integer cnt = 0;
    always @(posedge clk ) begin
        cnt = cnt+1;
        {h,t,o} = cnt;
        $display("%d %d %d", h,t,o);
        
    end
endmodule