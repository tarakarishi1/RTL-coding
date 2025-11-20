module odd_even_counter_tb();
    logic clk,rst,mode;
    logic [3:0]cnt;

    odd_even_counter dut (clk,rst,mode, cnt);

    initial #3 clk = 0;
    always #5 clk = ~clk;

    initial begin
        #7;
        rst =0;
        #30 rst = 1;
        #20 rst = 0;
        #30 rst = 1;
        #30 rst = 0;
        #30 rst = 1;
        #20 rst = 0;
        #30 rst = 1;
        #20 rst = 0;

    end

  initial begin
    mode = 0;
    #100 mode = 1;
    #100 mode = 0;
    #150 mode = 1;
  end

    initial begin
        $dumpfile("d_ff_dump.vcd");
        $dumpvars;

        $display(" time | rst | Mode | cnt");
        $display("------------------------");
        $monitor(" %4t  | %b  |  %b  | %d ", $time, rst, mode, cnt);

        #500 $finish;
    end
    
endmodule

