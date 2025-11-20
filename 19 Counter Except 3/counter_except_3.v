module counter_except_3 #(N)(
    input clk, rst,
    output reg [N-1:0] cnt
);
    always @(posedge clk or posedge rst) begin

        if(rst || (cnt == ((1<<N)-1)))          // (1<<N) is nothing but 2 power N(2^N)
             cnt = 0;

        else if (!rst) begin
            if ((cnt % 3)== 2)              // % is used to find the remainder
                cnt = cnt + 2;
            else
                cnt = cnt + 1;
        end
    end
endmodule

module moduleName #(
    parameters
) (
    ports
);
    
endmodule