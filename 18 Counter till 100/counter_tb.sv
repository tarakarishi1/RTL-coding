module counter_tb();
    logic clk,rst;
    logic [6:0]cnt;

    counter dut (clk,rst, cnt);

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        #2;
        rst =1;
        #1  rst = 0;
        #4  rst = 1;
        #15 rst = 0;
        #200 rst = 1;
        #20 rst = 0;


        
    end
    initial begin
        $dumpfile("d_ff_dump.vcd");
        $dumpvars;
    end

    initial begin
        #1;
        $display(" time | rst | cnt");
        $display("-------------------");
        $monitor("%4t   | %b  | %d ", $time, rst, cnt);
        #1500 $finish;
    end



endmodule

