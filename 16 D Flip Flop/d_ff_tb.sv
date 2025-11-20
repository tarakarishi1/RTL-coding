module d_ff_tb();
    logic clk,D,Q,Qn;
    d_ff dut(clk,D,Q,Qn);

        initial  clk = 0;
       always #5 clk <= ~clk;

        task automatic apply(input logic d); begin
            D = d; 
            @(posedge clk);
            #2;  
        end     
        endtask 

        initial begin
            $display(" time | D | Q Qn");
            $display("-------------------");
            $monitor("%4t | %b | %b %b", $time, D, Q, Qn);
            D <= 0;
            @(posedge clk);
            apply(0);
            apply(1);
            apply(1);
            apply(0);
            apply(1);
            repeat(10) apply($random);
            #10;
            $dumpfile("d_ff_dump.vcd");
            $dumpvars;
        end

        initial begin
            
            #100 $finish;
        end    

endmodule