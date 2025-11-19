module jk_latch_tb();
    logic J,K,Q,Qn ;
    jk_latch dut(J,K,Q,Qn);

    int i;
    initial begin
        repeat(20) begin
        J = $random;
        K = $random;
        #1;
        end
    end
    initial begin
        $display("J | K | Q | Qn");
        $display("--------------");
        $monitor("%b | %b | %b | %b ", J,K,Q,Qn);
    end



endmodule