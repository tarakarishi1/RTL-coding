module sr_latch_tb();
    logic S,R,Q,Qn;

    sr_latch dut(S,R,Q,Qn);
    int i;
    initial begin
        repeat(20) begin
        S = $random;
        R = $random;
        #1;
        end
    end
    initial begin
        $monitor("%b | %b | %b | %b ", S,R,Q,Qn);
    end
endmodule