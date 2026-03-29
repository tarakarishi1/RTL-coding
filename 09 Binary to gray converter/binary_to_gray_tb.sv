`timescale 1ns/1ps

module tb_binary_to_gray;

    parameter N = 3;

    reg  [N-1:0] in;
    wire [N-1:0] out;

    // DUT
    binary_to_gray #(N) dut (
        .in(in),
        .out(out)
    );

    integer i;

    initial begin
        $display("Time\tin\tout");
        $display("---------------------");

        for (i = 0; i < (1<<N); i = i + 1) begin
            in = i;
            #10;
            $display("%0t\t%b\t%b", $time, in, out);
        end

        $finish;
    end

endmodule