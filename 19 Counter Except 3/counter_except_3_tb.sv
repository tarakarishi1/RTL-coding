module counter_except_3_tb();
    localparam  N = 5;
    logic clk,rst;
    logic [N-1:0]cnt;

    counter_except_3 #(N) dut(clk, rst, cnt);

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        #2;
        rst =1;
        #3 rst = 0;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;

        $display(" time | rst  | cnt");
        $display("--------------------");
        $monitor(" %4t  | %b   | %d ", $time, rst, cnt);

        #1000 $finish;
    end


endmodule