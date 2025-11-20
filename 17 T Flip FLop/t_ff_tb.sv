module t_ff_tb();
    logic T,clk,clear,Q;
    t_ff dut(T,clk,clear,Q);
    
    initial clk = 0;
    always #5 clk = ~clk;

    task automatic apply(input logic t);
        T<=t;
        @(posedge clk);
        #2;
    endtask //automatic
    initial begin
        #1;
        $display("-----------------------");
        $display("| Time |clear | T | Q |");
        $display("-----------------------");
    end

    always@(posedge clk) begin
    #1;         
        $display("| %4t |   %b  | %b | %b |", $time, clear,T,Q);
    end

    initial begin
        clear<=0;
        apply(1);
        apply(0);
        #2 clear = 1;

        apply(0);
        apply(0);
        apply(1);
        apply(1);
        repeat(10) apply($random);
        #1;

        
    end
    initial begin
        $dumpfile("d_ff_dump.vcd");
        $dumpvars;
    end

    initial begin
            
        #190; 
        $finish;
        end    

endmodule