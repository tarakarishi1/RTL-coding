module gray_to_binary#(parameter N = 8)(
    input [N-1:0]gray,
    output reg [N-1:0]bin
);
    integer j;
    always @(*) begin
        bin[N-1] = gray[N-1];
        for (j = N-2;j>=0 ;j-- ) begin

            bin[j] = gray[j]^gray[j+1];
            
        end
        
    end

endmodule

