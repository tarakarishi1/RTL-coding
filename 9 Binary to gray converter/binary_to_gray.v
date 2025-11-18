module binary_to_gray #(parameter  N = 4)(
    input [N-1 : 0]in,
    output reg [N-1 : 0] out
);
    integer j;
    always@(*) begin
        out[N-1] = in[N-1];
        for ( j = N-2; j>=0; j--) begin
            out[j] = in[j]^in[j+1];
        end    
    end
endmodule