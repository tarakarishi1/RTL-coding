module sr_ff_tb();
    logic clk = 0,S,R,Q,Qn;

    sr_ff dut(clk, S, R, Q, Qn);

    always #5 clk <= ~clk;

initial begin
    repeat(20) begin
        #2 S = $random;
        R = $random;
    end
end

 initial begin
        $display("T | S | R | Q | Qn");
        $display("------------------");
        $monitor("%d | %b | %b | %b | %b ",$time, S,R,Q,Qn);
    end

initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
end

initial begin
    #200 $finish;
end    

endmodule