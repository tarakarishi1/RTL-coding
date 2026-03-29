module binary_to_gray #(parameter  N)(
    input [N-1 : 0]in,
    output [N-1 : 0] out
);
    wire [N-1:0]w;

    assign w = in>>1;
    assign out = w^in;

endmodule