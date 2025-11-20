module odd_even_counter(
    input clk, rst, mode,
    output reg [3:0] cnt
);
    always @(posedge clk or posedge rst or posedge mode or negedge mode) begin
        if (rst || cnt == 4'b111x)
            if(mode)
                cnt = 1;
            else
                cnt = 0;            
        else if (!rst)
            cnt = cnt + 4'b0010;       
    end

    always @(posedge mode) begin
        cnt = 4'b0001;        
    end

    always @(negedge mode )
        cnt = 4'b0000;
    
endmodule