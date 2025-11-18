module gray_to_binary_tb();

    localparam N = 4;
    logic [N-1:0] gray;
    logic [N-1:0] bin;

    gray_to_binary #(.N(N)) dut(
        gray,bin
    );
    logic [N-1:0] expected;

    function automatic [N-1:0] calc_bin(input [N-1:0] b);
        calc_bin = b ^ (b >> 1);
    endfunction

    initial begin
        $display("Starting Gray-to-Binary Testbench");

        // Iterate through all possible input combinations
        for (int i = 0; i < (1 << N); i++) begin
            gray = i;
            expected = calc_bin(gray);

            #5; // allow DUT to settle (combinational)

            if (bin !== expected) begin
                $error("Mismatch: gray=%b bin=%b expected=%b",
                       gray, bin, expected);
            end
            else begin
                $display("OK: in=%b -> out=%b", gray, bin);
            end
        end

        $display("Test Completed");
        $finish;
    end

endmodule