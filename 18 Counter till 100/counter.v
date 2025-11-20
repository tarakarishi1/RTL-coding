module counter(
    input clk,rst,
    output reg [6:0]cnt
);
    always @(posedge clk or posedge rst ) begin
        if (rst || cnt == 7'b1100011) begin
            cnt <= 7'b0;
        end
        else begin
            cnt = cnt + 7'b0000_001;
        end        
    end
endmodule