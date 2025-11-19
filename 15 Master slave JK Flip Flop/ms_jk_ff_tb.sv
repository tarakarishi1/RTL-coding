`timescale 1ns/1ps

module ms_jk_ff_tb;

    // --------------------------------------------------------------------
    // DUT signals
    // --------------------------------------------------------------------
    logic clk;
    logic J, K;
    logic Q, Qn;

    // --------------------------------------------------------------------
    // DUT instantiation
    // --------------------------------------------------------------------
    ms_jk_ff dut (
        .clk(clk),
        .J  (J),
        .K  (K),
        .Q  (Q),
        .Qn (Qn)
    );

    // --------------------------------------------------------------------
    // Clock generation (10 ns period)
    // --------------------------------------------------------------------
    initial clk = 0;
    always #5 clk = ~clk;

    // --------------------------------------------------------------------
    // Task to apply J,K for one full clock cycle
    // --------------------------------------------------------------------
    task automatic apply_jk(input logic j, input logic k);
    begin
        J = j;
        K = k;
        @(posedge clk);   // master latch samples J,K
        @(negedge clk);   // slave latch updates Q,Qn
        #1;               // small delay for monitor printing
    end
    endtask

    // --------------------------------------------------------------------
    // Test sequence
    // --------------------------------------------------------------------
    initial begin
        J = 0;
        K = 0;

        @(negedge clk);

        $display(" time | J K | Q Qn");
        $display("----------------------");
        $monitor("%4t | %b %b | %b %b", $time, J, K, Q, Qn);

        // Hold
        apply_jk(0,0);
        apply_jk(0,0);

        // Reset
        apply_jk(0,1);

        // Hold
        apply_jk(0,0);

        // Set
        apply_jk(1,0);

        // Hold
        apply_jk(0,0);

        // Toggle multiple times
        apply_jk(1,1);
        apply_jk(1,1);
        apply_jk(1,1);
        apply_jk(1,1);

        // Mixed sequence
        apply_jk(0,1);  // R
        apply_jk(1,0);  // S
        apply_jk(1,1);  // Toggle
        apply_jk(0,0);  // Hold

        #10;
        $finish;
    end

    // --------------------------------------------------------------------
    // VCD dump
    // --------------------------------------------------------------------
    initial begin
        $dumpfile("ms_jk_ff.vcd");
        $dumpvars(0, ms_jk_ff_tb);
    end

endmodule
