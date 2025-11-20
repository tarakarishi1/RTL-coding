module up_down_counter_tb();
    logic clk,rst,M;
    logic [3:0]cnt;
    up_down_counter dut(clk,rst,M, cnt);

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        #2;
        rst =1;
        #3 rst = 0;
    end

    initial begin
        M = 1;
        #198;
        M = 0;
    end

    initial begin
        $dumpfile("dumpf.vcd");
        $dumpvars;

        $display(" time | rst  |  M  | cnt");
        $display("-------------------------");
        $monitor(" %4t  |  %b  | %b | %d ", $time, rst, M,cnt);

        #300 $finish;
    end

endmodule

