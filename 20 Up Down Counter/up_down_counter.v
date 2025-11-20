module up_down_counter(
    input  wire clk,
    input  wire rst,
    input  wire M,
    output reg  [3:0] cnt
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            cnt <= 4'b0000;
        else if (M) begin
            if (cnt == 4'b1111)
                cnt <= 4'b0000;
            else
                cnt <= cnt + 1;
        end
        else begin
            if (cnt == 4'b0000)
                cnt <= 4'b1111;
            else
                cnt <= cnt - 1;
        end
    end

endmodule
