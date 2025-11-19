// module ms_jk_ff_tb();
//     logic clk = 0,J,K,Q,Qn;

//     ms_jk_ff dut(clk, J,K, Q, Qn);

//     always #5 clk <= ~clk;

// initial begin
//     repeat(20) begin
//         #2 J = $random;
//         K = $random;
//     end
// end

//  initial begin
//         $display("T | J | K | Q | Qn");
//         $display("------------------");
//         $monitor("%d | %b | %b | %b | %b ",$time, J,K,Q,Qn);
//     end

// initial begin
//     $dumpfile("dump.vcd");
//     $dumpvars;
// end

// initial begin
//     #250 $finish;
// end    

// endmodule



`timescale 1ns/1ps

module ms_jk_ff_tb;

    reg clk;
    reg J, K;
    wire Q, Qn;

    // DUT instantiation
    ms_jk_ff dut (
        .clk(clk),
        .J  (J),
        .K  (K),
        .Q  (Q),
        .Qn (Qn)
    );

    // Clock: 10 ns period
    initial clk = 1'b0;
    always #5 clk = ~clk;

    // Task to apply one JK combination for one full clock cycle
    task apply_jk(input [1:0] jk);
    begin
        {J, K} = jk;
        @(posedge clk);   // master samples J,K
        @(negedge clk);   // slave updates Q,Qn
        #1;               // small delay for monitor
    end
    endtask


    initial begin

        // Init
        J = 0;
        K = 0;
        @(negedge clk);   // let initial state settle

        $display(" time | J K | Q Qn");
        $display("-------------------");
        $monitor("%4t | %b %b | %b %b", $time, J, K, Q, Qn);

        // 1) Hold (00) – should keep whatever Q is
        apply_jk(2'b00);
        apply_jk(2'b00);

        // 2) Reset (01): Q=0, Qn=1
        apply_jk(2'b01);

        // 3) Hold again
        apply_jk(2'b00);

        // 4) Set (10): Q=1, Qn=0
        apply_jk(2'b10);

        // 5) Hold again
        apply_jk(2'b00);

        // 6) Toggle (11): Q flips each cycle
        apply_jk(2'b11);  // toggle 1
        apply_jk(2'b11);  // toggle 2
        apply_jk(2'b11);  // toggle 3
        apply_jk(2'b11);  // toggle 4

        // 7) Mix sequence: Reset -> Set -> Toggle -> Hold
        apply_jk(2'b01);  // Reset
        apply_jk(2'b10);  // Set
        apply_jk(2'b11);  // Toggle
        apply_jk(2'b00);  // Hold

        #10;
        $finish;
    end

    // VCD dump
    initial begin
        $dumpfile("ms_jk_ff.vcd");
        $dumpvars(0, ms_jk_ff_tb);
    end
endmodule