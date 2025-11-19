module comparator(
    input [2:0] in1, in2,
    output reg lesser, equal, greater
);

    always @(*) begin
        {lesser, equal, greater} = 3'b000;

        if (in1<in2)
            lesser = 1'b1;
        else if (in1>in2)
            greater = 1'b1;
        else
            equal = 1'b1;
    end

endmodule