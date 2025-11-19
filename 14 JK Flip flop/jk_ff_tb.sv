module jk_ff_tb();
    logic clk = 0,J,K,Q,Qn;

    jk_ff dut(clk, J,K, Q, Qn);

    always #5 clk <= ~clk;

initial begin
    repeat(20) begin
        #2 J = $random;
        K = $random;
    end
end

 initial begin
        $display("T | J | K | Q | Qn");
        $display("------------------");
        $monitor("%d | %b | %b | %b | %b ",$time, J,K,Q,Qn);
    end

initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
end

initial begin
    #200 $finish;
end    

endmodule