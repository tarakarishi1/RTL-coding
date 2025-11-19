`timescale 1ns/1ps

module binary_to_gray_tb;

    localparam N = 4;

    logic [N-1:0] in;
    logic [N-1:0] out;

    // DUT instantiation (matching your port names)
    binary_to_gray #(.N(N)) dut (
        .in(in),    // adjust if your DUT uses .in
        .out(out)   // adjust if your DUT uses .out
    );

    // Expected value
    logic [N-1:0] expected;

    // Function to compute expected gray value
    function automatic [N-1:0] calc_gray(input [N-1:0] b);
        calc_gray = b ^ (b >> 1);
    endfunction

    initial begin
        $display("Starting Binary-to-Gray Testbench");

        // Iterate through all possible input combinations
        for (int i = 0; i < (1 << N); i++) begin
            in = i;
            expected = calc_gray(in);

            #5; // allow DUT to settle (combinational)

            if (out !== expected) begin
                $error("Mismatch: in=%b out=%b expected=%b",
                       in, out, expected);
            end
            else begin
                $display("OK: in=%b -> out=%b", in, out);
            end
        end

        $display("Test Completed");
        $finish;
    end

endmodule
